package com.hoa.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hoa.exception.DBException;

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

}
