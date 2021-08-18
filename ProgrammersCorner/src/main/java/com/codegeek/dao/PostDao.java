package com.codegeek.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.codegeek.entities.Category;
import com.codegeek.entities.Post;
public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<Category> getAllCategories(){

		ArrayList<Category> list =new ArrayList<Category>();
		try{
				String query = "select * from category";
				Statement statement = this.con.createStatement();
				ResultSet set = statement.executeQuery(query);
				while(set.next()) {
					int category_id = set.getInt("category_id");
					String name = set.getString("name");
					String description = set.getString("description");
					
					Category category = new Category(category_id,name,description);
					list.add(category);
				}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		
		return list;
	}
 
	public boolean savePost(Post post) {
		boolean check=false;
		try {
			String query = "insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement preparedstatement = con.prepareStatement(query);
			preparedstatement.setString(1, post.getpTitle());
			preparedstatement.setString(2, post.getpContent());
			preparedstatement.setString(3, post.getpCode());
			preparedstatement.setString(4, post.getpPic());
			preparedstatement.setInt(5, post.getCatId());
			preparedstatement.setInt(6, post.getUserId());
			
			// Executing Query
			preparedstatement.executeUpdate();
			check=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		// Returning Boolean 
		return check;
	}
	
	 // Get All Post 	//
	public List<Post> getAllPosts(){
		List<Post> list = new ArrayList<Post>();
		// 	Fetch All Post
		try {
			PreparedStatement preparedstatement = con.prepareStatement("select * from post order by pid desc");
			ResultSet set = preparedstatement.executeQuery();
			while(set.next()) {
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				list.add(post);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Post> getPostByCatId(int catId){
		List<Post> list = new ArrayList<Post>();
		// Fetch All Post By Category Id	
		try {
			PreparedStatement preparedstatement = con.prepareStatement("select * from post where catId=?");
			preparedstatement.setInt(1, catId);
			ResultSet set = preparedstatement.executeQuery();
			while(set.next()) {
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				list.add(post);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Post getPostByPostId(int postId) {
		Post post = null;
		String query = "select * from post where pid=?";
		try {
		PreparedStatement preparedstatement = this.con.prepareStatement(query);
		preparedstatement.setInt(1, postId);
		ResultSet set = preparedstatement.executeQuery();
		if(set.next()) {
			
			int pid = set.getInt("pid");
			String pTitle = set.getString("pTitle");
			String pContent = set.getString("pContent");
			String pCode = set.getString("pCode");
			String pPic = set.getString("pPic");
			Timestamp pDate = set.getTimestamp("pDate");
			int catId = set.getInt("catId");
			int userId = set.getInt("userId");
			post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
		}
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return post;
	}
}
