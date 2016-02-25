package br.com.teste.repository.impl;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.jdbc.object.StoredProcedure;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class BaseDao<T> {

    private Class<T> clazz =  (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    
    @PersistenceContext
    private EntityManager entityManager;

    public List<T> getAll() {        
        CriteriaBuilder builder = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<T> query = builder.createQuery(clazz);
        Root<T> variableRoot = query.from(clazz);
        query.select(variableRoot);

        return getEntityManager().createQuery(query).getResultList();
    }

    public T searchById(Integer id){
    	T object =  entityManager.find(clazz, id);
    	
    	return object;
    }

    public void save(final T entity) {
    	entityManager.persist(entity);
    }


    protected EntityManager getEntityManager() {
        return entityManager;
    }
}
