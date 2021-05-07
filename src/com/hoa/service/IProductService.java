package com.hoa.service;

import java.util.List;

import com.hoa.exception.DBException;
import com.hoa.model.Product;

public interface IProductService {

	public List<Product> create(Product product) throws DBException;

	public List<Product> getList() throws DBException;

	public List<Product> deleteById(String id) throws DBException;
	
	public Product getProductById(String id)throws DBException;

}
