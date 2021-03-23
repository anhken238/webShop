package com.hoa.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.hoa.exception.DBException;

public interface IDataAcessLayer {
	Connection conn = null;

	public default  Connection getConnect() throws IOException, DBException {
		return conn;
	}

	public default void rollBack() {}

}
