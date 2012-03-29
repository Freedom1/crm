package br.com.crm.service.impl;

import mockit.Mockit;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.crm.exception.java.DAOException;
import br.com.crm.model.entity.PaisModel;
import br.com.crm.service.IPaisService;
import br.com.crm.session.ISessionTemplate;
import br.com.crm.session.MockContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("app-test.xml")
public class PaisTest {

	/**************************************************************/
	/*********************** INICIALIZACAO ************************/
	/**************************************************************/
	/**
	 * Inicializa o simulador de sessão do flex.
	 *
	 * @throws Exception
	 */
	@BeforeClass
	public static void startFlexSessionMock() throws Exception {
	    Mockit.setUpMocks(MockContext.class);
	}

	/**************************************************************/
	/************************* ATRIBUTOS **************************/
	/**************************************************************/
	@Autowired
	IPaisService service;
	
	@Autowired
	ISessionTemplate sessionTemplate;
	
	
	
	
	
	/**
	 * 
	 * @throws DAOException
	 */
	@Test
	public void testFindPaisModel() throws DAOException{
		PaisModel model= service.findPaisModel((long) 1);
		Assert.notNull(model);
		System.out.println(model.getTxPais());
	}
	
	/**
	 * Tenta salvar um objeto nulo na base de dados.
	 * 
	 * Objetivo: Retornar o erro DAOException.
	 * 
	 */
	@Transactional
	@Test(expected=DAOException.class)
	public void testSavePaisModelNulo() throws DAOException{
		service.savePaisModel(null);
	}
}
