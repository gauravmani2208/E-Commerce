package com.jsp.ecommerce_jee_project.controller;

import java.io.IOException;
import java.util.List;

import com.jsp.ecommerce_jee_project.dao.ProductDao;
import com.jsp.ecommerce_jee_project.dao.impl.ProductDaoImpl;
import com.jsp.ecommerce_jee_project.entity.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet(value="/product-display")
@WebServlet("/DisplayProductController")
@MultipartConfig
public class DisplayProductController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductDao dao = new ProductDaoImpl();
		List<Product> products = dao.getAllProduct();

		req.setAttribute("products", products);
		RequestDispatcher dispatcher= req.getRequestDispatcher("product-display.jsp");
		dispatcher.forward(req, resp);
		

	}
}




