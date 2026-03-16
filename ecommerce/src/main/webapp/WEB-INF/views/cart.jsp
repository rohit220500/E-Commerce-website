<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp"%>

<div class="container py-4">
    <h4 class="section-title mb-4"><span>Your Cart</span></h4>

    <c:choose>
        <c:when test="${empty cart.items}">
            <div class="text-center py-5" style="background:#fff; border-radius:16px; box-shadow:0 2px 12px rgba(0,0,0,0.08);">
                <i class="bi bi-cart-x" style="font-size:5rem; color:#ddd;"></i>
                <h5 class="mt-3 text-muted">Your cart is empty</h5>
                <p class="text-muted">Add some products to get started</p>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-dark mt-2" style="border-radius:8px; font-weight:600;">
                    <i class="bi bi-arrow-left me-2"></i>Continue Shopping
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row g-4">
                <!-- Cart Items -->
                <div class="col-lg-8">
                    <div style="background:#fff; border-radius:16px; box-shadow:0 2px 12px rgba(0,0,0,0.08); overflow:hidden;">
                        <div style="padding:16px 20px; border-bottom:1px solid #f0f0f0; font-weight:600; color:#1a1a2e;">
                            ${cart.totalItems} item(s) in your cart
                        </div>
                        <c:forEach var="item" items="${cart.items}">
                            <div class="d-flex align-items-center gap-3 p-3" style="border-bottom:1px solid #f5f5f5;">
                                <img src="${item.product.imageUrl}" alt="${item.product.name}"
                                     style="width:85px; height:85px; object-fit:cover; border-radius:10px; flex-shrink:0;"/>
                                <div class="flex-grow-1">
                                    <div style="font-size:0.78rem; color:#888;">${item.product.category}</div>
                                    <a href="${pageContext.request.contextPath}/products/${item.product.id}" class="text-decoration-none">
                                        <div style="font-weight:600; color:#1a1a2e; font-size:0.95rem;">${item.product.name}</div>
                                    </a>
                                    <div style="color:#28a745; font-size:0.8rem; margin-top:2px;">In Stock</div>
                                </div>
                                <div class="text-center" style="min-width:100px;">
                                    <form action="${pageContext.request.contextPath}/cart/update" method="post" class="d-flex align-items-center gap-1">
                                        <input type="hidden" name="productId" value="${item.product.id}"/>
                                        <select name="quantity" onchange="this.form.submit()" class="form-select form-select-sm" style="width:70px; font-size:0.85rem;">
                                            <c:forEach begin="1" end="10" var="q">
                                                <option value="${q}" ${item.quantity == q ? 'selected' : ''}>${q}</option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                </div>
                                <div class="text-end" style="min-width:100px;">
                                    <div style="font-weight:700; color:#1a1a2e;">
                                        ₹<fmt:formatNumber value="${item.subtotal}" pattern="#,##0"/>
                                    </div>
                                    <div style="font-size:0.78rem; color:#999;">
                                        ₹<fmt:formatNumber value="${item.product.price}" pattern="#,##0"/> each
                                    </div>
                                    <form action="${pageContext.request.contextPath}/cart/remove" method="post" class="mt-1">
                                        <input type="hidden" name="productId" value="${item.product.id}"/>
                                        <button type="submit" class="btn btn-link p-0 text-danger" style="font-size:0.8rem;">
                                            <i class="bi bi-trash"></i> Remove
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Clear Cart -->
                        <div class="p-3 d-flex gap-2">
                            <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-secondary btn-sm" style="border-radius:8px;">
                                <i class="bi bi-arrow-left me-1"></i> Continue Shopping
                            </a>
                            <form action="${pageContext.request.contextPath}/cart/clear" method="post">
                                <button type="submit" class="btn btn-outline-danger btn-sm" style="border-radius:8px;">
                                    <i class="bi bi-trash me-1"></i> Clear Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Order Summary -->
                <div class="col-lg-4">
                    <div style="background:#fff; border-radius:16px; box-shadow:0 2px 12px rgba(0,0,0,0.08); padding:24px;">
                        <h5 style="font-weight:700; margin-bottom:20px; color:#1a1a2e;">Order Summary</h5>

                        <div class="d-flex justify-content-between mb-2" style="font-size:0.9rem;">
                            <span style="color:#666;">Subtotal (${cart.totalItems} items)</span>
                            <span>₹<fmt:formatNumber value="${cart.total}" pattern="#,##0"/></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2" style="font-size:0.9rem;">
                            <span style="color:#666;">Shipping</span>
                            <c:choose>
                                <c:when test="${cart.shipping == 0}">
                                    <span class="text-success">FREE</span>
                                </c:when>
                                <c:otherwise>
                                    <span>₹<fmt:formatNumber value="${cart.shipping}" pattern="#,##0"/></span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:if test="${cart.total < 999}">
                            <div style="background:#fff8e1; border-radius:8px; padding:8px 12px; font-size:0.8rem; color:#856404; margin-bottom:10px;">
                                Add ₹<fmt:formatNumber value="${999 - cart.total}" pattern="#,##0"/> more for FREE shipping
                            </div>
                        </c:if>
                        <hr/>
                        <div class="d-flex justify-content-between mb-4">
                            <span style="font-weight:700; font-size:1.05rem;">Total</span>
                            <span style="font-weight:800; font-size:1.2rem; color:#1a1a2e;">
                                ₹<fmt:formatNumber value="${cart.grandTotal}" pattern="#,##0"/>
                            </span>
                        </div>

                        <a href="${pageContext.request.contextPath}/cart/checkout"
                           class="btn btn-warning w-100 py-3" style="border-radius:10px; font-weight:700; font-size:1rem; color:#1a1a2e;">
                            Proceed to Checkout <i class="bi bi-arrow-right ms-2"></i>
                        </a>

                        <div class="d-flex justify-content-center gap-3 mt-3">
                            <i class="bi bi-lock-fill text-success"></i>
                            <span style="font-size:0.8rem; color:#666;">Secure Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<%@include file="footer.jsp"%>
