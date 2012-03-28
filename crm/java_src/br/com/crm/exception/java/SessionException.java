package br.com.crm.exception.java;

public class SessionException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	public SessionException() {

	}

	/**
	 * @param arg0
	 */
	public SessionException(String arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 */
	public SessionException(Throwable arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 * @param arg1
	 */
	public SessionException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}
}
