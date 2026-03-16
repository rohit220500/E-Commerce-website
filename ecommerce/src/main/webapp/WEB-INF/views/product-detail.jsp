<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp"%>

<div class="container py-4">

    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb" style="font-size:0.85rem;">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/" class="text-decoration-none">Home</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/products" class="text-decoration-none">Products</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/products?category=${product.category}" class="text-decoration-none">${product.category}</a></li>
            <li class="breadcrumb-item active">${product.name}</li>
        </ol>
    </nav>

    <!-- Flash message -->
    <c:if test="${not empty successMsg}">
        <div class="alert alert-success-custom alert-dismissible fade show mb-3" role="alert">
            <i class="bi bi-check-circle me-2 text-success"></i>${successMsg}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Product Detail -->
    <div class="row g-4">
        <!-- Image -->
        <div class="col-md-5">
            <div style="background:#fff; border-radius:16px; padding:20px; box-shadow:0 2px 12px rgba(0,0,0,0.08);">
                <img src="${product.imageUrl}" class="w-100" alt="${product.name}"
                     style="border-radius:10px; object-fit:cover; max-height:380px;"/>
            </div>
        </div>

        <!-- Details -->
        <div class="col-md-7">
            <div style="background:#fff; border-radius:16px; padding:28px; box-shadow:0 2px 12px rgba(0,0,0,0.08);">

                <c:if test="${not empty product.badge}">
                    <span class="badge mb-2" style="background:#ffd700; color:#1a1a2e; font-size:0.75rem;">${product.badge}</span>
                </c:if>

                <h2 style="font-weight:700; color:#1a1a2e;">${product.name}</h2>

                <!-- Rating -->
                <div class="d-flex align-items-center gap-2 mb-3">
                    <div class="stars">
                        <c:forEach begin="1" end="5" var="i">
                            <c:choose>
                                <c:when test="${i <= product.rating}"><i class="bi bi-star-fill"></i></c:when>
                                <c:otherwise><i class="bi bi-star" style="color:#ddd;"></i></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <span style="font-size:0.88rem; color:#666;">${product.rating} (${product.reviewCount} reviews)</span>
                </div>

                <!-- Price -->
                <div class="d-flex align-items-center gap-3 mb-3">
                    <span style="font-size:2rem; font-weight:800; color:#1a1a2e;">
                        ₹<fmt:formatNumber value="${product.price}" pattern="#,##0"/>
                    </span>
                    <c:if test="${product.originalPrice > product.price}">
                        <span style="font-size:1.1rem; text-decoration:line-through; color:#999;">
                            ₹<fmt:formatNumber value="${product.originalPrice}" pattern="#,##0"/>
                        </span>
                        <span class="badge bg-danger">${product.discountPercent}% OFF</span>
                    </c:if>
                </div>

                <!-- Stock -->
                <c:choose>
                    <c:when test="${product.inStock}">
                        <span style="color:#28a745; font-size:0.88rem; font-weight:600;">
                            <i class="bi bi-check-circle-fill me-1"></i> In Stock
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span style="color:#dc3545; font-size:0.88rem; font-weight:600;">
                            <i class="bi bi-x-circle-fill me-1"></i> Out of Stock
                        </span>
                    </c:otherwise>
                </c:choose>

                <hr/>

                <!-- Description -->
                <p style="color:#555; line-height:1.7;">${product.description}</p>

                <hr/>

                <!-- Add to Cart -->
                <c:if test="${product.inStock}">
                    <form action="${pageContext.request.contextPath}/cart/add" method="post">
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <label class="fw-600">Qty:</label>
                            <div class="d-flex align-items-center border rounded" style="width:120px;">
                                <button type="button" class="btn btn-sm px-3" onclick="decreaseQty()">-</button>
                                <input type="number" name="quantity" id="qtyInput" value="1" min="1" max="10"
                                       class="form-control text-center border-0" style="width:50px;"/>
                                <button type="button" class="btn btn-sm px-3" onclick="increaseQty()">+</button>
                            </div>
                        </div>
                        <div class="d-flex gap-3 flex-wrap">
                            <button type="submit" class="btn btn-add-cart px-5 py-2" style="font-size:1rem;">
                                <i class="bi bi-cart-plus me-2"></i>Add to Cart
                            </button>
                            <a href="${pageContext.request.contextPath}/cart" class="btn btn-warning px-4 py-2" style="font-size:1rem; border-radius:8px; font-weight:600; color:#1a1a2e;">
                                <i class="bi bi-bag me-2"></i>Buy Now
                            </a>
                        </div>
                    </form>
                </c:if>

                <hr/>

                <!-- Feature bullets -->
                <div class="row g-2 mt-1" style="font-size:0.85rem;">
                    <div class="col-6 d-flex align-items-center gap-2"><i class="bi bi-truck text-warning"></i> Free delivery</div>
                    <div class="col-6 d-flex align-items-center gap-2"><i class="bi bi-shield-check text-warning"></i> 1 Year Warranty</div>
                    <div class="col-6 d-flex align-items-center gap-2"><i class="bi bi-arrow-repeat text-warning"></i> 7-day returns</div>
                    <div class="col-6 d-flex align-items-center gap-2"><i class="bi bi-award text-warning"></i> 100% Genuine</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Related Products -->
    <c:if test="${not empty relatedProducts}">
        <div class="mt-5">
            <h4 class="section-title mb-4"><span>Related Products</span></h4>
            <div class="row g-4">
                <c:forEach var="rp" items="${relatedProducts}">
                    <div class="col-6 col-md-4 col-lg-3">
                        <div class="card product-card h-100">
                            <a href="${pageContext.request.contextPath}/products/${rp.id}">
                                <img src="${rp.imageUrl}" class="card-img-top" alt="${rp.name}"/>
                            </a>
                            <div class="card-body p-3">
                                <a href="${pageContext.request.contextPath}/products/${rp.id}" class="text-decoration-none text-dark">
                                    <h6 style="font-size:0.9rem; font-weight:600;">${rp.name}</h6>
                                </a>
                                <span class="product-price">₹<fmt:formatNumber value="${rp.price}" pattern="#,##0"/></span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
</div>

<script>
    function increaseQty() {
        var el = document.getElementById('qtyInput');
        if (parseInt(el.value) < 10) el.value = parseInt(el.value) + 1;
    }
    function decreaseQty() {
        var el = document.getElementById('qtyInput');
        if (parseInt(el.value) > 1) el.value = parseInt(el.value) - 1;
    }
</script>

<%@include file="footer.jsp"%>
