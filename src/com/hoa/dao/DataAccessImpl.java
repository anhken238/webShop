package com.hoa.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.hoa.exception.DBException;

public class DataAccessImpl implements IDataAcessLayer {
	static Connection conn = null;
	
	@Override
	public  Connection getConnect() throws IOException, DBException {
		InputStream input = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Properties properties = new Properties();
			input = new FileInputStream("/db.properties");
			properties.load(input);
			String url = properties.getProperty("url");
			String user = properties.getProperty("user");
			String pass = properties.getProperty("pass");
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false);
		} catch (Exception e) {
			throw new DBException();
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

}
