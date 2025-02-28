package com.jsp.ecommerce_jee_project.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Driver;

public class EcommerceConnection {

	public static Connection getEcommerceConnection() {

		try {
			Driver d = new Driver();

			DriverManager.registerDriver(d);

			return DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "tiger");
		} catch (SQLException e) {

			e.printStackTrace();

			return null;

		}
	}

}
