package com.jsp.ecommerce_jee_project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jsp.ecommerce_jee_project.connection.EcommerceConnection;
import com.jsp.ecommerce_jee_project.dao.ProductDao;
import com.jsp.ecommerce_jee_project.entity.Product;

public class ProductDaoImpl implements ProductDao {

	Connection connection = EcommerceConnection.getEcommerceConnection();

	final String PRODUCT_REGISTER_QUERY = "insert into product(name,color,price,quantity,brand,image,ownerid) values(?,?,?,?,?,?,?)";

	final String GET_CUSTOMER_BY_EMAIL_QUERY = "select * from customer where email=?";

	final String SELECT_ALL_PRODUCTS = "SELECT * from product";

	@Override
	public Product productregister(Product product) {

		try {
			PreparedStatement ps = connection.prepareStatement(PRODUCT_REGISTER_QUERY);

			ps.setString(1, product.getProductName());
			ps.setString(2, product.getProductColor());
			ps.setDouble(3, product.getProductPrice());
			ps.setInt(4, product.getProductQuantity());
			ps.setString(5, product.getProductBrand());
			ps.setBytes(6, product.getProductImage());
			ps.setInt(7, product.getOwnerId());

			int a = ps.executeUpdate();

			if (a != 0) {
				System.out.println("customer registered");
				return product;
			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<Product> getAllProduct() {

		List<Product> list = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(SELECT_ALL_PRODUCTS);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("id"));  // Assuming 'id' is the primary key
				product.setProductName(rs.getString("name"));
				product.setProductColor(rs.getString("color"));
				product.setProductPrice(rs.getDouble("price"));
				product.setProductQuantity(rs.getInt("quantity"));
				product.setProductBrand(rs.getString("brand"));
				product.setProductImage(rs.getBytes("image"));
				product.setOwnerId(rs.getInt("ownerid"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}
	
	@Override
	public Product getProductById(int productId) {
	    Product product = null;
	    String GET_PRODUCT_BY_ID_QUERY = "SELECT * FROM product WHERE id = ?";

	    try {
	        PreparedStatement ps = connection.prepareStatement(GET_PRODUCT_BY_ID_QUERY);
	        ps.setInt(1, productId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            product = new Product();
	            product.setProductId(rs.getInt("id"));  // Assuming 'id' is the primary key
	            product.setProductName(rs.getString("name"));
	            product.setProductColor(rs.getString("color"));
	            product.setProductPrice(rs.getDouble("price"));
	            product.setProductQuantity(rs.getInt("quantity"));
	            product.setProductBrand(rs.getString("brand"));
	            product.setProductImage(rs.getBytes("image"));
	            product.setOwnerId(rs.getInt("ownerid"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return product;
	}

}
