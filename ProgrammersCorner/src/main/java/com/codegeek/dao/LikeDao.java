package com.codegeek.dao;
import com.codegeek.helper.*;
import java.sql.*;


public class LikeDao {
	private Connection con;
	
		public LikeDao(Connection con) {
		super();
		this.con = con;
	}

		public boolean insertLike(int pid, int uid)
		{
			boolean check=false;
			try {
				String query = "insert into liked(pid,uid) value(?,?)";
				PreparedStatement preparedstatement = this.con.prepareStatement(query);
				preparedstatement.setInt(1, pid);
				preparedstatement.setInt(2, uid);
				preparedstatement.executeUpdate();
				check=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return check;
		}
	public int countLikeOnPost(int pid) throws SQLException {
		int count=0;
		try{String query ="select count (*) from liked where pid=?";
		PreparedStatement preparedstatement = this.con.prepareStatement(query);
		preparedstatement.setInt(1, pid);
		ResultSet set = preparedstatement.executeQuery();
		if(set.next()) {
			count = set.getInt("count(*)");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public boolean isLikedByUser(int pid,int uid) {
		boolean check=false;
		try {
			PreparedStatement preparedstatement = this.con.prepareStatement("select * from liked where pid=? and uid=?");
			preparedstatement.setInt(1, pid);
			preparedstatement.setInt(2, uid);
			ResultSet set = preparedstatement.executeQuery();
			if(set.next()) {
				check=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	public boolean deleteLike(int pid,int uid) {
		boolean check =false;
		try {
			PreparedStatement preparedstatement = this.con.prepareStatement("delete from liked where pid=?, uid=? ");
			preparedstatement.setInt(1, pid);
			preparedstatement.setInt(2, uid);
			preparedstatement.executeUpdate();
			check =true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
}
