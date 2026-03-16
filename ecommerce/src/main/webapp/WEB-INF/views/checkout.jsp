<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp"%>

<div class="container py-4" style="max-width:900px;">
    <h4 class="section-title mb-4"><span>Checkout</span></h4>

    <div class="row g-4">
        <!-- Delivery & Payment Form -->
        <div class="col-md-7">
            <div style="background:#fff; border-radius:16px; box-shadow:0 2px 12px rgba(0,0,0,0.08); padding:24px;">
                <h6 style="font-weight:700; margin-bottom:16px; color:#1a1a2e;"><i class="bi bi-geo-alt me-2 text-warning"></i>Delivery Address</h6>
                <div class="row g-3">
                    <div class="col-6">
                        <input type="text" class="form-control" placeholder="First Name" style="border-radius:8px;"/>
                    </div>
                    <div class="col-6">
                        <input type="text" class="form-control" placeholder="Last Name" style="border-radius:8px;"/>
                    </div>
                    <div class="col-12">
                        <input type="text" class="form-control" placeholder="Address Line 1" style="border-radius:8px;"/>
                    </div>
                    <div class="col-12">
                        <input type="text" class="form-control" placeholder="Address Line 2 (optional)" style="border-radius:8px;"/>
                    </div>
                    <div class="col-6">
                        <input type="text" class="form-control" placeholder="City" style="border-radius:8px;"/>
                    </div>
                    <div class="col-6">
                        <input type="text" class="form-control" placeholder="PIN Code" style="border-radius:8px;"/>
                    </div>
                    <div class="col-12">
                        <input type="tel" class="form-control" placeholder="Mobile Number" style="border-radius:8px;"/>
                    </div>
                </div>

                <hr class="my-4"/>

                <h6 style="font-weight:700; margin-bottom:16px; color:#1a1a2e;"><i class="bi bi-credit-card me-2 text-warning"></i>Payment Method</h6>
                <div class="d-flex flex-column gap-2">
                    <label class="d-flex align-items-center gap-3 p-3" style="border:2px solid #1a1a2e; border-radius:10px; cursor:pointer;">
                        <input type="radio" name="payment" value="upi" checked/> UPI / Google Pay
                    </label>
                    <label class="d-flex align-items-center gap-3 p-3" style="border:1px solid #ddd; border-radius:10px; cursor:pointer;">
                        <input type="radio" name="payment" value="card"/> Credit / Debit Card
                    </label>
                    <label class="d-flex align-items-center gap-3 p-3" style="border:1px solid #ddd; border-radius:10px; cursor:pointer;">
                        <input type="radio" name="payment" value="cod"/> Cash on Delivery
                    </label>
                </div>
            </div>
        </div>

        <!-- Order Summary -->
        <div class="col-md-5">
            <div style="background:#fff; border-radius:16px; box-shadow:0 2px 12px rgba(0,0,0,0.08); padding:24px;">
                <h6 style="font-weight:700; margin-bottom:16px; color:#1a1a2e;">Order Summary</h6>
                <c:forEach var="item" items="${cart.items}">
                    <div class="d-flex justify-content-between align-items-center mb-2" style="font-size:0.85rem;">
                        <span style="color:#555;">${item.product.name} x${item.quantity}</span>
                        <span style="font-weight:600;">₹<fmt:formatNumber value="${item.subtotal}" pattern="#,##0"/></span>
                    </div>
                </c:forEach>
                <hr/>
                <div class="d-flex justify-content-between mb-1" style="font-size:0.9rem;">
                    <span style="color:#666;">Subtotal</span>
                    <span>₹<fmt:formatNumber value="${cart.total}" pattern="#,##0"/></span>
                </div>
                <div class="d-flex justify-content-between mb-3" style="font-size:0.9rem;">
                    <span style="color:#666;">Shipping</span>
                    <c:choose>
                        <c:when test="${cart.shipping == 0}"><span class="text-success">FREE</span></c:when>
                        <c:otherwise><span>₹<fmt:formatNumber value="${cart.shipping}" pattern="#,##0"/></span></c:otherwise>
                    </c:choose>
                </div>
                <div class="d-flex justify-content-between mb-4">
                    <span style="font-weight:700;">Total</span>
                    <span style="font-weight:800; font-size:1.2rem; color:#1a1a2e;">
                        ₹<fmt:formatNumber value="${cart.grandTotal}" pattern="#,##0"/>
                    </span>
                </div>
                <form action="${pageContext.request.contextPath}/cart/place-order" method="post">
                    <button type="submit" class="btn btn-warning w-100 py-3"
                            style="border-radius:10px; font-weight:700; font-size:1rem; color:#1a1a2e;">
                        Place Order <i class="bi bi-check-circle ms-2"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
