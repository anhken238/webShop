package com.hoa.model;

import com.hoa.common.Validation;
/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/08 14:43:56
 */
public class Product {
	String code;
	String name;
	float price;
	int amount;
	String description;
	String manufacturingDate;
	String litmiDate;
	String image;
	String path;
	String status;

	public Product(String code, String name, float price, int amount, String description, String manufacturingDate,
			String litmiDate, String image) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.amount = amount;
		this.description = description;
		this.manufacturingDate = manufacturingDate;
		this.litmiDate = litmiDate;
		this.image = image;
	}

	public Product() {
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		String priceDisplay = "";
		if (!new Validation().isNull(String.valueOf(price))) {
			priceDisplay = String.format("%.2f", price);
		}
		return priceDisplay;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturingDate() {
		return manufacturingDate;
	}

	public void setManufacturingDate(String manufacturingDate) {
		this.manufacturingDate = manufacturingDate;
	}

	public String getLitmiDate() {
		return litmiDate;
	}

	public void setLitmiDate(String litmiDate) {
		this.litmiDate = litmiDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
