package com.codegeek.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.codegeek.entities.Contact;
// Connection

public class ContactDao {
	private Connection con;

	public ContactDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean saveContactInfo(Contact contact) {
		boolean check =false;
		try {
			String query = "insert into contact(contactname,contactemail,contactsubject,contactmessage) values(?,?,?,?) ";
			PreparedStatement preparedstatement = this.con.prepareStatement(query);
			preparedstatement.setString(1, contact.getContactname());
			preparedstatement.setString(2, contact.getContactemail());
			preparedstatement.setString(3, contact.getContactsubject());
			preparedstatement.setString(4, contact.getContactmessage());
			preparedstatement.execute();
			check=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
}
