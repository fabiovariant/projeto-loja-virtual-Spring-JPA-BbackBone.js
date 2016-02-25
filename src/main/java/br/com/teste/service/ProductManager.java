package br.com.teste.service;

import br.com.teste.models.Product;

import java.util.List;

public interface ProductManager {

    List<Product> getAll();
    Product searchById(Integer id);

    void save(Product product);
    
}
