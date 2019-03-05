package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class SecurityFilter
 */
@WebFilter(filterName = "c3", urlPatterns = { "/*" })
public class Filter3_SecurityFilter implements Filter {

    /**
     * Default constructor. 
     */
    public Filter3_SecurityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//System.out.println("Filter3_SecurityFilter");//测试过滤器顺序
		List<String> uriList=new ArrayList<String>();
		uriList.add("/myBlog/newsAction");//访问需要登录权限的资源列表
		HttpServletRequest  httpRequest=(HttpServletRequest) request;
		HttpServletResponse httpServletResponse=(HttpServletResponse) response;
		String uriString=httpRequest.getRequestURI();
		if (uriList.contains(uriString)) {
			System.out.println(uriString+"需要登录");
			if (httpRequest.getSession().getAttribute("userName")==null) {
				 //获取当前请求的路径
	            String basePath = request.getScheme() + "://" + request.getServerName() + ":"  + request.getServerPort()+httpRequest.getContextPath();
	            //如果request.getHeader("X-Requested-With") 返回的是"XMLHttpRequest"说明就是ajax请求，需要前后台特殊处理news.js
	            if("XMLHttpRequest".equals(httpRequest.getHeader("X-Requested-With"))){
	                //告诉ajax我是重定向
	            	httpServletResponse.setHeader("REDIRECT", "REDIRECT");
	                //告诉ajax我重定向的路径
	            	httpServletResponse.setHeader("CONTENTPATH", basePath+"/account.html");
	            	httpServletResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
	            }else{
	            	httpServletResponse.sendRedirect(basePath + "/account.html");
	            }
				return;
			}
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
