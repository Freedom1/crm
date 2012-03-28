/**
 * 
 */
package br.com.crm.model.datatypes;

public enum ExceptionType {
	APPLICATION_EXCEPTION("Application.Exception"),
    APPLICATION_ALERT("Application.Alert"),
    APPLICATION_SESSION("Application.Session");
 
    private String valor;
 
    /**
     * @param valor
     */
    ExceptionType(String valor){
        this.valor = valor;
    }
 
    /**
     * @return the valor
     */
    public String getValor() {
        return valor;
    }
}
