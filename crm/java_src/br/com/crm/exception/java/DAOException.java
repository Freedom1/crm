/**
 * 
 */
package br.com.crm.exception.java;

/**
 * @author silvano.pessoa
 *
 */
public class DAOException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	public DAOException() {

	}

	/**
	 * @param arg0
	 */
	public DAOException(String arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 */
	public DAOException(Throwable arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 * @param arg1
	 */
	public DAOException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

}
