package com.hoa.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hoa.exception.DBException;
/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/08 13:46:56
 */
public interface IDataAcessLayer {

	Connection conn = null;

	public default Connection getConnect() throws IOException, DBException {
		return conn;
	}

	public default void rollBack() {
	}

	public default void commit() throws DBException {

	}

	public default PreparedStatement prepaStatement(StringBuilder strSql) throws DBException, IOException {
		PreparedStatement PrepaStatement = null;
		return PrepaStatement;
	}
	
	public default void closeConn() throws IOException, DBException, SQLException {
		
	}

}
