package busiNess;

import dao.UserDao;
import dto.LoginResult;
import modle.User;

public class RegBusiness {

	UserDao userDao =new dao.UserDao();
	public String reg(User user) {
		String regResult="";
		// 后台校验
		if ("true".equals(check(user))) {
			if(userDao.saveUser(user))
				regResult="true";
			else {
				regResult="数据库存储出错！";
			}
		} else {
			regResult="没通过后台校验！";
		}
		return regResult;
	}

	public Boolean regCheckEmail(String email) {
		 
		return !userDao.queryByEmail(email);
	}

	// 后台校验
	private String check(User user) {
		return "true";
	}

	public LoginResult checkLogin(String email, String pwd) {
		LoginResult loginResult=new LoginResult();
		UserDao userDao=new UserDao();
		String userName=userDao.findUserNameByEmail(email);
		Boolean isPwd=userDao.findByPwd(email,pwd);
		String loginTip="";
		Boolean isLogin=false;
		if(userName!=null)
			if (isPwd) {
				isLogin=true;
				loginTip="登录成功！";
			}else {
				loginTip="密码错误！";
			}
		else {
			loginTip="账号不存在！";
		}
		loginResult.setLogin(isLogin);
		loginResult.setLoginTip(loginTip);
		loginResult.setUserName(userName);
				
		return loginResult;
	}

	public Boolean loginCheckEmail(String email) {
		return userDao.queryByEmail(email);
	}

}
