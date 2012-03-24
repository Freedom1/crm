package br.com.crm.dao;

import java.util.List;

import br.com.crm.exception.java.DAOException;
import br.com.crm.model.entity.PaisModel;

public interface IPaisDAO {

	/**
	 * Busca o 'PaisModel' pelo identificador.
	 * 
	 * @param id Identificador.
	 * @return Retorna 'PaisModel' conforme o identificador.
	 * @throws DAOException Exception específica para DAO.
	 */
	public PaisModel findPaisModel(Long id) throws DAOException;
	
	
	/**
	 * Busca todos os 'PaisModel' conforme o filtro.
	 * 
	 * @param firstResult Primeiro elemento.
	 * @param maxResults Máximo de Elemntos
	 * @return Retorna todos os 'PaisModel' conforme o filtro.
	 * @throws DAOException Exception específica para DAO.
	 */
	public List<PaisModel> findPaisModelEntries(int firstResult, int maxResults) throws DAOException;
	
	/**
	 * Busca todos os 'PaisModel'.
	 * 
	 * @return Retorna todos os 'PaisModel'.
	 * @throws DAOException Exception específica para DAO.
	 */
	public List<PaisModel> findAllPaisModels() throws DAOException;
	
	/**
	 * Obtem a quantidade de 'PaisModel'.
	 * 
	 * @return Retorna a quantidade de 'PaisModel'.
	 * @throws DAOException Exception específica para DAO.
	 */
	public long countPaisModels() throws DAOException;
	
	/**
	 * @param entity
	 * @throws DAOException Exception específica para DAO.
	 */
	public void savePaisModel(PaisModel entity) throws DAOException;
	
	/**
	 * @param entity
	 * @throws DAOException Exception específica para DAO.
	 */
	public void updatePaisModel(PaisModel entity) throws DAOException;
	
	/**
	 * @param entity
	 * @throws DAOException Exception específica para DAO.
	 */
	public void deletePaisModel(PaisModel entity) throws DAOException;
	
	/**
	 * @param entityId
	 * @throws DAOException Exception específica para DAO.
	 */
	public void deletePaisModelById(Long id) throws DAOException;
	 
	 
}
