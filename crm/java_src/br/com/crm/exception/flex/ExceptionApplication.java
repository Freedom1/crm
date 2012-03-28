package br.com.crm.exception.flex;

import org.springframework.flex.core.ExceptionTranslator;
import org.springframework.util.ClassUtils;

import br.com.crm.exception.java.DAOException;
import br.com.crm.exception.java.ServiceException;
import br.com.crm.exception.java.SessionException;

import flex.messaging.MessageException;

public class ExceptionApplication implements ExceptionTranslator{
 
    /* (non-Javadoc)
     * @see org.springframework.flex.core.ExceptionTranslator#handles(java.lang.Class)
     */
    public boolean handles(Class<?> arg0) {
        return (ClassUtils.isAssignable(Exception.class, arg0));
    }
 
    /* (non-Javadoc)
     * @see org.springframework.flex.core.ExceptionTranslator#translate(java.lang.Throwable)
     */
    public MessageException translate(Throwable arg0) {
        MessageException ex =new MessageException();
        //ex.setCode(ExceptionType.APPLICATION_EXCEPTION.getValor());
        if(arg0 != null){
            if(arg0 instanceof DAOException || arg0 instanceof ServiceException){
                //ex.setCode(ExceptionType.APPLICATION_ALERT.getValor());
            }else{
                if(arg0 instanceof SessionException){
                    //ex.setCode(ExceptionType.APPLICATION_SESSION.getValor());
                }
            }
        }
        ex.setMessage(arg0.getMessage());
        ex.setRootCause(arg0);
        return ex;
    }
}
