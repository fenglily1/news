package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import busiNess.RegBusiness;

/**
 * Servlet implementation class LoginValidate
 */
@WebServlet(name = "ajax/regValidate", urlPatterns = { "/ajax/regValidate" })
public class RegValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8")).readLine();
		System.out.println("email="+email);
		PrintWriter out = response.getWriter();
		RegBusiness regBusiness = new RegBusiness();
		Boolean isReg=regBusiness.regCheckEmail(email);
		out.print(isReg);
		out.close();
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
