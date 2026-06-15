<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Product BI Dashboard</title>

    {{-- Google Fonts --}}
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">

    {{-- Bootstrap 5 --}}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    {{-- Bootstrap Icons --}}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    {{-- ApexCharts --}}
    <link href="https://cdn.jsdelivr.net/npm/apexcharts@3.45.2/dist/apexcharts.css" rel="stylesheet">

    {{-- Custom styles --}}
    <link href="{{ asset('css/dashboard.css') }}" rel="stylesheet">
</head>
<body>

<div class="d-flex" id="app-wrapper">
    {{-- ── Sidebar ── --}}
    <aside id="sidebar">
        <div class="sidebar-brand">
            <span class="brand-icon"><i class="bi bi-bar-chart-line-fill"></i></span>
            <span class="brand-text">Product<strong>BI</strong></span>
        </div>

        <nav class="sidebar-nav mt-4">
            <a href="{{ route('dashboard') }}" class="nav-item active">
                <i class="bi bi-grid-1x2-fill"></i>
                <span>Dashboard</span>
            </a>
            <a href="#salesCity" class="nav-item" onclick="scrollToChart('salesCity')">
                <i class="bi bi-geo-alt-fill"></i>
                <span>Sales by City</span>
            </a>
            <a href="#topProducts" class="nav-item" onclick="scrollToChart('topProducts')">
                <i class="bi bi-box-seam-fill"></i>
                <span>Top Products</span>
            </a>
            <a href="#officeSupport" class="nav-item" onclick="scrollToChart('officeSupport')">
                <i class="bi bi-building-fill"></i>
                <span>Office Performance</span>
            </a>
            <a href="#productLines" class="nav-item" onclick="scrollToChart('productLines')">
                <i class="bi bi-pie-chart-fill"></i>
                <span>Product Lines</span>
            </a>
            <a href="#salesReps" class="nav-item" onclick="scrollToChart('salesReps')">
                <i class="bi bi-person-fill-up"></i>
                <span>Sales Reps</span>
            </a>
        </nav>

        <div class="sidebar-footer">
            <span class="data-badge"><i class="bi bi-circle-fill text-success me-1" style="font-size:.5rem"></i>Live Data</span>
        </div>
    </aside>

    {{-- ── Main content ── --}}
    <main id="main-content">
        @yield('content')
    </main>
</div>

{{-- Bootstrap 5 JS --}}
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

{{-- ApexCharts --}}
<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.45.2/dist/apexcharts.min.js"></script>

{{-- Page scripts --}}
@stack('scripts')

<script>
function scrollToChart(id) {
    event.preventDefault();
    document.getElementById(id)?.scrollIntoView({ behavior: 'smooth', block: 'start' });
}
</script>
</body>
</html>