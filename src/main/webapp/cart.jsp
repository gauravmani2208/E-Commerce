<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsp.ecommerce_jee_project.dao.CartDao" %>
<%@ page import="com.jsp.ecommerce_jee_project.dao.impl.CartDaoImpl" %>
<%@ page import="com.jsp.ecommerce_jee_project.entity.Cart" %>
<%@ page import="java.util.List" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("customer-login.jsp");
        return;
    }

    CartDao cartDao = new CartDaoImpl();
    List<Cart> cartItems = cartDao.getCartByUserId(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">Your Cart</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <% for (Cart cart : cartItems) { %>
                <tr>
                    <td><%= cart.getProductId() %></td>
                    <td><%= cart.getQuantity() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="customer-home.jsp" class="btn btn-primary">Continue Shopping</a>
    </div>
</body>
</html>
