<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Detail - Fancyfy Accessories</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
            padding: 20px 0 10px 0;
            text-align: center;
        }
        .header img {
            max-height: 64px;
        }
        .header h1 {
            margin: 0;
            font-size: 2rem;
            letter-spacing: 1px;
        }
        .container {
            margin-top: 30px;
            margin-bottom: 60px;
        }
        .card {
            background: #1f1f1f;
            color: #e0e0e0;
            border-radius: 16px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.25);
            border: none;
        }
        .carousel {
            margin-bottom: 20px;
        }
        .carousel-inner img {
            max-height: 350px;
            object-fit: cover;
            border-radius: 12px;
        }
        .card-title {
            color: #ffd700;
            font-size: 1.5rem;
            font-weight: 700;
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
            .card-title { font-size: 1.15rem; }
            .container { margin-top: 10px; }
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
        <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="Fancyfy Accessories Banner" class="img-fluid">
        <h1>Fancyfy Accessories</h1>
    </nav>

    <div class="container">
        <h2 class="text-center mb-4">Product Detail</h2>
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6">
                <c:if test="${not empty product}">
                    <div class="card shadow-sm">
                        <div id="carousel-${product.id}" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="imageUrl" items="${product.imageUrls}" varStatus="status">
                                    <div class="carousel-item ${status.first ? 'active' : ''}">
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
                        <div class="card-body text-center">
                            <h3 class="card-title">${product.name}</h3>
                            <p class="card-text">${product.description}</p>
                            <p class="fs-5"><strong>Price:</strong> ₹${product.price}</p>
                            <form action="${pageContext.request.contextPath}/add-to-cart" method="post" class="mt-3 d-flex flex-row justify-content-center align-items-center">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="number" name="quantity" value="1" min="1" class="form-control me-2" style="max-width:70px;">
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty product}">
                    <div class="card text-center p-4">
                        <h4 class="text-danger">Product not found.</h4>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary mt-3">Go Back to Products</a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Fancyfy Accessories. All rights reserved.</p>
    </footer>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>