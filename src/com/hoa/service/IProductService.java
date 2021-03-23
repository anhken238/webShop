package com.hoa.service;

import com.hoa.exception.DBException;
import com.hoa.model.Product;

public interface IProductService {
	public void create(Product product) throws DBException;
}
