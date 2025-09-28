<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Checkout - Fancyfy Accessories</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        body {
            background: #121212;
            font-family: 'Roboto', sans-serif;
            color: #e0e0e0;
        }
        .header {
            background: #1f1f1f;
            color: #ffd700;
            padding: 20px;
            text-align: center;
        }
        .container { margin-top: 32px; margin-bottom: 80px; }
        .card { background: #222; color: #e0e0e0; border-radius: 14px; box-shadow: 0 2px 16px rgba(0,0,0,0.25); border: none; }
        .card-title { color: #ffd700; }
        .btn-primary, .btn-success { background-color: #ffd700; border: none; font-weight: 600; color: #222; }
        .btn-primary:hover, .btn-primary:focus, .btn-success:hover, .btn-success:focus { background-color: #e6c200; color: #222; }
        .form-section { background: #1f1f1f; border-radius: 12px; padding: 24px; margin-bottom: 24px; }
        @media (max-width: 600px) { .header h1 { font-size: 1.3rem; } .form-section { padding: 14px; } }
        footer { background: #1f1f1f; color: #e0e0e0; text-align: center; padding: 12px 0 6px; width: 100%; position: fixed; left: 0; bottom: 0; font-size: 0.97em; }
    </style>
</head>
<body>
    <nav class="header">
        <h1>Checkout</h1>
    </nav>

    <main class="container">
        <h2 class="text-center mb-4">Review & Checkout</h2>
        <!-- Order Summary Card -->
        <div class="row justify-content-center mb-4">
            <div class="col-12 col-md-8">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Order Summary</h5>
                        <c:if test="${not empty cart.items}">
                            <ul class="list-group mb-3">
                                <c:forEach var="entry" items="${cart.items}">
                                    <li class="list-group-item bg-dark text-white d-flex justify-content-between align-items-center">
                                        <div>
                                            <strong>${entry.key.name}</strong>
                                            <span class="d-block small text-secondary">${entry.key.description}</span>
                                        </div>
                                        <span>Qty: ${entry.value} | ₹${entry.key.price * entry.value}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div>
                                <p><strong>Subtotal:</strong> ₹${cart.totalAmount}</p>
                                <p><strong>Shipping:</strong> ₹${cart.shippingCharge}</p>
                                <p><strong>Final Amount:</strong> <span style="color:#ffd700">₹${cart.finalAmount}</span></p>
                            </div>
                        </c:if>
                        <c:if test="${empty cart.items}">
                            <p class="text-center text-warning">No items in cart.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- Customer Info and Payment -->
        <div class="row justify-content-center">
            <div class="col-12 col-md-8">
                <div class="form-section shadow-sm">
                    <form action="${pageContext.request.contextPath}/order-confirmation" method="post" autocomplete="off">
                        <h5 class="mb-3" style="color:#ffd700;">Shipping & Contact Details</h5>
                        <div class="mb-3">
                            <label for="customer_name" class="form-label">Full Name</label>
                            <input type="text" id="customer_name" name="customer_name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" maxlength="10" class="form-control" required placeholder="10-digit mobile">
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Delivery Address</label>
                            <textarea id="address" name="address" class="form-control" rows="2" required></textarea>
                        </div>
                        <h5 class="mb-2 mt-4" style="color:#ffd700;">Choose Payment Method</h5>
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="payment_method" id="cod" value="cod" checked>
                                <label class="form-check-label" for="cod">
                                    Cash on Delivery
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="payment_method" id="upi" value="upi">
                                <label class="form-check-label" for="upi">
                                    UPI / Online Payment <span id="payNowLabel"></span>
                                </label>
                            </div>
                        </div>
                        <div id="upiPaySection" style="display:none;">
                            <p class="mb-2" id="upiInstructions">
                                <!-- Device-specific instructions will be shown here -->
                            </p>
                            <img src="${pageContext.request.contextPath}/images/qr.jpg" alt="Scan to Pay" width="160" class="img-fluid mb-2"><br>
                            <a id="upiPayBtn" href="#" style="display:none;" class="btn btn-success mb-2">
                                Pay with UPI App
                            </a>
                            <div class="mb-3">
                                <label for="upi_ref" class="form-label">Enter UPI Transaction Reference (after payment)</label>
                                <input type="text" id="upi_ref" name="upi_ref" class="form-control">
                            </div>
                        </div>
                        <div class="mt-4 text-center">
                            <button type="submit" class="btn btn-primary px-4">Place Order</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2025 Fancyfy Accessories. All rights reserved.</p>
    </footer>
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Show/hide UPI pay link depending on device
        document.addEventListener('DOMContentLoaded', function() {
            var codRadio = document.getElementById('cod');
            var upiRadio = document.getElementById('upi');
            var upiPaySection = document.getElementById('upiPaySection');
            var upiPayBtn = document.getElementById('upiPayBtn');
            var upiInstructions = document.getElementById('upiInstructions');
            var finalAmount = "${cart.finalAmount}";
            var upiUrl = `upi://pay?pa=yourupi@upi&pn=FancyfyAccessories&am=${finalAmount}&cu=INR`;

            function isMobile() {
                // Basic check for mobile
                return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
            }

            function updateUPISection() {
                if (upiRadio.checked) {
                    upiPaySection.style.display = 'block';
                    if (isMobile()) {
                        upiPayBtn.style.display = 'inline-block';
                        upiPayBtn.setAttribute('href', upiUrl);
                        upiInstructions.innerHTML = "Tap the button below to pay directly with your UPI app.<br>Or scan the QR code with any UPI app.";
                    } else {
                        upiPayBtn.style.display = 'none';
                        upiInstructions.innerHTML = "Scan the QR code with your mobile UPI app to pay.<br>UPI app payments are only supported on mobile.";
                    }
                } else {
                    upiPaySection.style.display = 'none';
                }
            }
            codRadio.addEventListener('change', updateUPISection);
            upiRadio.addEventListener('change', updateUPISection);

            updateUPISection();
        });
    </script>
</body>
</html>