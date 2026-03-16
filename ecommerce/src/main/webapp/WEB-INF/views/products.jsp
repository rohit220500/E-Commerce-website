<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp"%>

<div class="container py-4">

    <!-- Page Title -->
    <div class="mb-4">
        <c:choose>
            <c:when test="${not empty searchQuery}">
                <h4 class="section-title">Search results for: "<span>${searchQuery}</span>"</h4>
                <p style="color:#666;">${products.size()} products found</p>
            </c:when>
            <c:when test="${not empty selectedCategory}">
                <h4 class="section-title"><span>${selectedCategory}</span></h4>
                <p style="color:#666;">${products.size()} products</p>
            </c:when>
            <c:otherwise>
                <h4 class="section-title"><span>All Products</span></h4>
                <p style="color:#666;">${products.size()} products</p>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Product Grid -->
    <c:choose>
        <c:when test="${empty products}">
            <div class="text-center py-5">
                <i class="bi bi-search" style="font-size:4rem; color:#ddd;"></i>
                <h5 class="mt-3 text-muted">No products found</h5>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-dark mt-3" style="border-radius:8px;">Browse All Products</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row g-4">
                <c:forEach var="product" items="${products}">
                    <div class="col-6 col-md-4 col-lg-3">
                        <div class="card product-card h-100">
                            <div class="position-relative">
                                <a href="${pageContext.request.contextPath}/products/${product.id}">
                                    <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}"/>
                                </a>
                                <c:if test="${not empty product.badge}">
                                    <span class="position-absolute badge badge-${fn:toLowerCase(product.badge)} top-0 start-0 m-2" style="font-size:0.72rem;">${product.badge}</span>
                                </c:if>
                                <c:if test="${product.discountPercent > 0}">
                                    <span class="position-absolute badge bg-danger top-0 end-0 m-2" style="font-size:0.72rem;">-${product.discountPercent}%</span>
                                </c:if>
                            </div>
                            <div class="card-body d-flex flex-column p-3">
                                <div class="mb-1" style="font-size:0.75rem; color:#666;">${product.category}</div>
                                <a href="${pageContext.request.contextPath}/products/${product.id}" class="text-decoration-none text-dark">
                                    <h6 class="card-title mb-1" style="font-size:0.9rem; font-weight:600;">${product.name}</h6>
                                </a>
                                <div class="stars mb-2">
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:choose>
                                            <c:when test="${i <= product.rating}"><i class="bi bi-star-fill"></i></c:when>
                                            <c:otherwise><i class="bi bi-star" style="color:#ddd;"></i></c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <span style="font-size:0.75rem; color:#999;">(${product.reviewCount})</span>
                                </div>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center gap-2 mb-2">
                                        <span class="product-price">₹<fmt:formatNumber value="${product.price}" pattern="#,##0"/></span>
                                        <c:if test="${product.originalPrice > product.price}">
                                            <span class="product-original-price">₹<fmt:formatNumber value="${product.originalPrice}" pattern="#,##0"/></span>
                                        </c:if>
                                    </div>
                                    <c:choose>
                                        <c:when test="${product.inStock}">
                                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                                <input type="hidden" name="productId" value="${product.id}"/>
                                                <input type="hidden" name="quantity" value="1"/>
                                                <button type="submit" class="btn btn-add-cart w-100 py-2" style="font-size:0.85rem;">
                                                    <i class="bi bi-cart-plus me-1"></i> Add to Cart
                                                </button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-secondary w-100 py-2" disabled style="font-size:0.85rem;">Out of Stock</button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<%@include file="footer.jsp"%>
