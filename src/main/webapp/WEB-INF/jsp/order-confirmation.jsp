<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - Fancyfy Accessories</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Custom Styles -->
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
        .header h1 {
            margin: 0;
            font-size: 2rem;
        }
        .container {
            margin-top: 30px;
            margin-bottom: 80px;
        }
        .btn-primary {
            background-color: #ffd700;
            border: none;
            font-weight: 600;
            color: #222;
        }
        .btn-primary:hover, .btn-primary:focus {
            background-color: #e6c200;
            color: #222;
        }
        @media (max-width: 600px) {
            .container { margin-top: 12px; }
            .header h1 { font-size: 1.3rem; }
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
    <nav class="header">
        <h1>Order Confirmation</h1>
    </nav>
    <main class="container">
        <h2 class="text-center mb-4">Thank you for your order!</h2>
        <p class="text-center">Your order has been placed successfully.</p>
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Continue Shopping</a>
        </div>
    </main>
    <footer>
        <p>&copy; 2025 Fancyfy Accessories. All rights reserved.</p>
    </footer>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>