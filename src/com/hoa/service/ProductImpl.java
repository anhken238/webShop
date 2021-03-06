package com.hoa.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hoa.common.CommonUtility;
import com.hoa.common.ConstantValue;
import com.hoa.common.Validation;
import com.hoa.dao.DataAccessImpl;
import com.hoa.dao.IDataAcessLayer;
import com.hoa.exception.DBException;
import com.hoa.model.Product;

/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/08 15:40:29
 */
public class ProductImpl implements IProductService {

	IDataAcessLayer iDataAcessLayer = new DataAccessImpl();

	@Override
	public void create(Product product) throws DBException {

		PreparedStatement ps = null;
		StringBuilder strSql = new StringBuilder();
		int index = 1;
		try {

			strSql.append(" insert into product ");
			strSql.append(" (code,name,price,amount,manufacturing_date,limit_date,description,status) ");
			strSql.append(" values ");
			strSql.append(" (?, ?, ?, ?, ?, ?, ?, ?); ");
			ps = iDataAcessLayer.prepaStatement(strSql);
			ps.setString(index++, product.getCode());
			ps.setString(index++, product.getName());
			ps.setString(index++, String.valueOf((product.getPrice())));
			ps.setInt(index++, product.getAmount());
			ps.setString(index++, product.getManufacturingDate());
			ps.setString(index++, product.getLitmiDate());
			ps.setString(index++, product.getDescription());
			ps.setString(index++, product.getStatus());

			ps.executeUpdate();
			iDataAcessLayer.commit();
//			if(!new Validation().checkNull(product.getImage())) {
//				createFileOfProduct(product);
//			}

			try {
				iDataAcessLayer.rollBack();
			} catch (Exception e) {
				// throw new ProcessException();
			}

		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}
	}

	private void createFileOfProduct(Product product) throws DBException {

		PreparedStatement ps = null;
		StringBuilder strSql = new StringBuilder();
		int index = 1;
		try {
			strSql.append(" insert into fille_product ");
			strSql.append(" (code,image,path) ");
			strSql.append(" values ");
			strSql.append(" (?, ?, ?); ");
			ps = iDataAcessLayer.prepaStatement(strSql);
			ps.setString(index++, product.getCode());
			ps.setString(index++, product.getImage());
			ps.setString(index++, product.getPath());

			int status = ps.executeUpdate();
			if (!new Validation().isNull(product.getImage())) {
				createFileOfProduct(product);
			}
			if (status > 0) {
				try {
					iDataAcessLayer.rollBack();
				} catch (Exception e) {
					// throw new ProcessException();
				}
			}
			iDataAcessLayer.commit();
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}
	}

	@Override
	public Product getProductById(String id) throws DBException {
		PreparedStatement ps = null;
		Product product = new Product();
		ResultSet rs = null;
		StringBuilder strSql = new StringBuilder();
		try {
			strSql.append(" SELECT *   ");
			strSql.append(" FROM       ");
			strSql.append(" PRODUCT ");
			strSql.append(" WHERE ");
			strSql.append(" CODE = ? ");
			ps = iDataAcessLayer.prepaStatement(strSql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				product.setCode(rs.getString("CODE"));
				product.setName(rs.getString("NAME"));
				product.setPrice(Float.parseFloat(rs.getString("PRICE")));
				product.setAmount(Integer.parseInt(rs.getString("AMOUNT")));
				if (rs.getString("MANUFACTURING_DATE").length() == 10) {
					product.setManufacturingDate(new CommonUtility().formatDateTime(rs.getString("MANUFACTURING_DATE"),
							ConstantValue.DATE_FORMAT_DB, ConstantValue.DATE_FORMAT_DISPLAY));
				}
				if (rs.getString("LIMIT_DATE").length() == 10) {
					product.setLitmiDate(new CommonUtility().formatDateTime(rs.getString("LIMIT_DATE"),
							ConstantValue.DATE_FORMAT_DB, ConstantValue.DATE_FORMAT_DISPLAY));
				}
				product.setDescription(rs.getString("DESCRIPTION"));
				product.setStatus(rs.getString("STATUS"));
			}
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}

		return product;
	}

	@Override
	public void edit(Product product, Boolean checkFlg) throws DBException {
		PreparedStatement ps = null;
		int index = 1;
		StringBuilder strSql = new StringBuilder();
		try {
			if (checkFlg) {
				strSql.append(" UPDATE PRODUCT   ");
				strSql.append(" SET NAME= ?, PRICE =?, AMOUNT =?, MANUFACTURING_DATE=?,  ");
				strSql.append(" LIMIT_DATE=?, DESCRIPTION=?, STATUS = ? ");
				strSql.append(" WHERE CODE = ?; ");
			} else {
				strSql.append(" UPDATE PRODUCT   ");
				strSql.append(" SET NAME= ?, PRICE =?, AMOUNT =?, MANUFACTURING_DATE=?,  ");
				strSql.append(" LIMIT_DATE=?, DESCRIPTION=? ");
				strSql.append(" WHERE CODE = ?; ");
			}
			ps = iDataAcessLayer.prepaStatement(strSql);
			ps.setString(index++, product.getName());
			ps.setString(index++, String.valueOf((product.getPrice())));
			ps.setInt(index++, product.getAmount());
			ps.setString(index++, product.getManufacturingDate());
			ps.setString(index++, product.getLitmiDate());
			ps.setString(index++, product.getDescription());
			if (checkFlg) {
				ps.setString(index++, product.getStatus());
			}
			ps.setString(index++, product.getCode());
			ps.executeUpdate();
			iDataAcessLayer.commit();
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}
	}

	@Override
	public int getTotalRecord() throws DBException {
		int count = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		StringBuilder strSql = new StringBuilder();
		try {
			strSql.append(" SELECT COUNT(*) AS CNT   ");
			strSql.append(" FROM       ");
			strSql.append(" PRODUCT ;  ");
			ps = iDataAcessLayer.prepaStatement(strSql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("CNT");
			}
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}

		return count;
	}

	@Override
	public List<Product> getList(int startRow, int pageSize) throws DBException {
		List<Product> productList = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		StringBuilder strSql = new StringBuilder();
		try {
			strSql.append(" SELECT *   ");
			strSql.append(" FROM       ");
			strSql.append(" PRODUCT   ");
			strSql.append(" ORDER BY LIMIT_DATE ASC  ");
			strSql.append(" LIMIT ?   ");
			strSql.append(" OFFSET ?  ; ");
			
			ps = iDataAcessLayer.prepaStatement(strSql);
			ps.setInt(1, pageSize);
			ps.setInt(2, startRow);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setCode(rs.getString("CODE"));
				product.setName(rs.getString("NAME"));
				product.setPrice(Float.parseFloat(rs.getString("PRICE")));
				product.setAmount(Integer.parseInt(rs.getString("AMOUNT")));
				if (rs.getString("MANUFACTURING_DATE").length() == 10) {
					product.setManufacturingDate(new CommonUtility().formatDateTime(rs.getString("MANUFACTURING_DATE"),
							ConstantValue.DATE_FORMAT_DB, ConstantValue.DATE_FORMAT_DISPLAY));
				}
				if (rs.getString("LIMIT_DATE").length() == 10) {
					product.setLitmiDate(new CommonUtility().formatDateTime(rs.getString("LIMIT_DATE"),
							ConstantValue.DATE_FORMAT_DB, ConstantValue.DATE_FORMAT_DISPLAY));
				}
				product.setDescription(rs.getString("DESCRIPTION"));
				product.setStatus(rs.getString("STATUS"));
				productList.add(product);
			}
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}

		return productList;
	}

	@Override
	public void deleteById(String id) throws DBException {
		PreparedStatement ps = null;
		StringBuilder strSql = new StringBuilder();
		try {
			strSql.append(" DELETE   ");
			strSql.append(" FROM       ");
			strSql.append(" PRODUCT  ");
			strSql.append(" WHERE CODE = ? ;  ");
			ps = iDataAcessLayer.prepaStatement(strSql);
			ps.setString(1, id);
			ps.executeUpdate();
			iDataAcessLayer.commit();
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new DBException(e);
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}
	}

	@Override
	public void deleteMultiplesProducts(StringBuilder ids) throws DBException {
		PreparedStatement ps = null;
		StringBuilder strSql = new StringBuilder();
		try {
			strSql.append(" DELETE   ");
			strSql.append(" FROM       ");
			strSql.append(" PRODUCT  ");
			strSql.append(" WHERE CODE IN (");
			strSql.append(ids);
			strSql.append("); ");
			ps = iDataAcessLayer.prepaStatement(strSql);
			ps.executeUpdate();
			iDataAcessLayer.commit();
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			try {
				iDataAcessLayer.closeConn();
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new DBException(e);
			}
		}
	}

}
