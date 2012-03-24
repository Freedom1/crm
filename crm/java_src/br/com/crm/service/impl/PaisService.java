package br.com.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Service;

import br.com.crm.dao.IPaisDAO;
import br.com.crm.exception.java.DAOException;
import br.com.crm.model.entity.PaisModel;
import br.com.crm.service.IPaisService;

@Service
@RemotingDestination
public class PaisService implements IPaisService{
	
	@Resource
	IPaisDAO dao;
	
	/* (non-Javadoc)
	 * @see br.com.crm.service.IPaisService#findPaisModel(java.lang.Long)
	 */
	@Override
	public PaisModel findPaisModel(Long id) throws DAOException {
		return dao.findPaisModel(id);
	}

	/* (non-Javadoc)
	 * @see br.com.crm.service.IPaisService#savePaisModel(br.com.crm.model.entity.PaisModel)
	 */
	@Override
	public void savePaisModel(PaisModel entity) throws DAOException{
		dao.savePaisModel(entity);
	}
}
