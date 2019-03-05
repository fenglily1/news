package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import busiNess.RegBusiness;

/**
 * Servlet implementation class RegAction
 */
@WebServlet(name = "regAction", urlPatterns = { "/regAction" })
public class RegAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegAction() {
        super();
        // TODO Auto-generated constructor stub
    }	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String sex=request.getParameter("sex");
		String pwd=request.getParameter("pwd");
		modle.User user = new modle.User();
		user.setEmail(email);
		user.setLastName(lastName);
		user.setFirstName(firstName);
		user.setMobile(mobile);
		user.setPwd(pwd);
		user.setSex(sex);
		RegBusiness regBusiness= new busiNess.RegBusiness();
		String regResult=regBusiness.reg(user);
		if ("true".equals(regResult)) {
			request.getSession().setAttribute("userName", firstName+lastName);
			request.getRequestDispatcher("login.html").forward(request, response);
		} else {
			request.setAttribute("regFailString", regResult);
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}

}
