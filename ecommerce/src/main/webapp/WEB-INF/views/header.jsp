<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ShopZone - Premium Electronics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #f8f9fa; }

        /* Navbar */
        .navbar-brand span.logo-shop { color: #fff; font-weight: 700; font-size: 1.4rem; }
        .navbar-brand span.logo-zone { color: #ffd700; font-weight: 700; font-size: 1.4rem; }
        .navbar { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%) !important; }
        .nav-link { color: rgba(255,255,255,0.85) !important; font-weight: 500; }
        .nav-link:hover { color: #ffd700 !important; }
        .search-bar { border-radius: 50px; border: none; padding: 0.5rem 1.2rem; min-width: 300px; }
        .search-btn { border-radius: 0 50px 50px 0; background: #ffd700; border: none; color: #1a1a2e; font-weight: 600; padding: 0.5rem 1.2rem; }
        .search-btn:hover { background: #ffcc00; }
        .cart-badge { background: #ff4444; font-size: 0.65rem; top: -4px; right: -8px; }

        /* Category bar */
        .category-bar { background: #16213e; padding: 8px 0; border-bottom: 1px solid #0f3460; }
        .category-bar a { color: rgba(255,255,255,0.75); font-size: 0.85rem; font-weight: 500; text-decoration: none; padding: 4px 14px; border-radius: 20px; transition: all 0.2s; }
        .category-bar a:hover, .category-bar a.active { background: #ffd700; color: #1a1a2e; }

        /* Cards */
        .product-card { border: none; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); transition: all 0.3s; overflow: hidden; }
        .product-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
        .product-card img { height: 220px; object-fit: cover; transition: transform 0.3s; }
        .product-card:hover img { transform: scale(1.03); }
        .badge-new { background: #28a745; }
        .badge-sale { background: #dc3545; }
        .badge-hot { background: #fd7e14; }
        .product-price { color: #1a1a2e; font-size: 1.1rem; font-weight: 700; }
        .product-original-price { color: #999; font-size: 0.85rem; text-decoration: line-through; }
        .discount-badge { background: #fff3cd; color: #856404; font-size: 0.75rem; font-weight: 600; padding: 2px 8px; border-radius: 4px; }
        .btn-add-cart { background: #1a1a2e; color: #fff; border: none; border-radius: 8px; font-weight: 600; transition: all 0.2s; }
        .btn-add-cart:hover { background: #0f3460; color: #ffd700; }
        .btn-primary-custom { background: linear-gradient(135deg, #1a1a2e, #0f3460); border: none; border-radius: 8px; font-weight: 600; padding: 10px 24px; }
        .btn-primary-custom:hover { background: linear-gradient(135deg, #0f3460, #1a1a2e); color: #ffd700; }
        .stars { color: #ffc107; font-size: 0.8rem; }

        /* Footer */
        footer { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%); color: rgba(255,255,255,0.8); }
        footer a { color: rgba(255,255,255,0.65); text-decoration: none; font-size: 0.9rem; }
        footer a:hover { color: #ffd700; }
        .footer-brand { color: #fff; font-weight: 700; font-size: 1.3rem; }
        .footer-brand span { color: #ffd700; }

        /* Alert */
        .alert-success-custom { background: #d4edda; border: none; border-left: 4px solid #28a745; border-radius: 8px; }

        /* Section headers */
        .section-title { font-weight: 700; font-size: 1.5rem; color: #1a1a2e; }
        .section-title span { color: #0f3460; border-bottom: 3px solid #ffd700; padding-bottom: 4px; }
    </style>
</head>
<body>

<!-- Top Offer Bar -->
<div style="background:#ffd700; text-align:center; padding:6px; font-size:0.82rem; font-weight:600; color:#1a1a2e;">
    🎉 FREE SHIPPING on orders above ₹999 &nbsp;|&nbsp; Use code <strong>SHOPZONE10</strong> for 10% off
</div>

<!-- Main Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <span class="logo-shop">Shop</span><span class="logo-zone">Zone</span>
        </a>

        <!-- Search Bar -->
        <form class="d-flex mx-3 flex-grow-1" action="${pageContext.request.contextPath}/search" method="get">
            <div class="input-group" style="max-width:500px;">
                <input type="text" name="q" class="form-control search-bar" placeholder="Search for products, brands..." value="${searchQuery}"/>
                <button class="search-btn" type="submit"><i class="bi bi-search"></i></button>
            </div>
        </form>

        <!-- Right Icons -->
        <div class="d-flex align-items-center gap-3">
            <a href="#" class="nav-link d-none d-md-block"><i class="bi bi-person-circle fs-5"></i></a>
            <a href="${pageContext.request.contextPath}/cart" class="nav-link position-relative">
                <i class="bi bi-cart3 fs-5"></i>
                <c:if test="${cartCount > 0}">
                    <span class="position-absolute cart-badge badge rounded-pill">${cartCount}</span>
                </c:if>
            </a>
        </div>
    </div>
</nav>

<!-- Category Bar -->
<div class="category-bar">
    <div class="container">
        <div class="d-flex flex-wrap gap-1">
            <a href="${pageContext.request.contextPath}/products" class="${empty selectedCategory ? 'active' : ''}">All</a>
            <c:forEach var="cat" items="${categories}">
                <a href="${pageContext.request.contextPath}/products?category=${cat}"
                   class="${selectedCategory == cat ? 'active' : ''}">${cat}</a>
            </c:forEach>
        </div>
    </div>
</div>
