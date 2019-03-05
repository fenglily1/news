<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>相册</title>
<!-- Custom Theme files -->
 <base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/news.css" rel="stylesheet" type="text/css" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //Custom Theme files -->
<link href="plugins/bootstrap-4.1.3-dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.css"
	rel="stylesheet" type="text/css" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="plugins/jquery-3.3.1.js"></script>
<script src="plugins/popper.js"></script>
<script src="plugins/bootstrap-4.1.3-dist/js/bootstrap.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!--//end-smoth-scrolling-->
<!--pop-up-->
<script src="js/menu_jquery.js"></script>
<!--//pop-up-->
<!--gallery-->
<script src="js/jquery.chocolat.js"></script>
<link rel="stylesheet" href="css/chocolat.css" type="text/css"
	media="screen">
<!--light-box-files -->
<script type="text/javascript">
	$(function() {
		$('.gallery a').Chocolat();
	});
</script>
<!--/gallery-->

</head>
<body>
	<div class="container-fluid">
		<!--col-sm- 平板 - 屏幕宽度等于或大于 576px-->
		<div class="row">
			<div class="col-sm-4 m-auto">
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
			<div class="col-sm-8">
				<div class="container-fluid">
					<!--menuNav-->
					<div class="row">
						<nav id="menuNav"
							class="col navbar navbar-expand-sm bg-white navbar-light">
							<div class="navbar-brand">
								<a href="index.jsp" id="logo"> </a>
							</div>
							<!-- 按钮边框 -->
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#collapsibleNavbar">
								<!-- 方框里面三条线 -->
								<span class="navbar-toggler-icon"></span>
							</button>
							<!-- //按钮边框 -->
							<div class="collapse navbar-collapse" id="collapsibleNavbar">
								<ul class="navbar-nav nav-justified">
									<li class="nav-item"><a class="nav-link" href="indexjsp">主页</a></li>
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
		<!--banner-->
		<div class="banner1 about-bnr"></div>
		<!--//banner-->
		<!-- gallery -->
		<div class="gallery">
			<h1 class="hdng">My Gallery(我的相册)</h1>
			<h2 class="hdng-two">以下为美图欣赏,点击可查看大图,左右箭头切换上下张</h2>
			<div class="gallery-grids">
				<ul>
					<li><a href="images/001.jpg"> <img src="images/001.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/002.jpg"> <img src="images/002.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/003.jpg"> <img src="images/003.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/004.jpg"> <img src="images/004.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/005.jpg"> <img src="images/005.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/006.jpg"> <img src="images/006.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/007.jpg"> <img src="images/007.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/008.jpg"> <img src="images/008.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/009.jpg"> <img src="images/009.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/010.jpg"> <img src="images/010.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/011.jpg"> <img src="images/011.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
					<li><a href="images/012.jpg"> <img src="images/012.jpg"
							alt="" />
							<div class="glry-bgd"></div>
					</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
		</div>
		<!--//gallery -->

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