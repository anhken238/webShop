package com.hoa.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hoa.common.Validation;
import com.hoa.dao.DataAccessImpl;
import com.hoa.dao.IDataAcessLayer;
import com.hoa.exception.DBException;
import com.hoa.model.Product;

public class ProductImpl implements IProductService {
	IDataAcessLayer iDataAcessLayer = new DataAccessImpl();

	@Override
	public void create(Product product) throws DBException {
		PreparedStatement ps = null;
		String strSql = new String();
		int index = 1;
		try {
			strSql = " insert into product ";
			strSql += " (code,name,price,amount,manufacturing_date,limit_date,description,status) ";
			strSql += " values ";
			strSql += " (?, ?, ?, ?, ?, ?, ?, ?, ?); ";
			ps = iDataAcessLayer.getConnect().prepareStatement(strSql);
			ps.setString(index++, product.getCode());
			ps.setString(index++, product.getName());
			ps.setString(index++, product.getPrice());
			ps.setString(index++, product.getAmount());
			ps.setString(index++, product.getManufacturingDate());
			ps.setString(index++, product.getLitmiDate());
			ps.setString(index++, product.getDescription());
			ps.setString(index++, product.getStatus());
			
			int check = ps.executeUpdate();
			if(!new Validation().checkNull(product.getImage())) {
				createFileOfProduct(product);
			}
			if(check == 0) {
				try {
					iDataAcessLayer.rollBack();
				} catch (Exception e) {
					//throw new ProcessException();
				}
			}
		} catch (Exception e) {
			throw new DBException(e);
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
		}
	}

	private void createFileOfProduct(Product product) throws DBException {
		PreparedStatement ps = null;
		String strSql = new String();
		int index = 1;
		try {
			strSql = " insert into fille_product ";
			strSql += " (code,image,path) ";
			strSql += " values ";
			strSql += " (?, ?, ?); ";
			ps = iDataAcessLayer.getConnect().prepareStatement(strSql);
			ps.setString(index++, product.getCode());
			ps.setString(index++, product.getImage());
			ps.setString(index++, product.getPath());
			
			int check = ps.executeUpdate();
			if(!new Validation().checkNull(product.getImage())) {
				createFileOfProduct(product);
			}
			if(check == 0) {
				try {
					iDataAcessLayer.rollBack();
				} catch (Exception e) {
					//throw new ProcessException();
				}
			}
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
		}
	}

}
