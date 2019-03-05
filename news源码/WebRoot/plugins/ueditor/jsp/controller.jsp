<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="util.UnicodeUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.baidu.ueditor.ActionEnter"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );
	
	String action=request.getParameter("action");
	String result= new ActionEnter(request,rootPath).exec();
	if("listfile".equals(action)||"listimage".equals(action)){
		//System.out.println("result_soure="+result);
		result=util.UnicodeUtil.unicodetoString(result);//英文字符与unicode编码混合的字符串转成普通字符串
		//System.out.println("result_decode="+result);
		//System.out.println("rootPath_source="+rootPath);
		rootPath=rootPath.replaceAll("\\\\", "/");//在regex中"\\"表示一个"\"，在java中一个"\"也要用"\\"表示。这样，前一个"\\"代表regex中的"\"，后一个"\\"代表java中的"\"。所以要想使用replaceAll方法将字符串中的反斜杠("\")替换成空字符串("")，则需要这样写：str.replaceAll("\\\\","");
		//System.out.println("rootPath_replace="+rootPath);
		result=result.replaceAll(rootPath, "/");//把返回路径中的物理路径替换为 '/',这个斜杆代表该网站的根路http://localhost:8080/UEditor径而不是服务器的根路径http://localhost:8080
		//System.out.println("result_last="+result);
	}
	out.write(result);
	
	//out.write( new ActionEnter( request, rootPath ).exec() );
%>