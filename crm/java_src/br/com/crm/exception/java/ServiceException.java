package br.com.crm.exception.java;

public class ServiceException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	/**
	 * 
	 */
	public ServiceException() {

	}

	/**
	 * @param arg0
	 */
	public ServiceException(String arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 */
	public ServiceException(Throwable arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 * @param arg1
	 */
	public ServiceException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

}
