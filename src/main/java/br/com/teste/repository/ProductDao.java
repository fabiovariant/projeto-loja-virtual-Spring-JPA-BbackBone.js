package br.com.teste.repository;

import br.com.teste.models.Product;

import java.util.List;

public interface ProductDao {
	
	List<Product> getAll();
	Product searchById(Integer id);
	
    void save(Product person);

}
