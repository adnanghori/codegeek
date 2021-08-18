package com.codegeek.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.codegeek.dao.UserDao;
import com.codegeek.entities.*;
import com.codegeek.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String check=request.getParameter("agree-term");
		if(check==null) {
			response.getWriter().println("Box Not Checked");
		}
		// If The Check Box Is Checked The Value Will Become "ON" In Case:
		else {
			// Fetch All Data
			String username = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String repassword = request.getParameter("user_repassword");
					// Checking Password //
			if(password.equals(repassword)) {
				// Creating User Object And Set All Data To That Object
				User user = new User(username,email,password);
				try {
					UserDao dao = new UserDao(ConnectionProvider.getConnection());
					if(dao.saveUser(user)) {
						// save
						response.getWriter().println("Done");
					}
					else {
						response.getWriter().println("Error");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else {
				response.getWriter().println("Please Check Password");
			}
			
			
		}
	}

}
