package br.com.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Service;

import br.com.crm.dao.IPaisDAO;
import br.com.crm.model.entity.PaisModel;
import br.com.crm.service.IPaisService;

@Service
@RemotingDestination
public class PaisService implements IPaisService{
	
	@Resource
	IPaisDAO dao;
	
	public PaisModel findPaisModel(Long id) {
		return dao.findPaisModel(id);
	}

}
