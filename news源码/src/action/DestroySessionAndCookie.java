package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DestroySessionAndCookie
 */
@WebServlet(name = "destroySessionAndCookie", urlPatterns = { "/destroySessionAndCookie" })
public class DestroySessionAndCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DestroySessionAndCookie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Cookie[] cookies = request.getCookies();
		 if (cookies!=null) {
			 for (Cookie cookie : cookies) {
				 /**
                  * 删除Cookie时，只设置maxAge=0将不能够从浏览器中删除cookie,
                  * 因为一个Cookie应当属于一个path与domain，所以删除时，Cookie的这两个属性也必须设置。
                  *
                  * 误区:刚开始时，我没有发现客户端发送到服务器端的cookie的path与domain值为空这个问题。
                  * 因为在登陆系统时，我设置了Cookie的path与domain属性的值,就误认为每次客户端请求时，都会把Cookie的
                  * 这两个属性也提交到服务器端，但系统并没有把path与domain提交到服务器端(提交过来的只有Cookie的key，value值)。
                  */ 
				 // 通知浏览器立即销毁cookie
				 cookie.setMaxAge(0); 
                 // 重点是这里1,必须设置domain属性的值 
                 cookie.setDomain(request.getServerName()); 
                 // 重点是这里2,必须设置path属性的值 
                 cookie.setPath(request.getContextPath());  
                 
				 System.out.println(request.getContextPath());
				 
				 response.addCookie(cookie); 
			 }
		}
		 request.getSession().removeAttribute("userName");//立即销毁session
		 request.getRequestDispatcher("/index.jsp").forward(request, response);
	};

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
