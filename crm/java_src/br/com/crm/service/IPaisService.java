package br.com.crm.service;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.crm.model.entity.PaisModel;

public interface IPaisService {

	
	@Transactional(readOnly = true, propagation=Propagation.SUPPORTS, rollbackFor=Exception.class)
	public PaisModel findPaisModel(Long id);
}
