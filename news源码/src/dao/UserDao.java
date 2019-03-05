package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import modle.User;

public class UserDao {

	//数据库的用户名和密码
		public String usr="root";
		public String psw="1234";
		
	 public Boolean saveUser(User user) {
		boolean isReg =false;
		int lines=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", usr , psw);
			String sql="insert into user(firstName,lastName,email,mobile,sex,pwd,createTime) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getFirstName());
			System.out.println("firstName="+user.getFirstName());
			ps.setString(2, user.getLastName());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getSex());
			ps.setString(6, user.getPwd());
			//获取到当前时间
			ps.setTimestamp(7, new Timestamp(new Date().getTime()));
			System.out.println(ps.toString());
			lines=ps.executeUpdate();
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出错！");
		} catch (SQLException e) {
			System.out.println("注册出错！");
			e.printStackTrace();
		}
		if(lines>0)
			isReg=true;
		return isReg;
	}
	//判断email是否存在
	public Boolean queryByEmail(String email) {
		boolean isReg =false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", usr, psw);
			String sql="select email from user where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			System.out.println(ps.toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				isReg=true;
			}
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出错！");
		} catch (SQLException e) {
			System.out.println("注册出错！");
			e.printStackTrace();
		}
		return isReg;
	}
	public String findUserNameByEmail(String email) {
		String userName=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", usr, psw);
			String sql="select firstName , lastName from user where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			System.out.println(ps.toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				userName=rs.getString("firstName")+rs.getString("lastName");
			}
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出错！");
		} catch (SQLException e) {
			System.out.println("注册出错！");
			e.printStackTrace();
		}
		return userName;
	}
	public Boolean findByPwd(String email,String pwd) {
		Boolean isLogin=false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", usr, psw);
			String sql="select pwd from user where email=? and pwd=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pwd);
			System.out.println(ps.toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				isLogin=true;
			}
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出错！");
		} catch (SQLException e) {
			System.out.println("注册出错！");
			e.printStackTrace();
		}
		return isLogin;
	}

}
