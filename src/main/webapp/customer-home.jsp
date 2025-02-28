<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jsp.ecommerce_jee_project.entity.Product"%>
<%@ page import="com.jsp.ecommerce_jee_project.dao.ProductDao"%>
<%@ page import="com.jsp.ecommerce_jee_project.dao.impl.ProductDaoImpl"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Home</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>


	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="#">SAURAV</a>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Customer Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						aria-disabled="true">Disabled</a></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<!-- Dropdown Menu for Account Options -->
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Account </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="cart.jsp">Cart</a></li>
							<li><a class="dropdown-item" href="#">Orders</a></li>
							<li><a class="dropdown-item" href="productOwner-login.jsp">Seller</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><a class="dropdown-item" href="customer-login.jsp">Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Bestsellers Section -->
	<section style="background-color: #eee;">
		<div class="text-center container py-5">
			<h4 class="mt-4 mb-5">
				<strong>Bestsellers</strong>
			</h4>

			<div class="row">
				<%
				ProductDao dao = new ProductDaoImpl();
				List<Product> products = dao.getAllProduct();
				if (products != null && !products.isEmpty()) {
					for (Product product : products) {
				%>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card">
						<div
							class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
							data-mdb-ripple-color="light">
							<!-- Dynamically load product image -->
							<%
							if (product.getProductImage() != null) {
								String encodedImage = Base64.getEncoder().encodeToString(product.getProductImage());
							%>
							<img src="data:image/jpeg;base64,<%=encodedImage%>" class="w-100" />
							<%
							} else {
							%>
							<img src="default-image.jpg" class="w-100" />
							<%
							}
							%>
						</div>
						<div class="card-body">
							<a href="" class="text-reset">
								<h5 class="card-title mb-3"><%=product.getProductName()%></h5>
							</a>
							<p>
								Color:
								<%=product.getProductColor()%></p>
							<p>
								Price:
								<%=product.getProductPrice()%></p>
							<p>
								Quantity:
								<%=product.getProductQuantity()%></p>
							<p>
								Brand:
								<%=product.getProductBrand()%></p>
							<!-- Optional Button to Add to Cart -->
							<form action="addToCart" method="post">
								<input type="hidden" name="productId"
									value="${product.productId}">
								<button type="submit">Add to Cart</button>
							</form>

							<a href="#" class="btn btn-primary">BUY NOW</a>
						</div>
					</div>
				</div>

				<%
				}
				} else {
				%>
				<p>No products available.</p>
				<%
				}
				%>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="text-center text-lg-start bg-body-tertiary text-muted">
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
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
						<p>Here you can use rows and columns to organize your footer
							content. Lorem ipsum dolor sit amet, consectetur adipisicing
							elit.</p>
					</div>

					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<h6 class="text-uppercase fw-bold mb-4">Products</h6>
						<p>
							<a href="#!" class="text-reset">Angular</a>
						</p>
						<p>
							<a href="#!" class="text-reset">React</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Vue</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Laravel</a>
						</p>
					</div>

					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
						<p>
							<a href="#!" class="text-reset">Pricing</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Settings</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Orders</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Help</a>
						</p>
					</div>

					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
						<p>
							<i class="fas fa-home me-3"></i> Narkatiaganj
						</p>
						<p>
							<i class="fas fa-envelope me-3"></i> gaurav.m2208.gm@gmail.com
						</p>
						<p>
							<i class="fas fa-phone me-3"></i> +917562898502
						</p>
						<p>
							<i class="fas fa-print me-3"></i> +917004392147
						</p>
					</div>
				</div>
			</div>
		</section>

		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.05);">
			© 2021 Copyright: <a class="text-reset fw-bold"
				href="https://mdbootstrap.com/">Saurav.com</a>
		</div>
	</footer>

</body>
</html>
