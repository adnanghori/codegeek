package com.codegeek.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codegeek.dao.ContactDao;
import com.codegeek.entities.Contact;
import com.codegeek.helper.ConnectionProvider;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String contactname = request.getParameter("name");
		String contactemail = request.getParameter("email");
		String contactsubject = request.getParameter("subject");
		String contactmessage = request.getParameter("message");
		
		Contact contact = new Contact(contactname,contactemail,contactsubject,contactmessage);
		try {
			ContactDao contactdao = new ContactDao(ConnectionProvider.getConnection());
			if(contactdao.saveContactInfo(contact)) {
				response.getWriter().println("Done");
			}
			else {
				response.getWriter().println("Error");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
