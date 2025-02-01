package com.jsp.ecommerce_jee_project.controller;

import java.io.IOException;

import com.jsp.ecommerce_jee_project.dao.impl.AdminDaoImpl;
import com.jsp.ecommerce_jee_project.entity.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/adminRegister")
@MultipartConfig
public class RegisterAdminController  extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String  name= req.getParameter("adminName");
		String email= req.getParameter("adminEmail");
		String password= req.getParameter("adminPassword");
		
		
		Admin admin = new Admin(name, email, password);
		
		
		AdminDaoImpl Dao = new AdminDaoImpl();
		
		Admin admin2= Dao.registerAdminDao(admin);
		
		if(admin2!=null) {
			
			req.getRequestDispatcher("admin-login.jsp").forward(req, resp);
		}else {
			req.setAttribute("msg", "check with your code something went wrong");
			req.getRequestDispatcher("admin-register.jsp").forward(req, resp);
		}
	
	}
}
