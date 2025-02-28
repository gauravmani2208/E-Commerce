package com.jsp.ecommerce_jee_project.controller;

import java.io.IOException;
import java.io.InputStream;

import com.jsp.ecommerce_jee_project.dao.ProductDao;
import com.jsp.ecommerce_jee_project.dao.ProductOwnerDao;
import com.jsp.ecommerce_jee_project.dao.impl.ProductDaoImpl;
import com.jsp.ecommerce_jee_project.dao.impl.ProductOwnerDaoImpl;
import com.jsp.ecommerce_jee_project.entity.Product;
import com.jsp.ecommerce_jee_project.entity.ProductOwner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(value="/ProductRegister")
@MultipartConfig
public class RegisterProductController extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession httpSession =req.getSession();
		
		String name = req.getParameter("productName");
		String color = req.getParameter("productColor");

		String priceStr = req.getParameter("productPrice");
		double price = (priceStr != null && !priceStr.trim().isEmpty()) ? Double.parseDouble(priceStr) : 0.0;

		String quantityStr = req.getParameter("productQuantity");
		int quantity = (quantityStr != null && !quantityStr.trim().isEmpty()) ? Integer.parseInt(quantityStr) : 0;

		String brand = req.getParameter("productBrand");
		Part image = req.getPart("productImage");
		

		InputStream stream = image.getInputStream();
		byte[] imageBytes = stream.readAllBytes();
		
		String email=(String) httpSession.getAttribute("productOwnerSession");
		
		ProductOwnerDao daoImpl=new ProductOwnerDaoImpl();
		ProductOwner owner=daoImpl.getProductOwnerByEmailDao(email);
		int ownerid=owner.getOwnerId();
		
		
		System.out.println(name);
		Product product = new Product(name, color, price, quantity, brand, imageBytes,ownerid);

		ProductDao dao = new ProductDaoImpl();

		Product product2 = dao.productregister(product);

		if (product2 != null) {

			req.getRequestDispatcher("productOwner-home.jsp").forward(req, resp);
		} else {
			req.setAttribute("msg", "Not Insert product");
			req.getRequestDispatcher("productOwner-home.jsp").forward(req, resp);
		}

	}

}

