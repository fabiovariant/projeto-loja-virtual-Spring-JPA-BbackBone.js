package br.com.teste.repository.impl;

import br.com.teste.models.Product;
import br.com.teste.repository.ProductDao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository(value = "productDao")
@Transactional(propagation = Propagation.MANDATORY)
public class ProductDaoImpl extends BaseDao<Product> implements ProductDao {


}
