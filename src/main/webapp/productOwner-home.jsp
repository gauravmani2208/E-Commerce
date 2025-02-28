<%@page import="com.jsp.ecommerce_jee_project.dao.impl.ProductDaoImpl"%>
<%@page import="com.jsp.ecommerce_jee_project.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jsp.ecommerce_jee_project.entity.Product" %>

<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Owner Home</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#">SAURAV</a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">ProductOwner Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
        <li class="nav-item"><a class="nav-link disabled" aria-disabled="true">Disabled</a></li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      <!-- Dropdown Menu for Account Options -->
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Account
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="product-register.jsp">Product <br> Insert</a></li>
            <li><a class="dropdown-item" href="customer-home.jsp">Customer</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

    <h2 style="text-align:center;">Product List</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Color</th>
                <th>Price</th>
                <th>Quantity</th>	
                <th>Brand</th>
                <th>Image</th>
            </tr>
        </thead>
        <tbody>
        
            <%
          // // List<Product> products = (List<Product>) request.getAttribute("products");
            ProductDao dao = new ProductDaoImpl();
    		List<Product> products = dao.getAllProduct();
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
            %>
            
                <tr>
                    <td><%= product.getProductId() %></td>
                    <td><%= product.getProductName() %></td>
                    <td><%= product.getProductColor() %></td>
                    <td><%= product.getProductPrice() %></td>
                    <td><%= product.getProductQuantity() %></td>
                    <td><%= product.getProductBrand() %></td>
                    <td>
                        <% if (product.getProductImage() != null) { 
                            String encodedImage = Base64.getEncoder().encodeToString(product.getProductImage()); 
                        %>
                            <img src="data:image/jpeg;base64,<%= encodedImage %>" alt="Product Image">
                        <% } else { %>
                            No Image
                        <% } %>
                    </td>
                </tr>
            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="7">No products available.</td>
                </tr>
            <%
            }
            %>
        </tbody>
    </table>
    
    
    <!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted">
	<section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
		<div class="me-5 d-none d-lg-block">
			<span>Get connected with us on social networks:</span>
		</div>
		<div>
			<a href="" class="me-4 text-reset"><i class="fab fa-facebook-f"></i></a>
			<a href="" class="me-4 text-reset"><i class="fab fa-twitter"></i></a>
			<a href="" class="me-4 text-reset"><i class="fab fa-google"></i></a>
			<a href="" class="me-4 text-reset"><i class="fab fa-instagram"></i></a>
			<a href="" class="me-4 text-reset"><i class="fab fa-linkedin"></i></a>
			<a href="" class="me-4 text-reset"><i class="fab fa-github"></i></a>
		</div>
	</section>

	<section class="">
		<div class="container text-center text-md-start mt-5">
			<div class="row mt-3">
				<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
					<h6 class="text-uppercase fw-bold mb-4">
						<i class="fas fa-gem me-3"></i>Saurav
					</h6>
					<p>Here you can use rows and columns to organize your footer content. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
				</div>

				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
					<h6 class="text-uppercase fw-bold mb-4">Products</h6>
					<p><a href="#!" class="text-reset">Angular</a></p>
					<p><a href="#!" class="text-reset">React</a></p>
					<p><a href="#!" class="text-reset">Vue</a></p>
					<p><a href="#!" class="text-reset">Laravel</a></p>
				</div>

				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
					<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
					<p><a href="#!" class="text-reset">Pricing</a></p>
					<p><a href="#!" class="text-reset">Settings</a></p>
					<p><a href="#!" class="text-reset">Orders</a></p>
					<p><a href="#!" class="text-reset">Help</a></p>
				</div>

				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
					<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
					<p><i class="fas fa-home me-3"></i> Narkatiaganj</p>
					<p><i class="fas fa-envelope me-3"></i> gaurav.m2208.gm@gmail.com</p>
					<p><i class="fas fa-phone me-3"></i> +917562898502</p>
					<p><i class="fas fa-print me-3"></i> +917004392147</p>
				</div>
			</div>
		</div>
	</section>

	<div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
		© 2021 Copyright: <a class="text-reset fw-bold" href="https://mdbootstrap.com/">Saurav.com</a>
	</div>
</footer>


</body>
</html>