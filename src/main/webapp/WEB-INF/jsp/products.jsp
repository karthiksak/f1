<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Products - Fancyfy Accessories</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            background: #121212;
            font-family: 'Roboto', sans-serif;
            color: #e0e0e0;
        }
        .header {
            background: #1f1f1f;
            color: #ffd700;
            padding: 20px 0 10px 0;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .header .logo-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 24px;
        }
        .header .logo img {
            max-height: 64px;
            border-radius: 16px;
        }
        .header h1 {
            margin: 0;
            font-size: 2rem;
            letter-spacing: 1px;
        }
        .message {
            font-size: 1.1rem;
            margin-top: 12px;
            font-weight: 500;
            color: aquamarine;
        }
        .banner {
            background: #232323;
            color: #ffd700;
            padding: 16px;
            text-align: center;
            margin: 20px 0 12px 0;
            font-size: 1.2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.18);
        }
        .container {
            margin-top: 20px;
        }
        .card {
            background: #1f1f1f;
            color: #e0e0e0;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s;
            border-radius: 16px;
            border: none;
        }
        .card:hover, .card:focus-within {
            transform: scale(1.02);
            box-shadow: 0 6px 24px rgba(255, 215, 0, 0.07);
        }
        .card img {
            max-height: 150px;
            object-fit: cover;
            border-radius: 12px;
            width: 100%;
            background: #222;
        }
        .card-title {
            color: #ffd700;
            font-weight: 600;
        }
        .btn-primary {
            background-color: #ffd700;
            border: none;
            color: #222;
            font-weight: 600;
        }
        .btn-primary:hover, .btn-primary:focus {
            background-color: #e6c200;
            color: #222;
        }
        .btn-success {
            font-weight: 600;
        }
        .floating-cart-btn {
            position: fixed;
            bottom: 24px;
            right: 24px;
            background: #ffd700;
            color: #1f1f1f;
            border: none;
            border-radius: 50%;
            width: 56px;
            height: 56px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 16px rgba(0,0,0,0.2);
            z-index: 1000;
            cursor: pointer;
            font-size: 2rem;
        }
        .floating-cart-btn:hover {
            background-color: #e6c200;
        }
        .floating-cart {
            position: fixed;
            bottom: 96px;
            right: 24px;
            background: #232323;
            color: #e0e0e0;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 16px rgba(0,0,0,0.2);
            z-index: 1000;
            max-width: 310px;
            max-height: 420px;
            overflow-y: auto;
            display: none;
        }
        .floating-cart h4 {
            margin-bottom: 12px;
        }
        .floating-cart .cart-item {
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #333;
        }
        .floating-cart .cart-item:last-child {
            border-bottom: none;
        }
        .floating-cart .cart-item p {
            margin: 0;
        }
        @media (max-width: 768px) {
            .container {
                margin-top: 10px;
            }
            .banner {
                font-size: 1rem;
                padding: 12px;
            }
            .card-title { font-size: 1.1rem; }
            .floating-cart, .floating-cart-btn {
                right: 10px;
                bottom: 10px;
            }
        }
        @media (max-width: 576px) {
            .header h1 { font-size: 1.3rem; }
            .message { font-size: 1rem; }
            .container { margin-top: 6px; }
            .floating-cart { max-width: 98vw; right: 2vw; }
            .card img { max-height: 120px; }
        }
        footer {
            background: #1f1f1f;
            color: #e0e0e0;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            left: 0;
            font-size: 0.95em;
        }
    </style>
</head>
<body>
    <nav class="header" aria-label="Main navigation">
        <div class="logo-container">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Fancyfy Logo" />
            </div>
            <h1>Fancyfy Accessories</h1>
        </div>
        <div id="messages" class="message" aria-live="polite"></div>
    </nav>

    <main class="container">
        <h2 class="text-center mt-3 mb-4">Product Listing</h2>
        <div class="row">
            <c:forEach var="product" items="${productList}" varStatus="status">
                <c:if test="${status.index % 3 == 0 && status.index > 0}">
                    <div class="col-12">
                        <div class="banner" id="banner-${status.index / 3}">
                            <span class="dynamic-offer"></span>
                        </div>
                    </div>
                </c:if>
                <div class="col-lg-4 col-md-6 col-12 mb-4 d-flex">
                    <div class="card h-100 shadow-sm w-100" tabindex="0" aria-label="Product: ${product.name}">
                        <div id="carousel-${product.id}" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="imageUrl" items="${product.imageUrls}" varStatus="imageStatus">
                                    <div class="carousel-item ${imageStatus.first ? 'active' : ''}">
                                        <img src="${pageContext.request.contextPath}/${imageUrl}" alt="${product.name}" class="d-block w-100" loading="lazy">
                                    </div>
                                </c:forEach>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel-${product.id}" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel-${product.id}" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p><strong>Price:</strong> ₹${product.price}</p>
                            <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="btn btn-primary mb-2" aria-label="View details for ${product.name}">View Details</a>
                            <form action="${pageContext.request.contextPath}/add-to-cart" method="post" class="mt-2 d-flex align-items-center">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="number" name="quantity" value="1" min="1" class="form-control me-2" style="width: 70px;" aria-label="Quantity for ${product.name}">
                                <button type="submit" class="btn btn-success">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <button class="floating-cart-btn" id="floatingCartBtn" aria-label="View Cart">
        🛒
    </button>

    <aside class="floating-cart" id="floatingCart" aria-label="Floating Cart Panel">
        <h4>Your Cart</h4>
        <div id="cartItems">
            <c:forEach var="entry" items="${cart.items}">
                <div class="cart-item">
                    <p><strong>${entry.key.name}</strong></p>
                    <p>Quantity: ${entry.value}</p>
                    <p>Price: ₹${entry.key.price}</p>
                    <p>Total: ₹${entry.key.price * entry.value}</p>
                </div>
            </c:forEach>
        </div>
        <p><strong>Total Amount: ₹${cart.totalAmount}</strong></p>
        <p><strong>Shipping Charge: ₹${cart.shippingCharge}</strong></p>
        <p><strong>Final Amount: ₹${cart.finalAmount}</strong></p>
        <button class="btn btn-danger w-100 mb-2" id="clearCart">Clear Cart</button>
        <a href="${pageContext.request.contextPath}/view-cart" class="btn btn-primary w-100">Go to Checkout</a>
    </aside>

    <footer>
        <p>&copy; 2025 Fancyfy Accessories. All rights reserved.</p>
    </footer>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Rotating top messages
            const messages = [
                "Never compromise on quality.",
                "Use coupon FANCYFY50 on orders above ₹399!",
                "Free Shipping on Orders Over ₹499!"
            ];
            let messageIdx = 0;
            const messageContainer = document.getElementById('messages');
            function showMessage() {
                messageContainer.textContent = messages[messageIdx];
                messageIdx = (messageIdx + 1) % messages.length;
                setTimeout(showMessage, 3000);
            }
            showMessage();

            // Dynamic offers for banners
            const offers = [
                "Elegant chains for every style. Shop now!",
                "Stylish bracelets to complement your look.",
                "Beautiful bangles for every occasion.",
                "Quality meets affordability at Fancyfy.",
                "Stand out with unique jewelry pieces.",
                "Exceptional customer service always."
            ];
            document.querySelectorAll('.dynamic-offer').forEach((banner, i) => {
                banner.textContent = offers[i % offers.length];
            });

            // Floating cart
            const floatingCartBtn = document.getElementById('floatingCartBtn');
            const floatingCart = document.getElementById('floatingCart');
            function toggleCart() {
                floatingCart.style.display = floatingCart.style.display === 'block' ? 'none' : 'block';
                if (floatingCart.style.display === 'block') floatingCartBtn.setAttribute('aria-expanded', 'true');
                else floatingCartBtn.setAttribute('aria-expanded', 'false');
            }
            floatingCartBtn.addEventListener('click', toggleCart);

            // Hide cart when clicking outside (mobile friendly)
            document.addEventListener('click', function(ev) {
                if (!floatingCart.contains(ev.target) && ev.target !== floatingCartBtn) {
                    floatingCart.style.display = 'none';
                }
            });

            // Clear cart AJAX
            document.getElementById('clearCart').addEventListener('click', function() {
                $.post('${pageContext.request.contextPath}/clear-cart', function() {
                    location.reload();
                });
            });
        });
    </script>
</body>
</html>