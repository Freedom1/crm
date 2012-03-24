package br.com.crm.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import br.com.crm.model.entity.PaisModel;
import br.com.crm.service.IPaisService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("app-test.xml")
public class PaisTest {

	@Autowired
	IPaisService service;
	
	@Test
	public void testFindPaisModel(){
		PaisModel model= service.findPaisModel((long) 1);
		Assert.notNull(model);
		System.out.println(model.getTxPais());
	}
}
