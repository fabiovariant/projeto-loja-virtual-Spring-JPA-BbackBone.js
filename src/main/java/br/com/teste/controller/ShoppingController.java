package br.com.teste.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.teste.service.ProductManager;
import br.com.teste.models.Product;

@Controller
@RequestMapping(value = "/")
public class ShoppingController {
	
	@Autowired
	ProductManager productManager;
	
	@RequestMapping(value = "/list_products", 
					method = RequestMethod.GET,
					produces = "application/json")
	@ResponseBody
	public List<Product> listProducts() throws Exception{
		return productManager.getAll();
	}
	
	@RequestMapping(value = "/product/{id}", 
			method = RequestMethod.GET,
			produces = "application/json")
	@ResponseBody
	public Product openSingleProduct(@PathVariable Integer id) throws Exception{
		return productManager.searchById(id);
	}

	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public String save(@ModelAttribute Product product) throws Exception{
		productManager.save(product);
		
		return "home";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String fillHome(Model model){		
		return "home";
	}
}
