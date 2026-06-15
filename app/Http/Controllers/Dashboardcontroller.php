<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    /**
     * Build shared date/location WHERE clauses from request filters.
     */
    private function buildFilters(Request $request): array
    {
        $dateFrom  = $request->input('date_from');
        $dateTo    = $request->input('date_to');
        $period    = $request->input('period');        // quarterly | semi | annual
        $country   = $request->input('country');
        $city      = $request->input('city');

        // Resolve period shortcut → date range (overrides manual dates)
        if ($period) {
            [$dateFrom, $dateTo] = $this->resolvePeriod($period);
        }

        return compact('dateFrom', 'dateTo', 'country', 'city');
    }

    private function resolvePeriod(string $period): array
    {
    // Dynamically look up the most recent year in your actual orders table
    $year = DB::table('orders')->max(DB::raw('YEAR(orderDate)'));

    // Fallback to the current year if the table happens to be completely empty
    if (!$year) {
        $year = now()->year;
    }

        switch ($period) {
            case 'q1': return ["{$year}-01-01", "{$year}-03-31"];
            case 'q2': return ["{$year}-04-01", "{$year}-06-30"];
            case 'q3': return ["{$year}-07-01", "{$year}-09-30"];
            case 'q4': return ["{$year}-10-01", "{$year}-12-31"];
            case 'h1': return ["{$year}-01-01", "{$year}-06-30"];
            case 'h2': return ["{$year}-07-01", "{$year}-12-31"];
            case 'annual': return ["{$year}-01-01", "{$year}-12-31"];
            default:   return [null, null];
        }
    }

    /**
     * Apply date + location filters to a query builder instance.
     * $dateTable  = the table that owns orderDate
     * $cityTable  = the table that owns city / country (usually 'customers')
     */
    private function applyFilters($query, array $f, string $dateTable = 'orders', string $cityTable = 'customers'): void
    {
        if ($f['dateFrom']) {
            $query->where("{$dateTable}.orderDate", '>=', $f['dateFrom']);
        }
        if ($f['dateTo']) {
            $query->where("{$dateTable}.orderDate", '<=', $f['dateTo']);
        }
        if ($f['country']) {
            $query->where("{$cityTable}.country", $f['country']);
        }
        if ($f['city']) {
            $query->where("{$cityTable}.city", $f['city']);
        }
    }

    // ─────────────────────────────────────────────────────────────
    // MAIN PAGE
    // ─────────────────────────────────────────────────────────────

    public function index(Request $request)
    {
        $filters = $this->buildFilters($request);

        // Filter option lists
        $countries = DB::table('customers')->select('country')->distinct()->orderBy('country')->pluck('country');
        $cities    = DB::table('customers')->select('city')->distinct()->orderBy('city')->pluck('city');

        // ── KPI cards ─────────────────────────────────────────────
        $kpiQuery = DB::table('orders')
            ->join('orderdetails', 'orders.orderNumber', '=', 'orderdetails.orderNumber')
            ->join('customers',    'orders.fk_customerNumber', '=', 'customers.customerNumber');

        $kpiQueryFiltered = clone $kpiQuery;
        $this->applyFilters($kpiQueryFiltered, $filters);

        $totalRevenue  = (clone $kpiQueryFiltered)->sum(DB::raw('orderdetails.quantityOrdered * orderdetails.priceEach'));
        $totalOrders   = (clone $kpiQueryFiltered)->distinct()->count('orders.orderNumber');
        $totalCustomers= DB::table('customers')->count();
        $avgOrderValue = $totalOrders > 0 ? round($totalRevenue / $totalOrders, 2) : 0;

        // ── Chart 1: Sales by City ────────────────────────────────
        $salesByCity = $this->getSalesByCity($filters);

        // ── Chart 2: Top Products by Sales ───────────────────────
        $topProducts = $this->getTopProducts($filters);

        // ── Chart 3: Sales Support by Office ─────────────────────
        $salesByOffice = $this->getSalesByOffice($filters);

        // ── Chart 4: Revenue by Product Line ─────────────────────
        $revenueByProductLine = $this->getRevenueByProductLine($filters);

        // ── Chart 5: Top Sales Reps ───────────────────────────────
        $topSalesReps = $this->getTopSalesReps($filters);

        // ── Monthly revenue trend (for sparklines) ────────────────
        $monthlyTrend = $this->getMonthlyTrend($filters);

        return view('dashboard.index', compact(
            'filters', 'countries', 'cities',
            'totalRevenue', 'totalOrders', 'totalCustomers', 'avgOrderValue',
            'salesByCity', 'topProducts', 'salesByOffice',
            'revenueByProductLine', 'topSalesReps', 'monthlyTrend'
        ));
    }

    // ─────────────────────────────────────────────────────────────
    // CHART DATA METHODS
    // ─────────────────────────────────────────────────────────────

    private function getSalesByCity(array $f)
    {
        $q = DB::table('orders')
            ->join('orderdetails', 'orders.orderNumber', '=', 'orderdetails.orderNumber')
            ->join('customers',    'orders.fk_customerNumber', '=', 'customers.customerNumber')
            ->select('customers.city', DB::raw('SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as total_sales'), DB::raw('COUNT(DISTINCT orders.orderNumber) as order_count'))
            ->groupBy('customers.city')
            ->orderByDesc('total_sales')
            ->limit(10);

        $this->applyFilters($q, $f);
        return $q->get();
    }

    private function getTopProducts(array $f)
    {
        $q = DB::table('orderdetails')
            ->join('products', 'orderdetails.fk_productCode', '=', 'products.productCode')
            ->join('orders',   'orderdetails.orderNumber', '=', 'orders.orderNumber')
            ->join('customers','orders.fk_customerNumber', '=', 'customers.customerNumber')
            ->select(
                'products.productName',
                'products.fk_productline as productLine',
                DB::raw('SUM(orderdetails.quantityOrdered) as total_qty'),
                DB::raw('SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as total_revenue')
            )
            ->groupBy('products.productCode', 'products.productName', 'products.fk_productline')
            ->orderByDesc('total_revenue')
            ->limit(10);

        $this->applyFilters($q, $f);
        return $q->get();
    }

    private function getSalesByOffice(array $f)
    {
        $q = DB::table('orders')
            ->join('orderdetails', 'orders.orderNumber', '=', 'orderdetails.orderNumber')
            ->join('customers',    'orders.fk_customerNumber', '=', 'customers.customerNumber')
            ->join('employees',    'customers.fk_salesRepEmployeeNum', '=', 'employees.employeeNum')
            ->join('offices',      'employees.fk_officeCode', '=', 'offices.officeCode')
            ->select(
                'offices.city as office_city',
                'offices.country as office_country',
                DB::raw('SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as total_sales'),
                DB::raw('COUNT(DISTINCT customers.customerNumber) as customer_count'),
                DB::raw('COUNT(DISTINCT orders.orderNumber) as order_count')
            )
            ->groupBy('offices.officeCode', 'offices.city', 'offices.country')
            ->orderByDesc('total_sales');

        $this->applyFilters($q, $f);
        return $q->get();
    }

    private function getRevenueByProductLine(array $f)
    {
        $q = DB::table('orderdetails')
            ->join('products',     'orderdetails.fk_productCode', '=', 'products.productCode')
            ->join('productlines', 'products.fk_productline', '=', 'productlines.productline')
            ->join('orders',       'orderdetails.orderNumber', '=', 'orders.orderNumber')
            ->join('customers',    'orders.fk_customerNumber', '=', 'customers.customerNumber')
            ->select(
                'productlines.productline',
                DB::raw('SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as total_revenue'),
                DB::raw('SUM(orderdetails.quantityOrdered) as total_units')
            )
            ->groupBy('productlines.productline')
            ->orderByDesc('total_revenue');

        $this->applyFilters($q, $f);
        return $q->get();
    }

    private function getTopSalesReps(array $f)
    {
        $q = DB::table('orders')
            ->join('orderdetails', 'orders.orderNumber', '=', 'orderdetails.orderNumber')
            ->join('customers',    'orders.fk_customerNumber', '=', 'customers.customerNumber')
            ->join('employees',    'customers.fk_salesRepEmployeeNum', '=', 'employees.employeeNum')
            ->join('offices',      'employees.fk_officeCode', '=', 'offices.officeCode')
            ->select(
                DB::raw("CONCAT(employees.firstName, ' ', employees.lastName) as rep_name"),
                'offices.city as office_city',
                DB::raw('SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as total_sales'),
                DB::raw('COUNT(DISTINCT customers.customerNumber) as customer_count')
            )
            ->groupBy('employees.employeeNum', 'employees.firstName', 'employees.lastName', 'offices.city')
            ->orderByDesc('total_sales')
            ->limit(10);

        $this->applyFilters($q, $f);
        return $q->get();
    }

    private function getMonthlyTrend(array $f)
    {
        $q = DB::table('orders')
            ->join('orderdetails', 'orders.orderNumber', '=', 'orderdetails.orderNumber')
            ->join('customers',    'orders.fk_customerNumber', '=', 'customers.customerNumber')
            ->select(
                DB::raw("DATE_FORMAT(orders.orderDate, '%Y-%m') as month"),
                DB::raw('SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as revenue')
            )
            ->groupBy(DB::raw("DATE_FORMAT(orders.orderDate, '%Y-%m')"))
            ->orderBy('month');

        $this->applyFilters($q, $f);
        return $q->get();
    }

    // ─────────────────────────────────────────────────────────────
    // AJAX ENDPOINTS (for live filter refresh)
    // ─────────────────────────────────────────────────────────────

    public function chartData(Request $request, string $chart)
    {
        $filters = $this->buildFilters($request);

        $data = match($chart) {
            'sales-by-city'        => $this->getSalesByCity($filters),
            'top-products'         => $this->getTopProducts($filters),
            'sales-by-office'      => $this->getSalesByOffice($filters),
            'revenue-by-productline' => $this->getRevenueByProductLine($filters),
            'top-sales-reps'       => $this->getTopSalesReps($filters),
            'monthly-trend'        => $this->getMonthlyTrend($filters),
            default                => collect([]),
        };

        return response()->json($data);
    }
}