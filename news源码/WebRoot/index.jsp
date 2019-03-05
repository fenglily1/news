<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1 shrink-to-fit=no">
    <script> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="css/news.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="plugins/bootstrap-4.1.3-dist/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <script src="plugins/jquery-3.3.1.js"></script>
    <script src="plugins/popper.js"></script>
    <script src="plugins/bootstrap-4.1.3-dist/js/bootstrap.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script> 
    
    
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>


<!--//end-smoth-scrolling-->
<!--pop-up-->
<script src="js/menu_jquery.js"></script>
    <title>主页</title>
</head>
<body>
<!--/**实现步骤：
1.超小屏幕xs< 576px
输入以下代码：
<!--&lt;!&ndash;xs超小屏幕宽度<576px&ndash;&gt;-->
<!--<div class="row">-->
<!--<div class="col-12">-->
<!--&lt;!&ndash;&ndash;&gt;-->
<!--<div id="">-->

<!--</div>-->
<!--&lt;!&ndash;//&ndash;&gt;-->
<!--</div>-->
<!--</div>-->
<!--&lt;!&ndash;//xs超小屏幕宽度<576px&ndash;&gt;-->
<!--
1.从最小设备视角出发，找出可堆叠的原子div并命名class，用class="row"包裹各个不可换行div，并为其添加class="col-12"
2.设置边框确定各个div的marging padding，为了看到响应效果，写四个部分div
3.输入html元素
4.@media screen and (max-width: 576px){在这里定制各个样式justify-content: center !important;}


8.小屏幕sm：@media screen and (min-width: 576px )

<!--<div class="row">-->
<!--<div class="col-12">-->
<!--<div id="">-->

<!--</div>-->
<!--</div>-->
<!--</div>-->
<!--
（1）m-auto添加在col上可以上下左右居中单元格内容
（2）增加定制的样式:loginNav下边框 底部copyright social 调整margin垂直对齐居中
-->


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
    <!--//col-sm- 平板 - 屏幕宽度等于或大于 576px-->
    <!--banner-->
   
    <!--//banner-->
    	<!--banner-->
	<div class="banner">
		<!-- banner-text Slider starts Here -->
		<script src="js/responsiveslides.min.js"></script>
		<script>
			// You can also use "$(window).load(function() {"
				$(function () {
				// Slideshow 3
					$("#slider3").responsiveSlides({
					auto: true,
					pager:true,
					nav:true,
					speed: 500,
					namespace: "callbacks",
					before: function () {
					$('.events').append("<li>before event fired.</li>");
					},
					after: function () {
						$('.events').append("<li>after event fired.</li>");
					}
				});	
			});
		</script>
		<!--//End-slider-script -->
		<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
					<div class="banner1">
					</div>
				</li>
				<li>
					<div class="banner1 banner2">
					</div>
				</li>
				<li>
					<div class="banner1 banner3">
					</div>
				</li>
			</ul>
			<div class="clearfix"> </div>
		</div>
	</div>
				
	<!--//banner-->
	<!--welcome-->
	<div class="welcome">
		<div class="container">
			<h1 class="hdng">Welcome</h1>
			<p>这里是可以自由发布新闻的网站,只要登陆后就可以发布新闻哦 </p>
			<p>（任何发布不良信息者，一旦发现，立即删除）</p>
	        <p>在这里，您可以与广大网友分享你的趣事新闻，您可以查看热点新闻对其进行点评或互动，结交好友；</p>
	        <p>在这里，您还可以对您的公司或产品进行宣传，让您企业的产品、活动、新闻信息分秒之间高效传播出去，24小时立竿见影.</p>
	       
			<p>Here is a website that can release news freely, so long as you log in, you can release news.Here, you can share your interesting news with the vast number of netizens.Here, you can interact with other news reviews and make friends.Here, you can also publicize your company or products, so that your company's products, activities, news and information can be effectively disseminated between minutes, 24 hours immediately. </p>			
		    <br>
		    <h1 class="hdng">更多功能等你来发掘~</h1>
		</div>
	</div>
	<!--//welcome-->
	

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