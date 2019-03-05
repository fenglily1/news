
//自动登录过滤器
package filter;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import busiNess.RegBusiness;
import dto.LoginResult;

/**
 * Servlet Filter implementation class AutoLogin
 */
@WebFilter(filterName = "b2", urlPatterns = { "/*" }) // 過濾器順序：CharacterEncodingFilter-->AutoLoginFilter-->SecurityFilter
public class Filter2_AutoLoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public Filter2_AutoLoginFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("Filter2_AutoLoginFilter");// 测试过滤器顺序
		// 检测cookie自动登录
		String email = null;
		String pwd = null;
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		if (httpServletRequest.getSession().getAttribute("userName") == null) {// 如果还未登录尝试使用本地cookie登录
			System.out.println("尝试使用本地cookie登录");
			Cookie[] cookies = httpServletRequest.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					System.out.println("name="+cookie.getName()+"   value="+cookie.getValue()+"  maxage="+cookie.getMaxAge());
					if ("email".equals(cookie.getName()))
						email = cookie.getValue();
					if ("pwd".equals(cookie.getName()))
						pwd = cookie.getValue();
				}
			}
			RegBusiness regBusiness;
			if (email != null && pwd != null) {
				System.out.println("使用本地cookie登录");
				regBusiness = new RegBusiness();
				LoginResult regResult = regBusiness.checkLogin(email, pwd);
				if (regResult.isLogin()) {// 设置session,表明已登录
					httpServletRequest.getSession().setAttribute("userName", regResult.getUserName());
				}
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
