package com.hoa.exception;

public class ProcessException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4368292317088389745L;

	public ProcessException(Exception e) {
		super();
		System.out.println("ProcessException: " + e);
	}

	public ProcessException(String messengerError) {
		super();
		System.out.println(getClass().getSimpleName() + ": " + "ProcessException: " + getClass().getDeclaredFields() + " " + messengerError);
	}

}
