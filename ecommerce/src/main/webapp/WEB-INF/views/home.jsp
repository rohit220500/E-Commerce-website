<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp"%>

<!-- Hero Section -->
<div style="background: linear-gradient(135deg, #1a1a2e 0%, #0f3460 50%, #16213e 100%); padding: 70px 0;">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-white">
                <div style="background:#ffd700; color:#1a1a2e; display:inline-block; padding:4px 14px; border-radius:20px; font-size:0.8rem; font-weight:700; margin-bottom:16px;">
                    🔥 MEGA SALE — UP TO 30% OFF
                </div>
                <h1 style="font-weight:800; font-size:2.8rem; line-height:1.2;">
                    Latest Tech,<br/><span style="color:#ffd700;">Best Prices.</span>
                </h1>
                <p style="color:rgba(255,255,255,0.75); font-size:1.05rem; margin:16px 0 28px;">
                    Discover thousands of premium electronics from top brands. Fast delivery, easy returns, and unbeatable deals.
                </p>
                <div class="d-flex gap-3 flex-wrap">
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-warning fw-700 px-4 py-2" style="border-radius:8px; font-weight:700;">
                        Shop Now <i class="bi bi-arrow-right ms-1"></i>
                    </a>
                    <a href="#featured" class="btn btn-outline-light px-4 py-2" style="border-radius:8px;">
                        View Deals
                    </a>
                </div>
            </div>
            <div class="col-md-6 text-center d-none d-md-block">
                <img src="https://images.unsplash.com/photo-1498049794561-7780e7231661?w=500&h=350&fit=crop"
                     style="border-radius:20px; box-shadow:0 20px 60px rgba(0,0,0,0.5); max-width:100%;" alt="Tech Products"/>
            </div>
        </div>
    </div>
</div>

<!-- Trust Badges -->
<div style="background:#fff; border-bottom:1px solid #eee; padding:16px 0;">
    <div class="container">
        <div class="row text-center g-3">
            <div class="col-6 col-md-3 d-flex align-items-center justify-content-center gap-2">
                <i class="bi bi-truck fs-4 text-warning"></i>
                <div><div class="fw-600" style="font-size:0.88rem;">Free Delivery</div><div style="font-size:0.75rem; color:#666;">Orders over ₹999</div></div>
            </div>
            <div class="col-6 col-md-3 d-flex align-items-center justify-content-center gap-2">
                <i class="bi bi-shield-check fs-4 text-warning"></i>
                <div><div class="fw-600" style="font-size:0.88rem;">Secure Payment</div><div style="font-size:0.75rem; color:#666;">100% protected</div></div>
            </div>
            <div class="col-6 col-md-3 d-flex align-items-center justify-content-center gap-2">
                <i class="bi bi-arrow-repeat fs-4 text-warning"></i>
                <div><div class="fw-600" style="font-size:0.88rem;">Easy Returns</div><div style="font-size:0.75rem; color:#666;">7-day return policy</div></div>
            </div>
            <div class="col-6 col-md-3 d-flex align-items-center justify-content-center gap-2">
                <i class="bi bi-headset fs-4 text-warning"></i>
                <div><div class="fw-600" style="font-size:0.88rem;">24/7 Support</div><div style="font-size:0.75rem; color:#666;">Dedicated help</div></div>
            </div>
        </div>
    </div>
</div>

<!-- Featured Products -->
<div class="container py-5" id="featured">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="section-title"><span>Featured Products</span></h2>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-dark btn-sm" style="border-radius:8px;">
            View All <i class="bi bi-arrow-right ms-1"></i>
        </a>
    </div>

    <div class="row g-4">
        <c:forEach var="product" items="${featuredProducts}">
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card product-card h-100">
                    <div class="position-relative">
                        <a href="${pageContext.request.contextPath}/products/${product.id}">
                            <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}"/>
                        </a>
                        <c:if test="${not empty product.badge}">
                            <span class="position-absolute badge badge-${fn:toLowerCase(product.badge)} top-0 start-0 m-2"
                                  style="font-size:0.72rem;">${product.badge}</span>
                        </c:if>
                        <c:if test="${product.discountPercent > 0}">
                            <span class="position-absolute badge bg-danger top-0 end-0 m-2" style="font-size:0.72rem;">
                                -${product.discountPercent}%
                            </span>
                        </c:if>
                    </div>
                    <div class="card-body d-flex flex-column p-3">
                        <div class="mb-1" style="font-size:0.75rem; color:#666;">${product.category}</div>
                        <a href="${pageContext.request.contextPath}/products/${product.id}" class="text-decoration-none text-dark">
                            <h6 class="card-title mb-1" style="font-size:0.9rem; font-weight:600; line-height:1.3;">${product.name}</h6>
                        </a>
                        <div class="stars mb-2">
                            <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${i <= product.rating}"><i class="bi bi-star-fill"></i></c:when>
                                    <c:otherwise><i class="bi bi-star" style="color:#ddd;"></i></c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <span style="font-size:0.75rem; color:#999; margin-left:4px;">(${product.reviewCount})</span>
                        </div>
                        <div class="mt-auto">
                            <div class="d-flex align-items-center gap-2 mb-2">
                                <span class="product-price">₹<fmt:formatNumber value="${product.price}" pattern="#,##0"/></span>
                                <c:if test="${product.originalPrice > product.price}">
                                    <span class="product-original-price">₹<fmt:formatNumber value="${product.originalPrice}" pattern="#,##0"/></span>
                                </c:if>
                            </div>
                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                <input type="hidden" name="productId" value="${product.id}"/>
                                <input type="hidden" name="quantity" value="1"/>
                                <button type="submit" class="btn btn-add-cart w-100 py-2" style="font-size:0.85rem;">
                                    <i class="bi bi-cart-plus me-1"></i> Add to Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Promo Banner -->
<div class="container mb-5">
    <div class="row g-3">
        <div class="col-md-6">
            <div style="background: linear-gradient(135deg, #667eea, #764ba2); border-radius:16px; padding:30px; color:#fff; position:relative; overflow:hidden;">
                <h4 style="font-weight:700;">New Arrivals</h4>
                <p style="opacity:0.85; font-size:0.9rem;">Check out the latest smartphones and laptops</p>
                <a href="${pageContext.request.contextPath}/products?category=Smartphones" class="btn btn-light btn-sm" style="border-radius:8px; font-weight:600;">Explore</a>
            </div>
        </div>
        <div class="col-md-6">
            <div style="background: linear-gradient(135deg, #f093fb, #f5576c); border-radius:16px; padding:30px; color:#fff;">
                <h4 style="font-weight:700;">Big Discounts</h4>
                <p style="opacity:0.85; font-size:0.9rem;">Save up to 30% on Audio & Accessories</p>
                <a href="${pageContext.request.contextPath}/products?category=Audio" class="btn btn-light btn-sm" style="border-radius:8px; font-weight:600;">Shop Sale</a>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
