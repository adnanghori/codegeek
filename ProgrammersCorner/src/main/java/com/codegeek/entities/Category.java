package com.codegeek.entities;

public class Category {
	private int category_id;
	private String name;
	private String description;
	
				// Constructors //
	public Category() {
		super();
	}
	
	public Category(int category_id, String name, String description) {
		super();
		this.category_id = category_id;
		this.name = name;
		this.description = description;
	}

	public Category(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}
			// Getters And Setters //

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
			

				
}
