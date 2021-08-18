package com.codegeek.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.codegeek.dao.UserDao;
import com.codegeek.entities.Message;
import com.codegeek.entities.User;
import com.codegeek.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// Fetch Username And Password From Request
		String email = request.getParameter("your_email");
		String password = request.getParameter("your_pass");
		
		try {
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User user=dao.getUserByEmailAndPassword(email, password);
			
			if(user==null) {
				// Login Error
				//response.getWriter().println("Incorrect Details");
				Message message = new Message("Incorrect Details","error","alert-error");
				HttpSession session = request.getSession();
				session.setAttribute("message", message);
				
				response.sendRedirect("sign-in.jsp");		
			}
			else {
				// Login Success
				HttpSession session = request.getSession();
				session.setAttribute("current", user);
				response.sendRedirect("profile.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
