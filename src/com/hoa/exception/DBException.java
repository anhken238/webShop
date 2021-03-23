package com.hoa.exception;

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
