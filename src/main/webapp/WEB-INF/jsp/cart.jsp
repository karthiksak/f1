<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - Fancyfy Accessories</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    
    <style>
        body {
            background: #121212;
            font-family: 'Roboto', sans-serif;
            color: #e0e0e0;
            min-height: 100vh;
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
        .header img {
            max-height: 60px;
            margin-bottom: 8px;
        }
        .header h1 {
            margin: 0;
            font-size: 2.1rem;
            letter-spacing: 1px;
        }
        .container {
            margin-top: 24px;
            margin-bottom: 80px;
        }
        .card {
            background: #1f1f1f;
            color: #e0e0e0;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.25);
            border-radius: 14px;
            border: none;
            transition: transform 0.3s;
        }
        .card:hover, .card:focus-within {
            transform: scale(1.02);
            box-shadow: 0 6px 24px rgba(255, 215, 0, 0.07);
        }
        .card-title {
            color: #ffd700;
            font-size: 1.3rem;
            font-weight: 600;
        }
        .cart-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-top: 12px;
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
        .btn-danger {
            font-weight: 600;
        }
        .btn-warning {
            font-weight: 500;
        }
        .cart-summary-card {
            margin-top: 18px;
            margin-bottom: 20px;
        }
        @media (max-width: 600px) {
            .container { margin-top: 12px; }
            .header h1 { font-size: 1.3rem; }
            .card-title { font-size: 1.1rem; }
        }
        footer {
            background: #1f1f1f;
            color: #e0e0e0;
            text-align: center;
            padding: 12px 0 6px;
            width: 100%;
            position: fixed;
            left: 0;
            bottom: 0;
            font-size: 0.97em;
        }
    </style>
</head>
<body>
    <nav class="header" aria-label="Main navigation">
        <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Fancyfy Logo" class="img-fluid" style="max-height: 60px;">
        <h1>Shopping Cart</h1>
    </nav>

    <main class="container">
        <h2 class="text-center mb-4">Your Cart</h2>
        <div class="row justify-content-center">
            <div class="col-12 col-md-8">
                <c:if test="${not empty cart.items}">
                    <c:forEach var="entry" items="${cart.items}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">${entry.key.name}</h5>
                                <p class="card-text">${entry.key.description}</p>
                                <div class="cart-actions">
                                    <form action="${pageContext.request.contextPath}/update-cart" method="post" class="d-flex align-items-center">
                                        <input type="hidden" name="productId" value="${entry.key.id}">
                                        <label for="quantity-${entry.key.id}" class="me-2 mb-0">Qty:</label>
                                        <input type="number" name="quantity" id="quantity-${entry.key.id}" value="${entry.value}" min="1" class="form-control me-2" style="width: 70px;">
                                        <button type="submit" class="btn btn-warning btn-sm">Update</button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/remove-from-cart" method="post">
                                        <input type="hidden" name="productId" value="${entry.key.id}">
                                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                    </form>
                                </div>
                                <p class="mt-2"><strong>Price:</strong> ₹${entry.key.price}</p>
                                <p><strong>Total:</strong> ₹${entry.key.price * entry.value}</p>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="card cart-summary-card">
                        <div class="card-body">
                            <h5 class="card-title">Summary</h5>
                            <p class="card-text"><strong>Total Amount:</strong> ₹${cart.totalAmount}</p>
                            <p class="card-text"><strong>Shipping Charge:</strong> ₹${cart.shippingCharge}</p>
                            <p class="card-text"><strong>Final Amount:</strong> ₹${cart.finalAmount}</p>
                        </div>
                    </div>
                    <div class="text-center mt-4 mb-4">
                        <form action="${pageContext.request.contextPath}/checkout" method="post">
                            <button type="submit" class="btn btn-primary btn-lg w-100">Proceed to Checkout</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/clear-cart" method="post" class="mt-2">
                            <button type="submit" class="btn btn-danger w-100">Clear Cart</button>
                        </form>
                    </div>
                </c:if>
                <c:if test="${empty cart.items}">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title">Your cart is empty.</h5>
                            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary mt-3">Shop Now</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2025 Fancyfy Accessories. All rights reserved.</p>
    </footer>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>