package br.com.teste.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name = "products")
public class Product implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@TableGenerator(name="TABLE_GEN",table="T_GENERATOR",pkColumnName="GEN_KEY",pkColumnValue="TEST",valueColumnName="GEN_VALUE",initialValue=1,allocationSize=1)
	@GeneratedValue(strategy=GenerationType.TABLE, generator="TABLE_GEN")
	@Column(name="prod_id")
	private Integer id;
	
	@Column(name = "prod_name")
	private String name;
	
	@Column(name =  "prod_type")
	private String type;
	
	@Column(name = "prod_quantity")
	private Integer quantity;
	
	@Column(name = "prod_price")
	private String price;
	
	@Column(name = "prod_description")
	private String description;
	
	@Column(name = "prod_tel")
	private String tel;
	
	@Column(name = "prod_locale")
	private String locale;
	
	public Product(){}



	public Product(Integer id, String name, String type, Integer quantity, String price, String description, String tel,
			String locale) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.quantity = quantity;
		this.price = price;
		this.description = description;
		this.tel = tel;
		this.locale = locale;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getLocale() {
		return locale;
	}



	public void setLocale(String locale) {
		this.locale = locale;
	}
}
