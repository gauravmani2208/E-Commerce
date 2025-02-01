package com.jsp.ecommerce_jee_project.dao;

import com.jsp.ecommerce_jee_project.entity.Admin;

public interface AdminDao {

	public Admin registerAdminDao(Admin customer);

	public Admin getAdminByIdDao(String email);

}
