package com.jsp.ecommerce_jee_project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jsp.ecommerce_jee_project.connection.EcommerceConnection;
import com.jsp.ecommerce_jee_project.dao.AdminDao;
import com.jsp.ecommerce_jee_project.entity.Admin;
import com.jsp.ecommerce_jee_project.entity.Customer;

public class AdminDaoImpl implements AdminDao {

	Connection connection = EcommerceConnection.getEcommerceConnection();

	final String CUSTOMER_REGISTER_QUERY = "insert into admin(name,email,password) values(?,?,?)";

	final String GET_CUSTOMER_BY_EMAIL_QUERY = "select * from admin where email=?";

	@Override
	public Admin registerAdminDao(Admin admin) {

		try {

			PreparedStatement ps = connection.prepareStatement(CUSTOMER_REGISTER_QUERY);

			ps.setString(1, admin.getAdminName());
			ps.setString(2, admin.getAdminEmail());
			ps.setString(3, admin.getAdminPassword());

			int a = ps.executeUpdate();

			if (a != 0) {
				System.out.println("customer registered");
				return admin;
			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Admin getAdminByIdDao(String email) {
		try {

			PreparedStatement ps = connection.prepareStatement(GET_CUSTOMER_BY_EMAIL_QUERY);

			ps.setString(1, email);

			ResultSet set = ps.executeQuery();

			if (set.next()) {
				return new Admin(set.getString("email"), set.getString("password"));
			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}

