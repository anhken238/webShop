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

	public void create(Product product) throws DBException;

	public List<Product> getList(int startRow, int pageSize) throws DBException;

	public  void deleteById(String id) throws DBException;

	public void edit(Product product, Boolean timeWarning) throws DBException;

	public void deleteMultiplesProducts(StringBuilder ids) throws DBException;

	public int getTotalRecord() throws DBException;

	public Product getProductById(String id) throws DBException;

}
