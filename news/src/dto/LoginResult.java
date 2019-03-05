//临时数据传输包
package dto;

public class LoginResult {
	boolean isLogin;
	String loginTip;
	String userName;
	public boolean isLogin() {
		return isLogin;
	}
	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}
	public String getLoginTip() {
		return loginTip;
	}
	public void setLoginTip(String loginTip) {
		this.loginTip = loginTip;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
