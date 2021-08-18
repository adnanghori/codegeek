package com.codegeek.entities;
import java.sql.*;

public class User {
	private int id;
	private String username;
	private String email;
	private String password;
	private Timestamp dateTime;
	

				// Constructors //
	public User() {
		super();
	}
	public User(int id, String username, String email, String password, Timestamp dateTime) {
	super();
	this.id = id;
	this.username = username;
	this.email = email;
	this.password = password;
	this.dateTime = dateTime;
}
	public User(String username, String email, String password) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		
	}
			// Getters And Setters //
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	
}
