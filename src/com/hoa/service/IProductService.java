package com.hoa.service;

import java.util.List;

import com.hoa.exception.DBException;
import com.hoa.model.Product;

/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/08 15:50:22
 */
public interface IProductService {

	public List<Product> create(Product product) throws DBException;

	public List<Product> getList(int pageNo, int pageSize) throws DBException;

	public List<Product> deleteById(String id) throws DBException;

	public List<Product> edit(Product product, Boolean timeWarning) throws DBException;

	public List<Product> deleteMultiplesProducts(StringBuilder ids) throws DBException;

	public int getTotalRecord() throws DBException;

	public Product getProductById(String id) throws DBException;

}
