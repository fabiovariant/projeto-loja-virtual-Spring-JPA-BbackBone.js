package br.com.teste.service.impl;

import br.com.teste.models.Product;
import br.com.teste.repository.ProductDao;
import br.com.teste.service.ProductManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service(value = "productManager")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductManagerImpl implements ProductManager {

    @Autowired
    private ProductDao productDao;

    private static final Logger LOGGER = LoggerFactory.getLogger(ProductManagerImpl.class);
    
    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }
    
    @Override
    public void save(Product person) {
        productDao.save(person);
    }

    @Override
	public Product searchById(Integer id) {
		return productDao.searchById(id);
	}

}
