package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	// fetching categories from database
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		try {
			String q = "select * from categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(q);
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Category c = new Category(cid,name,description);
				list.add(c);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
		
	}
	public  boolean savePost(Post p) {
		boolean f = false;
		try {
			if(con == null) {
				con = ConnectionProvider.getConnection();
			}
			String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			int i = pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}
			pstmt.close(); // close PreparedStatement
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
	//get All the post
	public List<Post> getAllPosts(){
		List<Post> list = new ArrayList<>();
		//fetch all the post
		try {
			String q ="select * from posts order by pid desc";
			PreparedStatement pstmt = con.prepareStatement(q);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				int pid = set.getInt("pid");  // colum name
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				Post post = new Post(pid,pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	//get all post by category id
	public List<Post> getPostByCatId(int catId){
		List<Post> list = new ArrayList<>();
		// fetch all the data by id
		try {
			String q ="select * from posts where catId = ?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, catId);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				int pid = set.getInt("pid");  // column name
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				Post post = new Post(pid,pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
	}
	public Post getPostByPostId(int postId){
		Post post = null;
		// fetch all the data by id
		try {
			String q ="select * from posts where pid = ?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, postId);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				int pid = set.getInt("pid");  // column name
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				int cid = set.getInt("catId");
				post  = new Post(pid,pTitle, pContent, pCode, pPic, date, cid, userId);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return post;
		
	}
	

}
