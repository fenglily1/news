package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.commons.codec.digest.DigestUtils;

import busiNess.RegBusiness;
import dto.LoginResult;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet(name = "loginAction", urlPatterns = { "/loginAction" })
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String autoLogin = request.getParameter("autoLogin");
		//验证
		RegBusiness regbusiness = new RegBusiness();
		LoginResult loginResult=regbusiness.checkLogin(email,pwd);
		if (loginResult.isLogin()) {
			//写session（后台cookie）
			request.getSession().setAttribute("userName", loginResult.getUserName());
			//浏览器写cookie
			if ("autoLogin".equals(autoLogin)) {
				//获取当前请求的路径
	            //String basePath = request.getScheme() + "://" + request.getServerName() + ":"  + request.getServerPort()+request.getContextPath();
	            String host = request.getServerName(); 
	            // 保存账号到Cookie  	
	            Cookie cookie = new Cookie("email", email); 
	            cookie.setPath(request.getContextPath());  
	            cookie.setDomain(host);  
	            cookie.setMaxAge(3600*24*7);//cookie有效期一周  
	            response.addCookie(cookie);  
	            // 保存密码到Cookie，注意需要加密一下  
	            Cookie cookie1 = new Cookie("pwd", pwd);   
	            cookie1.setPath(request.getContextPath());  
	            cookie1.setDomain(host);  
	            cookie1.setMaxAge(99999999);  
	            response.addCookie(cookie1);  
			}
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}else{
		
			request.setAttribute("loginResult", loginResult);
			request.getRequestDispatcher("/login.html").forward(request, response);
			response.setContentType("text/html; charset=UTF-8"); //转码
		    PrintWriter out = response.getWriter();
		    out.flush();
		    out.println("<script>");
		    out.println("alert('请先注册新帐号或登陆');");
		    out.println("history.back();");
		    out.println("</script>");
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
