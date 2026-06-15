@extends('layouts.app')

@section('content')

{{-- ══════════════════════════════════════════════════
     PAGE HEADER
══════════════════════════════════════════════════ --}}
<div class="page-header d-flex align-items-center justify-content-between">
    <div>
        <h1 class="page-title">Sales Intelligence</h1>
        <p class="page-subtitle">{{ now()->format('l, F j, Y') }} · product_BI database</p>
    </div>
    <button class="btn btn-outline-accent btn-sm" id="exportBtn">
        <i class="bi bi-download me-1"></i> Export PDF
    </button>
</div>

{{-- ══════════════════════════════════════════════════
     FILTER PANEL
══════════════════════════════════════════════════ --}}
<div class="filter-panel" id="filterPanel">
    <form method="GET" action="{{ route('dashboard') }}" id="filterForm">
        <div class="row g-3 align-items-end">

            {{-- Date From --}}
            <div class="col-12 col-sm-6 col-md-3 col-xl-2">
                <label class="filter-label">From Date</label>
                <input type="date" name="date_from" class="form-control filter-input"
                       value="{{ $filters['dateFrom'] ?? '' }}">
            </div>

            {{-- Date To --}}
            <div class="col-12 col-sm-6 col-md-3 col-xl-2">
                <label class="filter-label">To Date</label>
                <input type="date" name="date_to" class="form-control filter-input"
                       value="{{ $filters['dateTo'] ?? '' }}">
            </div>

            {{-- Period Shortcuts --}}
            <div class="col-12 col-sm-6 col-md-3 col-xl-3">
                <label class="filter-label">Quick Period</label>
                <div class="period-group">
                    @foreach([
                        'q1'=>'Q1','q2'=>'Q2','q3'=>'Q3','q4'=>'Q4',
                        'h1'=>'H1','h2'=>'H2','annual'=>'Annual'
                    ] as $val => $label)
                    <button type="submit" name="period" value="{{ $val }}"
                            class="period-btn {{ ($filters['period'] ?? '') === $val ? 'active' : '' }}">
                        {{ $label }}
                    </button>
                    @endforeach
                </div>
            </div>

            {{-- Country Filter --}}
            <div class="col-12 col-sm-6 col-md-3 col-xl-2">
                <label class="filter-label">Country</label>
                <select name="country" class="form-select filter-input" onchange="this.form.submit()">
                    <option value="">All Countries</option>
                    @foreach($countries as $c)
                        <option value="{{ $c }}" {{ ($filters['country'] ?? '') === $c ? 'selected' : '' }}>
                            {{ $c }}
                        </option>
                    @endforeach
                </select>
            </div>

            {{-- Buttons --}}
            <div class="col-12 col-sm-6 col-md-3 col-xl-1 d-flex gap-2">
                <button type="submit" class="btn btn-accent flex-fill">
                    <i class="bi bi-funnel-fill"></i>
                </button>
                <a href="{{ route('dashboard') }}" class="btn btn-ghost flex-fill" title="Clear filters">
                    <i class="bi bi-x-lg"></i>
                </a>
            </div>

        </div>

        {{-- Active filter chips --}}
        @if(array_filter($filters))
        <div class="filter-chips mt-3">
            <span class="chip-label">Active filters:</span>
            @if($filters['dateFrom'] || $filters['dateTo'])
                <span class="chip">
                    <i class="bi bi-calendar3"></i>
                    {{ $filters['dateFrom'] ?? '∞' }} → {{ $filters['dateTo'] ?? '∞' }}
                </span>
            @endif
            @if($filters['country'])
                <span class="chip"><i class="bi bi-globe2"></i> {{ $filters['country'] }}</span>
            @endif
            @if($filters['city'])
                <span class="chip"><i class="bi bi-geo-alt"></i> {{ $filters['city'] }}</span>
            @endif
        </div>
        @endif
    </form>
</div>

{{-- ══════════════════════════════════════════════════
     KPI CARDS
══════════════════════════════════════════════════ --}}
<div class="row g-3 mb-4">
    <div class="col-6 col-xl-3">
        <div class="kpi-card" data-accent="blue">
            <div class="kpi-icon"><i class="bi bi-currency-dollar"></i></div>
            <div class="kpi-body">
                <div class="kpi-value">${{ number_format($totalRevenue) }}</div>
                <div class="kpi-label">Total Revenue</div>
            </div>
        </div>
    </div>
    <div class="col-6 col-xl-3">
        <div class="kpi-card" data-accent="amber">
            <div class="kpi-icon"><i class="bi bi-bag-fill"></i></div>
            <div class="kpi-body">
                <div class="kpi-value">{{ number_format($totalOrders) }}</div>
                <div class="kpi-label">Total Orders</div>
            </div>
        </div>
    </div>
    <div class="col-6 col-xl-3">
        <div class="kpi-card" data-accent="green">
            <div class="kpi-icon"><i class="bi bi-people-fill"></i></div>
            <div class="kpi-body">
                <div class="kpi-value">{{ number_format($totalCustomers) }}</div>
                <div class="kpi-label">Total Customers</div>
            </div>
        </div>
    </div>
    <div class="col-6 col-xl-3">
        <div class="kpi-card" data-accent="rose">
            <div class="kpi-icon"><i class="bi bi-graph-up-arrow"></i></div>
            <div class="kpi-body">
                <div class="kpi-value">${{ number_format($avgOrderValue) }}</div>
                <div class="kpi-label">Avg Order Value</div>
            </div>
        </div>
    </div>
</div>

{{-- ══════════════════════════════════════════════════
     ROW 1: Sales by City + Monthly Trend
══════════════════════════════════════════════════ --}}
<div class="row g-3 mb-3">

    {{-- Chart 1: Best Market (City) --}}
    <div class="col-12 col-lg-7" id="salesCity">
        <div class="chart-card" data-strip="blue">
            <div class="chart-card-header">
                <div>
                    <h2 class="chart-title">Best Markets by City</h2>
                    <p class="chart-question">Which city is the best market for sales?</p>
                </div>
                <div class="chart-controls">
                    <button class="chart-btn active" onclick="toggleChart('cityChart','bar',this)">Bar</button>
                    <button class="chart-btn" onclick="toggleChart('cityChart','treemap',this)">Map</button>
                </div>
            </div>
            <div id="cityChart"></div>
        </div>
    </div>

    {{-- Monthly Revenue Trend (sparkline context) --}}
    <div class="col-12 col-lg-5">
        <div class="chart-card" data-strip="amber">
            <div class="chart-card-header">
                <div>
                    <h2 class="chart-title">Revenue Trend</h2>
                    <p class="chart-question">Monthly revenue over time</p>
                </div>
            </div>
            <div id="trendChart"></div>
        </div>
    </div>

</div>

{{-- ══════════════════════════════════════════════════
     ROW 2: Top Products + Product Lines
══════════════════════════════════════════════════ --}}
<div class="row g-3 mb-3">

    {{-- Chart 2: Top Products --}}
    <div class="col-12 col-lg-8" id="topProducts">
        <div class="chart-card" data-strip="green">
            <div class="chart-card-header">
                <div>
                    <h2 class="chart-title">Top Products by Revenue</h2>
                    <p class="chart-question">Which product has the highest sales?</p>
                </div>
                <div class="chart-controls">
                    <button class="chart-btn active" onclick="sortProducts('revenue',this)">Revenue</button>
                    <button class="chart-btn" onclick="sortProducts('qty',this)">Quantity</button>
                </div>
            </div>
            <div id="productsChart"></div>
        </div>
    </div>

    {{-- Chart 4: Revenue by Product Line --}}
    <div class="col-12 col-lg-4" id="productLines">
        <div class="chart-card" data-strip="purple">
            <div class="chart-card-header">
                <div>
                    <h2 class="chart-title">Revenue by Product Line</h2>
                    <p class="chart-question">Which product line generates the most revenue?</p>
                </div>
            </div>
            <div id="productLineChart"></div>
        </div>
    </div>

</div>

{{-- ══════════════════════════════════════════════════
     ROW 3: Office Performance + Top Sales Reps
══════════════════════════════════════════════════ --}}
<div class="row g-3 mb-4">

    {{-- Chart 3: Office Sales Support --}}
    <div class="col-12 col-lg-5" id="officeSupport">
        <div class="chart-card" data-strip="rose">
            <div class="chart-card-header">
                <div>
                    <h2 class="chart-title">Office Sales Support</h2>
                    <p class="chart-question">Which office provides the best sales support?</p>
                </div>
            </div>
            <div id="officeChart"></div>
        </div>
    </div>

    {{-- Chart 5: Top Sales Reps --}}
    <div class="col-12 col-lg-7" id="salesReps">
        <div class="chart-card" data-strip="cyan">
            <div class="chart-card-header">
                <div>
                    <h2 class="chart-title">Top Sales Representatives</h2>
                    <p class="chart-question">Who are the top-performing sales reps?</p>
                </div>
            </div>
            <div id="repsChart"></div>
        </div>
    </div>

</div>

@endsection

@push('scripts')
<script>
// ─────────────────────────────────────────────────────────────
// RAW DATA FROM BLADE (PHP → JS)
// ─────────────────────────────────────────────────────────────
const RAW = {
    salesByCity:       @json($salesByCity),
    topProducts:       @json($topProducts),
    salesByOffice:     @json($salesByOffice),
    productLines:      @json($revenueByProductLine),
    topSalesReps:      @json($topSalesReps),
    monthlyTrend:      @json($monthlyTrend),
};

// ─────────────────────────────────────────────────────────────
// SAFETY HELPERS (Prevents NaNK forever)
// ─────────────────────────────────────────────────────────────
// 1. Forces database values into clean integers, defaults to 0
const safeNum = (val) => {
    if (val === null || val === undefined) return 0;
    const parsed = parseInt(String(val).replace(/[^0-9.-]+/g, ''));
    return isNaN(parsed) ? 0 : parsed;
};

// 2. Protects chart labels from empty arrays or NaN calculations
const formatK = (v) => {
    if (v === null || v === undefined || isNaN(v)) return '$0K';
    return '$' + (v / 1000).toFixed(0) + 'K';
};

// ─────────────────────────────────────────────────────────────
// DESIGN TOKENS
// ─────────────────────────────────────────────────────────────
const PALETTE = {
    blue:   '#38BDF8', amber:  '#F59E0B', green:  '#10B981',
    rose:   '#F43F5E', purple: '#A78BFA', cyan:   '#22D3EE',
    muted:  '#475569',
};

const CHART_DEFAULTS = {
    chart:   { background: 'transparent', fontFamily: 'Inter, sans-serif', toolbar: { show: false } },
    theme:   { mode: 'dark' },
    grid:    { borderColor: '#1E293B', strokeDashArray: 4 },
    tooltip: { theme: 'dark' },
    colors:  Object.values(PALETTE),
};

let cityChartInst;
let cityMode = 'bar';
let productsChartInst;
let productsMode = 'revenue';

// ─────────────────────────────────────────────────────────────
// CHART 1: Sales by City
// ─────────────────────────────────────────────────────────────
function buildCityChart(mode = 'bar') {
    const data = RAW.salesByCity || [];
    const labels = data.map(d => d.city || 'Unknown');
    const values = data.map(d => safeNum(d.total_sales));

    if (cityChartInst) cityChartInst.destroy();

    const options = mode === 'bar' ? {
        ...CHART_DEFAULTS,
        chart: { ...CHART_DEFAULTS.chart, type: 'bar', height: 300 },
        series: [{ name: 'Revenue', data: values }],
        xaxis: { categories: labels, labels: { style: { colors: '#94A3B8', fontSize: '11px' } } },
        yaxis: { labels: { formatter: formatK, style: { colors: '#94A3B8' } } },
        plotOptions: { bar: { borderRadius: 4, horizontal: false, columnWidth: '60%' } },
        colors: [PALETTE.blue],
        dataLabels: { enabled: false },
    } : {
        ...CHART_DEFAULTS,
        chart: { ...CHART_DEFAULTS.chart, type: 'treemap', height: 300 },
        series: [{ data: data.map(d => ({ x: d.city || 'Unknown', y: safeNum(d.total_sales) })) }],
        colors: [PALETTE.blue, PALETTE.cyan, PALETTE.purple, PALETTE.green, PALETTE.amber, PALETTE.rose],
        dataLabels: { enabled: true, style: { fontSize: '12px', fontFamily: 'Inter, sans-serif' } },
        legend: { show: false },
    };

    cityChartInst = new ApexCharts(document.getElementById('cityChart'), options);
    cityChartInst.render();
    cityMode = mode;
}

function toggleChart(chartId, mode, btn) {
    // Safely toggle active state regardless of container class names
    if (btn) {
        const parent = btn.closest('.chart-controls') || btn.parentElement;
        if (parent) {
            parent.querySelectorAll('button, .chart-btn').forEach(b => b.classList.remove('active'));
        }
        btn.classList.add('active');
    }
    
    // Route to the correct chart execution tree
    if (chartId === 'cityChart') buildCityChart(mode);
    if (chartId === 'productsChart') buildProductsChart(mode);
}

function sortProducts(mode, btn) {
    // Fallback runner in case your HTML calls sortProducts directly
    toggleChart('productsChart', mode, btn);
}

// ─────────────────────────────────────────────────────────────
// CHART 2: Top Products (Horizontal Bar Chart)
// ─────────────────────────────────────────────────────────────
function buildProductsChart(mode = 'revenue') {
    const rawData = RAW.topProducts || [];
    
    // Parse the data safely
    const cleanData = rawData.map(d => {
        const name = d.productName || d.productname || 'Unknown Product';
        return {
            ...d,
            parsedRevenue: safeNum(d.total_revenue || d.total_sales),
            parsedQty: safeNum(d.total_qty || d.quantity),
            displayLabel: name.length > 30 ? name.substring(0, 28) + '…' : name
        };
    });

    // Sort and grab top 10 rows
    const data = cleanData.sort((a, b) =>
        mode === 'revenue' ? b.parsedRevenue - a.parsedRevenue : b.parsedQty - a.parsedQty
    ).slice(0, 10);

    const labels = data.map(d => d.displayLabel);
    const values = data.map(d => mode === 'revenue' ? d.parsedRevenue : d.parsedQty);

    if (productsChartInst) productsChartInst.destroy();

    productsChartInst = new ApexCharts(document.getElementById('productsChart'), {
        ...CHART_DEFAULTS,
        chart: { ...CHART_DEFAULTS.chart, type: 'bar', height: 320 },
        series: [{ name: mode === 'revenue' ? 'Revenue' : 'Units Sold', data: values }],
        xaxis: { 
            categories: labels, 
            labels: { 
                // Numeric formatting goes here because the bottom axis holds the values
                formatter: v => mode === 'revenue' ? formatK(v) : safeNum(v).toLocaleString(),
                style: { colors: '#94A3B8', fontSize: '10px' } 
            } 
        },
        yaxis: { 
            labels: { 
                // REMOVED numeric formatters here so the text names show up perfectly untouched
                style: { colors: '#94A3B8', fontSize: '11px' } 
            } 
        },
        plotOptions: { bar: { horizontal: true, borderRadius: 3, barHeight: '65%' } },
        colors: [PALETTE.green],
        dataLabels: {
            enabled: true,
            // Format the metrics inside or alongside the bars cleanly
            formatter: v => mode === 'revenue' ? formatK(v) : safeNum(v).toLocaleString(),
            style: { fontSize: '10px', colors: ['#CBD5E1'] },
        },
    });

    productsChartInst.render();
    productsMode = mode;
}

// ─────────────────────────────────────────────────────────────
// CHART 3: Office Sales Support
// ─────────────────────────────────────────────────────────────
function buildOfficeChart() {
    const data   = RAW.salesByOffice || [];
    const labels = data.map(d => d.office_city || 'Unknown');
    const values = data.map(d => safeNum(d.total_sales));

    new ApexCharts(document.getElementById('officeChart'), {
        ...CHART_DEFAULTS,
        chart: { ...CHART_DEFAULTS.chart, type: 'radar', height: 320 },
        series: [{ name: 'Revenue Generated', data: values }],
        xaxis: { categories: labels, labels: { style: { colors: '#94A3B8', fontSize: '12px' } } },
        yaxis: { show: false },
        fill:  { opacity: 0.3 },
        stroke: { width: 2, colors: [PALETTE.rose] },
        markers: { size: 4, colors: [PALETTE.rose] },
        colors: [PALETTE.rose],
        plotOptions: { radar: { polygons: { strokeColors: '#1E293B', connectorColors: '#1E293B' } } },
        dataLabels: { enabled: false },
    }).render();
}

// ─────────────────────────────────────────────────────────────
// CHART 4: Revenue by Product Line
// ─────────────────────────────────────────────────────────────
function buildProductLineChart() {
    const data   = RAW.productLines || [];
    const labels = data.map(d => d.productline || 'Unknown');
    const values = data.map(d => safeNum(d.total_revenue));

    new ApexCharts(document.getElementById('productLineChart'), {
        ...CHART_DEFAULTS,
        chart: { ...CHART_DEFAULTS.chart, type: 'donut', height: 320 },
        series: values.length ? values : [0], // Prevent crash on empty donut
        labels: labels.length ? labels : ['No Data'],
        colors: [PALETTE.purple, PALETTE.blue, PALETTE.green, PALETTE.amber, PALETTE.rose, PALETTE.cyan],
        plotOptions: { pie: { donut: { size: '65%', labels: { show: true, total: { show: true, label: 'Total Revenue', formatter: w => '$' + (w.globals.seriesTotals.reduce((a,b) => a+safeNum(b), 0)/1000000).toFixed(1) + 'M' } } } } },
        legend: { position: 'bottom', labels: { colors: '#94A3B8' }, fontSize: '11px' },
        dataLabels: { enabled: false },
        tooltip: { y: { formatter: v => '$' + safeNum(v).toLocaleString() } },
    }).render();
}

// ─────────────────────────────────────────────────────────────
// CHART 5: Top Sales Reps
// ─────────────────────────────────────────────────────────────
function buildRepsChart() {
    const data   = (RAW.topSalesReps || []).slice(0, 10);
    const labels = data.map(d => d.rep_name || 'Unknown');
    const values = data.map(d => safeNum(d.total_sales));
    const customers = data.map(d => safeNum(d.customer_count));

    new ApexCharts(document.getElementById('repsChart'), {
        ...CHART_DEFAULTS,
        chart: { ...CHART_DEFAULTS.chart, type: 'bar', height: 320 },
        series: [
            { name: 'Revenue', data: values },
            { name: 'Customers', data: customers, type: 'line' },
        ],
        xaxis: { categories: labels, labels: { style: { colors: '#94A3B8', fontSize: '11px' }, rotate: -30 } },
        yaxis: [
            { labels: { formatter: formatK, style: { colors: '#94A3B8' } } },
            { opposite: true, labels: { formatter: v => safeNum(v) + ' cust', style: { colors: '#94A3B8' } } },
        ],
        plotOptions: { bar: { borderRadius: 4, columnWidth: '55%' } },
        colors: [PALETTE.cyan, PALETTE.amber],
        dataLabels: { enabled: false },
        stroke: { width: [0, 3], curve: 'smooth' },
        markers: { size: [0, 5] },
        legend: { position: 'top', labels: { colors: '#94A3B8' } },
        tooltip: { y: [{ formatter: v => '$' + safeNum(v).toLocaleString() }, { formatter: v => safeNum(v) + ' customers' }] },
    }).render();
}

// ─────────────────────────────────────────────────────────────
// MONTHLY TREND
// ─────────────────────────────────────────────────────────────
function buildTrendChart() {
    const data   = RAW.monthlyTrend || [];
    const labels = data.map(d => d.month || 'Unknown');
    const values = data.map(d => safeNum(d.revenue));

    new ApexCharts(document.getElementById('trendChart'), {
        ...CHART_DEFAULTS,
        chart: { ...CHART_DEFAULTS.chart, type: 'area', height: 300 },
        series: [{ name: 'Revenue', data: values }],
        xaxis: { categories: labels, labels: { style: { colors: '#94A3B8', fontSize: '10px' }, rotate: -30 } },
        yaxis: { labels: { formatter: formatK, style: { colors: '#94A3B8' } } },
        colors: [PALETTE.amber],
        fill:   { type: 'gradient', gradient: { shadeIntensity: 1, opacityFrom: 0.5, opacityTo: 0.05 } },
        stroke: { curve: 'smooth', width: 2 },
        dataLabels: { enabled: false },
    }).render();
}

// ─────────────────────────────────────────────────────────────
// INIT ALL
// ─────────────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
    buildCityChart('bar');
    buildProductsChart('revenue');
    buildOfficeChart();
    buildProductLineChart();
    buildRepsChart();
    buildTrendChart();
});
</script>
@endpush