package com.hoa.dao;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.tomcat.jni.File;

import com.hoa.exception.DBException;

public class DataAccessImpl implements IDataAcessLayer {
	static Connection conn = null;

	@Override
	public Connection getConnect() throws IOException, DBException {
		InputStream input = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Properties properties = new Properties();
			String path = new java.io.File("C:\\Users\\nd_anh\\eclipse-workspace\\HShop\\resources\\db.properties").getAbsolutePath();
			input = new FileInputStream(path);
			properties.load(input);
			String url = properties.getProperty("url");
			String user = properties.getProperty("user");
			String pass = properties.getProperty("pass");
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false);
		} catch (Exception e) {
			throw new DBException(e);
		} finally {
			if (input != null) {
				input.close();
			}
		}

		return conn;
	}

	@Override
	public void rollBack() {
		if (conn != null) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void commit() throws DBException {
		if (conn != null) {
			try {
				conn.commit();
			} catch (SQLException e) {
				throw new DBException(e);
			}
		}
	}

	@Override
	public PreparedStatement  prepaStatement(StringBuilder strSql) throws DBException, IOException {
		try {
			return getConnect().prepareStatement(strSql.toString());
		} catch (SQLException e) {
			throw new DBException();
		}
	}

}
