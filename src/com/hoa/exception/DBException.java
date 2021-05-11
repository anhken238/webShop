package com.hoa.exception;
/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/08 13:55:12
 */
public class DBException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2998569638965135556L;

	public DBException() {
		super();
	}

	public DBException(Exception e) {
		System.out.println("DBException:" + e);
	}

	public DBException(String s) {
		System.out.println("DBException:" + s);
	}
}
