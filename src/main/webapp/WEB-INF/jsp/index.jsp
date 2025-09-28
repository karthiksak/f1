<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fancyfy Accessories - Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #1a1a1a;
            font-family: 'Roboto', sans-serif;
            color: #fff;
            min-height: 100vh;
        }
        .header {
            background: #000;
            color: #fff;
            padding: 20px;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 1020;
        }
        .header img {
            height: 60px;
            margin-bottom: 10px;
        }
        .header h1 {
            margin: 0;
            font-size: 2rem;
            letter-spacing: 1px;
        }
        .container {
            margin-top: 24px;
            margin-bottom: 64px;
        }
        .card {
            background: #242424;
            color: #fff;
            box-shadow: 0 2px 16px rgba(0,0,0,0.25);
            border-radius: 18px;
            border: none;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover, .card:focus-within {
            transform: scale(1.03);
            box-shadow: 0 4px 32px rgba(255,215,0,0.14);
        }
        .card-title {
            color: #ffd700;
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
        @media (max-width: 600px) {
            .card-title { font-size: 1.1rem; }
            .container { margin-top: 8px; }
            .header h1 { font-size: 1.3rem; }
        }
        footer {
            background: #000;
            color: #fff;
            text-align: center;
            padding: 14px 0 6px;
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
        <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Fancyfy Logo" class="img-fluid" style="max-height:60px;" />
        <h1>Fancyfy Accessories</h1>
    </nav>
    <main class="container">
        <div class="row gy-4">
            <div class="col-12 col-md-4">
                <div class="card h-100 shadow-sm" tabindex="0" aria-label="Manage Products">
                    <div class="card-body">
                        <h5 class="card-title">Manage Products</h5>
                        <p class="card-text">Add, edit, or delete products in your inventory.</p>
                        <a href="${pageContext.request.contextPath}/manage-products" class="btn btn-primary w-100" aria-label="Go to Manage Products">Manage Products</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="card h-100 shadow-sm" tabindex="0" aria-label="Product Form">
                    <div class="card-body">
                        <h5 class="card-title">Product Form</h5>
                        <p class="card-text">Add or edit product information.</p>
                        <a href="${pageContext.request.contextPath}/product-form" class="btn btn-primary w-100" aria-label="Go to Product Form">Product Form</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="card h-100 shadow-sm" tabindex="0" aria-label="Products">
                    <div class="card-body">
                        <h5 class="card-title">Products</h5>
                        <p class="card-text">View all products in the inventory.</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary w-100" aria-label="Go to Products">View Products</a>
                    </div>
                </div>
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