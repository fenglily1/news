<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>关于我</title>
<!-- Custom Theme files -->
 <base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
 <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<script> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="css/news.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="plugins/bootstrap-4.1.3-dist/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
 <script src="plugins/jquery-3.3.1.js"></script>
    <script src="plugins/popper.js"></script>
    <script src="plugins/bootstrap-4.1.3-dist/js/bootstrap.js"></script>
<script src="js/jquery-1.11.1.min.js"></script> 

<!-- //js -->	

<!--pop-up-->
<script src="js/menu_jquery.js"></script>
<!--//pop-up-->
</head>
<body>
	<!--header-->
<div class="container-fluid">
    <!--col-sm- 平板 - 屏幕宽度等于或大于 576px-->
    <div class="row">
        <div class="col-sm-4 m-auto" >
            <div class="container-fluid">
                <!--loginNav-->
                <div class="row flex-nowrap">
                    <div id="loginNav" class="col-12">
                        <ul class="nav justify-content-center">
                            <% if(session.getAttribute("userName")==null) {%>
                            <li class="nav-item"><a class="nav-link" href="account.html">
                                <nobr>注册</nobr>
                            </a></li>
                            <li class="nav-item"><a class="nav-link" href="login.html">
                                <nobr>登录</nobr>
                            </a></li>
                         <%}else{ %>   
                              <li class="nav-item"><a class="nav-link" href="destroySessionAndCookie">
                                <nobr>注销</nobr>
                            </a></li>
                            <li class="nav-item">
                                <!-- 按钮：用于打开模态框 -->
                                <a class="nav-link" href="#" >
                                    <nobr>欢迎<%=session.getAttribute("userName") %></nobr>
                                </a>
                                  </li>
                        <%} %>
                        </ul>
                    </div>
                </div>
                <!--//loginNav-->
            </div>
        </div>
        <div class="col-sm-8" >
            <div class="container-fluid"  >
                <!--menuNav-->
                <div class="row" >
                    <nav id="menuNav" class="col navbar navbar-expand-sm bg-white navbar-light">
                        <div class="navbar-brand">
                            <a href="index.jsp" id="logo"> </a>
                        </div>
                        <!-- 按钮边框 -->
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#collapsibleNavbar">
                            <!-- 方框里面三条线 -->
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!-- //按钮边框 -->
                        <div class="collapse navbar-collapse" id="collapsibleNavbar">
                            <ul class="navbar-nav nav-justified">
                                <li class="nav-item"><a class="nav-link" href="index.jsp">主页</a></li>
                                <li class="nav-item"><a class="nav-link" href="news.jsp">新闻</a></li>
                                <li class="nav-item"><a class="nav-link" href="gallery.jsp">相册</a></li>
                                <li class="nav-item"><a class="nav-link" href="about.jsp">关于我</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <!--//menuNav-->
            </div>
        </div>
    </div>
	<!--//header-->
	<!--banner-->
	<div class="row">
        <div class="col-12" id="banner"></div>
    </div>
	<!--//banner-->
	<!--about-->
	<div class="about"> 
		<div class="container">
			<h1 class="hdng">About Me</h1>
			<div class="about-text">
				<div class="col-md-6 about-text-left">
					<img src="images/013.jpg" class="img-responsive" alt=""/>
				</div>
				<div class="col-md-6 about-text-right">
					<h4>一个喜欢敲代码的大三学生</h4>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;我来自电子与信息工程学院计算机科学与技术专业,是一个乐于思考，勤于钻研的人。这是我的javaEE期末项目，学习了一个学期的成果，从前端的html5+css+js到前后端相交互，可以登录注册和发布新闻，这是在老师的一步步教导下才有了这个成品，虽然会有不足，但我会继续努力,继续前行的。我就是我，一个集美貌与才华于一身的女子。</p>
					<ul>
						<li><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="#">This is my javaEE final project。</a></li>
						<li><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="#">Front-end and back-end interaction</a></li>
						<li><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="#">You can publish news as you like.</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="about-slid"> 
			<div class="container">
				<div class="about-slid-info"> 
					<h2>学习路上请多多指教</h2>
				</div>
			</div>
		</div>
	</div>
	<!--//about-->
	<!--about-team-->
	<div class="about-team">		
	 <p style="text-align:right">有任何疑问请发送邮件到:1227952679@qq.com</p>
		</div>
	</div>
	<!--//about-team-->
	<!--footer-->
	<!--col-sm- 平板 - 屏幕宽度等于或大于 576px-->
    <div class="row" style="background-color: black">
        <div class="col-sm-6 m-auto">
            <div class="container-fluid">
                <!--copyRight-->
                <div class="row">
                    <div class="col-12" id="copyRight">
                        <p>Copyright &copy; 2018.大帅比丽.</p>
                    </div>
                </div>
                <!--//copyRight-->
            </div>
        </div>
        <div class="col-sm-6 m-auto">
            <div class="container-fluid">
                <!--share-->
                <div class="row">
                    <div class="col-12" id="social">
                             <ul class="nav justify-content-end">
                           <li class="nav-item"><a href="#" class="nav-link fb"></a></li>
                            <li class="nav-item"><a href="#" class="nav-link tw"></a></li>
                            <li class="nav-item"><a href="#" class="nav-link gg"></a></li>
                            <li class="nav-item"><a href="#" class="nav-link pn"></a></li>
                   
                            </ul>
                    </div>
                </div>
                <!--//social-->
            </div>

        </div>
    </div>
    <!--//col-sm- 平板 - 屏幕宽度等于或大于 576px-->
    
</div>
</body>
</html>