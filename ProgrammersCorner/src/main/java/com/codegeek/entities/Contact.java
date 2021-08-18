package com.codegeek.entities;

public class Contact {
	private int contactid;
	private String contactname;
	private String contactemail;
	private String contactsubject;
	private String contactmessage;
	
	
	
	// Contructors //
	public Contact() {
		super();
	}



	public Contact(int contactid, String contactname, String contactemail, String contactsubject,
			String contactmessage) {
		super();
		this.contactid = contactid;
		this.contactname = contactname;
		this.contactemail = contactemail;
		this.contactsubject = contactsubject;
		this.contactmessage = contactmessage;
	}



	public Contact(String contactname, String contactemail, String contactsubject, String contactmessage) {
		super();
		this.contactname = contactname;
		this.contactemail = contactemail;
		this.contactsubject = contactsubject;
		this.contactmessage = contactmessage;
	}




	// Setter And Getters
	
	public int getContactid() {
		return contactid;
	}



	public void setContactid(int contactid) {
		this.contactid = contactid;
	}



	public String getContactname() {
		return contactname;
	}



	public void setContactname(String contactname) {
		this.contactname = contactname;
	}



	public String getContactemail() {
		return contactemail;
	}



	public void setContactemail(String contactemail) {
		this.contactemail = contactemail;
	}



	public String getContactsubject() {
		return contactsubject;
	}



	public void setContactsubject(String contactsubject) {
		this.contactsubject = contactsubject;
	}



	public String getContactmessage() {
		return contactmessage;
	}



	public void setContactmessage(String contactmessage) {
		this.contactmessage = contactmessage;
	}
	
	
}
