<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>

<div class="container py-5 text-center" style="max-width:600px;">
    <div style="background:#fff; border-radius:20px; box-shadow:0 4px 24px rgba(0,0,0,0.1); padding:50px 40px;">

        <!-- Success Animation -->
        <div style="width:90px; height:90px; background:linear-gradient(135deg,#28a745,#20c997); border-radius:50%; display:flex; align-items:center; justify-content:center; margin:0 auto 24px;">
            <i class="bi bi-check-lg" style="font-size:2.8rem; color:#fff;"></i>
        </div>

        <h2 style="font-weight:800; color:#1a1a2e; margin-bottom:10px;">Order Placed!</h2>
        <p style="color:#666; font-size:1rem; margin-bottom:6px;">Thank you for shopping with <strong>ShopZone</strong>!</p>
        <p style="color:#888; font-size:0.9rem; margin-bottom:30px;">
            Your order has been confirmed and will be delivered within <strong>3-5 business days</strong>.
            A confirmation email will be sent shortly.
        </p>

        <!-- Order ID -->
        <div style="background:#f8f9fa; border-radius:10px; padding:16px; margin-bottom:28px;">
            <div style="font-size:0.82rem; color:#888; margin-bottom:4px;">Order Reference</div>
            <div style="font-weight:700; color:#1a1a2e; font-size:1.1rem; letter-spacing:1px;">
                #SZ-<%= (int)(Math.random() * 900000) + 100000 %>
            </div>
        </div>

        <!-- Feature list -->
        <div class="row g-2 mb-4 text-start" style="font-size:0.85rem; color:#555;">
            <div class="col-6 d-flex align-items-center gap-2">
                <i class="bi bi-envelope-check text-warning fs-5"></i> Confirmation email sent
            </div>
            <div class="col-6 d-flex align-items-center gap-2">
                <i class="bi bi-truck text-warning fs-5"></i> Fast delivery
            </div>
            <div class="col-6 d-flex align-items-center gap-2">
                <i class="bi bi-shield-check text-warning fs-5"></i> Secured & insured
            </div>
            <div class="col-6 d-flex align-items-center gap-2">
                <i class="bi bi-headset text-warning fs-5"></i> 24/7 Support
            </div>
        </div>

        <div class="d-flex gap-3 justify-content-center">
            <a href="${pageContext.request.contextPath}/" class="btn btn-warning px-4 py-2"
               style="border-radius:10px; font-weight:700; color:#1a1a2e;">
                <i class="bi bi-house me-2"></i>Back to Home
            </a>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-dark px-4 py-2"
               style="border-radius:10px; font-weight:600;">
                Continue Shopping
            </a>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
