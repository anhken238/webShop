package com.hoa.model;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hoa.dao.DataAccessImpl;
import com.hoa.dao.IDataAcessLayer;
import com.hoa.exception.DBException;

public class User {
	 static IDataAcessLayer iDataAcessLayer = new DataAccessImpl();

	public static void main() throws DBException {
		try {
			iDataAcessLayer.getConnect();
			ResultSet rs = null;
			PreparedStatement ps = null;
			try {
				final String sqlScripStm = "SELECT * FROM `mkl_stg`.`tot060_pickord` where CSTMCD = ? and PCKNGLSTNO = ? ; ";

				ps = iDataAcessLayer.getConnect().prepareStatement(sqlScripStm);

				ps.setString(1, "MKLF0001");
				ps.setString(2, "PL160415000043");
				rs = ps.executeQuery();

				while (rs.next()) {
					System.out.println("Gia Tri SoordNo: " + rs.getString("SOORDNO"));
				}
			} catch (SQLException e) {
				System.out.println("error");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
