package com.codegeek.entities;

public class Message {
	private String content;
	private String type;
	private String cssClass;
	
				// 		Constructors	//
	public Message(String content, String type, String cssClass) {
		super();
		this.content = content;
		this.type = type;
		this.cssClass = cssClass;
	}
	//		 Getters And Setters

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
}
