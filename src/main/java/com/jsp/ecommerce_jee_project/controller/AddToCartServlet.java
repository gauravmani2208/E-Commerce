package com.jsp.ecommerce_jee_project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ecommerce_jee_project.dao.CartDao;
import com.jsp.ecommerce_jee_project.dao.impl.CartDaoImpl;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private CartDao cartDao = new CartDaoImpl();
    
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("customer-login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = 1; // Default quantity

        boolean isAdded = cartDao.addToCart(userId, productId, quantity);

        if (isAdded) {
            response.sendRedirect("cart.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
