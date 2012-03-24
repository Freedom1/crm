package br.com.crm.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

@ContextConfiguration(locations = "*-test.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "hibernateTransactionManager", defaultRollback = true)
public class MessageTest {

	 @Autowired
	    public MessageSource messages;
	 
	    @Test
	    public void testMessage(){
	        System.out.println(this.getMessage("exceptions.pais.invalido"));
	    }
	 
	    protected String getMessage(String msg){
	        return messages.getMessage(msg,null,null);
	    }
	    
}
