package com.jsp.ecommerce_jee_project.dao;

import java.util.List;

import com.jsp.ecommerce_jee_project.entity.Product;

public interface ProductDao {

	public Product productregister(Product product);

	public List<Product> getAllProduct();

	public Product getProductById(int productId);

}
