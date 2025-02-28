package com.jsp.ecommerce_jee_project.dao;

import com.jsp.ecommerce_jee_project.entity.Cart;
import java.util.List;

public interface CartDao {
    boolean addToCart(int userId, int productId, int quantity);
    List<Cart> getCartByUserId(int userId);
}
