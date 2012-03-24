package br.com.crm.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.crm.dao.IPaisDAO;
import br.com.crm.model.entity.PaisModel;

@Repository
public class PaisDAO implements IPaisDAO{

	@PersistenceContext
	EntityManager entityManager;
	
	 public PaisModel findPaisModel(Long id) {
		return entityManager.find(PaisModel.class, id);
		 
	 }
}
