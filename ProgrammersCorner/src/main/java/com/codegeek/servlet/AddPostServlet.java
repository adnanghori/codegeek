package com.codegeek.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.codegeek.dao.PostDao;
import com.codegeek.entities.Post;
import com.codegeek.entities.User;
import com.codegeek.helper.ConnectionProvider;
import com.codegeek.helper.Helper;
/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
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
		  int catid = Integer.parseInt(request.getParameter("catid"));
		
		  String pTitle = request.getParameter("pTitle");
		  String pContent = request.getParameter("pContent");
		  String pCode = request.getParameter("pCode");
		  Part part = request.getPart("pPic");

		  //String pPic =request.getParameter("pPic");
		  
		  // Getting Current UserID
		  HttpSession session = request.getSession();
		  User user= (User)session.getAttribute("current");
		  Post post = new Post(pTitle, pContent, pCode,part.getSubmittedFileName(),null,catid,user.getId());
		  try {
			  
			PostDao postdao = new PostDao(ConnectionProvider.getConnection());
			if(postdao.savePost(post)) {
				String path = request.getRealPath("/") + "postimages" + File.separator + part.getSubmittedFileName();
				

				Helper.saveFile(part.getInputStream(), path);
				response.getWriter().println("Done");
				// Make changes
				
			}
			else {
				response.getWriter().println("Error");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(NullPointerException npe) {
			npe.printStackTrace();
		}
		  
		  
	}

}
