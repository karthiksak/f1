<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Product - Fancyfy Accessories</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
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
        .form-card {
            background: #222;
            color: #e0e0e0;
            border-radius: 14px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.25);
            max-width: 500px;
            margin: 0 auto;
        }
        .form-label {
            color: #ffd700;
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
            .form-card { padding: 1rem; }
        }
    </style>
</head>
<body>
    <nav class="header">
        <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="Fancyfy Accessories Banner" class="img-fluid mb-2">
        <!-- Removed the unwanted "Fancyfy Accessories" text here -->
    </nav>
    <main class="container">
        <h2 class="text-center mb-4">Add Product</h2>
        <div class="row justify-content-center">
            <div class="col-12 col-md-8">
                <form action="${pageContext.request.contextPath}/add-product" method="post" enctype="multipart/form-data" class="form-card p-4 mt-3 shadow">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name:</label>
                        <input type="text" id="name" name="name" class="form-control" required autocomplete="off">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description:</label>
                        <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="price" class="form-label">Price:</label>
                            <input type="number" id="price" name="price" step="0.01" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="quantity" class="form-label">Quantity:</label>
                            <input type="number" id="quantity" name="quantity" min="0" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="images" class="form-label">Images (up to 5):</label>
                        <input type="file" id="images" name="images" accept="image/*" multiple class="form-control" required>
                    </div>
                    <div class="text-center mt-4 mb-2">
                        <button type="submit" class="btn btn-primary px-4">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
        <div style="height: 50px;"></div><!-- For mobile keyboard -->
    </main>
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>