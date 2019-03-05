package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
@WebServlet(urlPatterns="/paginationAtion")
public class PaginationAction extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public PaginationAction() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//通过内置对象request获取浏览器返回的json数据
		InputStream iStream= request.getInputStream();//读取字节
		InputStreamReader iStreamReader= new InputStreamReader(iStream,"UTF-8");//读取字符
		BufferedReader bReader = new BufferedReader(iStreamReader);//读取行
		StringBuilder sBuilder= new StringBuilder();//构造可变长字符串容器
		String line=null;
		while ((line=bReader.readLine())!=null) {
			sBuilder.append(line);
		}
		JSONObject inputJosn= new JSONObject(sBuilder.toString());
//		System.out.println("inputJosn="+inputJosn);
		//调用业务逻辑层
		JSONObject returnJsonData=new busiNess.PagiNationBusiNess().getPageSizeNews(inputJosn);
		
		// 设置响应内容类型
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(returnJsonData);
		out.flush();
		out.close();
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
