package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

import modle.News;
import util.StaticParameters;

public class NewsDao {
	//数据库的用户名和密码
	public String user="root";
	public String psw="1234";

	public int createOrUpdate(News news) {
		int lines=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", user,psw);
			String sql="insert into news(newsImg,title,detail,content,userId,createTime) values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, news.getNewsImg());
			ps.setString(2, news.getTitle());
			ps.setString(3, news.getDetail());
			ps.setString(4, news.getContent());
			ps.setInt(5, 1);
			ps.setDate(6, new java.sql.Date(news.getCreateTime().getTime()));
			System.out.println(ps.toString());
			lines=ps.executeUpdate();
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出错！");
		} catch (SQLException e) {
			System.out.println("插入新闻出错！");
			e.printStackTrace();
		}
		return lines;
		
	}


	public Integer getTotalNews() {
		int totalNews=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", user, psw);
			String sql="select count(*) totalNews from news";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			totalNews=rs.getInt(1);
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出错！");
		} catch (SQLException e) {
			System.out.println("插入新闻出错！");
			e.printStackTrace();
		}
		return totalNews;
	}

//倒序
	public JSONArray getPageSizeJsonArray(int currentPage) {
		ResultSet pageSizeResultSet=null;
		JSONArray  jsonContent=new JSONArray();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", user,psw);
			int startIndex=(currentPage-1)*StaticParameters.PAGESIZE;
			int pageSize= StaticParameters.PAGESIZE;
			String sql="select * from news  order by id desc limit ?,?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, startIndex);
			ps.setInt(2, pageSize);
			System.out.println(ps.toString());
			pageSizeResultSet=ps.executeQuery();
			
			
			while (pageSizeResultSet.next()) {
				String newsImg=pageSizeResultSet.getString("newsImg");
				String title=pageSizeResultSet.getString("title");
				String detail=pageSizeResultSet.getString("detail");
				String content=pageSizeResultSet.getString("content");
				JSONObject curNewsJson=new JSONObject();
				curNewsJson.put("newsImg", newsImg);
				curNewsJson.put("title", title);
				curNewsJson.put("detail", detail);
				curNewsJson.put("content", content);
				jsonContent.put(curNewsJson);
				}
			
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出错！");
		} catch (SQLException e) {
			System.out.println("插入新闻出错！");
			e.printStackTrace();
		}
		return jsonContent;
		
	}

}
