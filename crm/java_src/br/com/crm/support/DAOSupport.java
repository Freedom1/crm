package br.com.crm.support;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

public class DAOSupport {
	
	@Autowired
    public MessageSource messages;
	
	protected String getMessage(String msg){
        return messages.getMessage(msg,null,null);
    }
}
