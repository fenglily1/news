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
    <link href="css/news.css" rel="stylesheet" type="text/css" media="all">
    <link href="plugins/bootstrap-4.1.3-dist/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css" media="all">
    <link href="">
    <script src="plugins/jquery-3.3.1.js"></script>
    <script src="plugins/popper.js"></script>
    <script src="plugins/bootstrap-4.1.3-dist/js/bootstrap.js"></script>
    <script src="js/news.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>新闻</title>
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
9.
（1）引用ueditor的js文件：ueditor.all.min.js,ueditor.config.
（2）
（2）实例化：var ue = UE.getEditor('newsUeditor',{initialFrameWidth:"100%" ，//自定义参数可以让插件自适应容器
 UEDITOR_HOME_URL:"/WebstormProjects/modelShow_acount_html_bootstrap_validate_news_home_ueditor/plugins/ueditor/" 指定插件根目录
})
-->


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
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal">
                                    <nobr>欢迎<%=session.getAttribute("userName") %>发布新闻</nobr>
                                </a>

                                <!-- 发布新闻模态框 -->
                                <div class="modal fade" id="myModal">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">

                                            <!-- 模态框头部 -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">新闻发布</h4>
                                                <button type="button" class="close"
                                                        data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- 模态框主体 -->
                                            <div class="modal-body">
                                                <form id="newsForm" action="action/newsAction.html" method="post">
                                                    <p id="newsUeditor">
                                                    </p>
                                                    <input type="hidden" id="newContent" name="newContent">
                                                    <input id="newsImg" name="newsImg" type="hidden">
                                                    <a  id="selectImg">选择图片</a><img id="preview" class="newsImg" src="">
                                                    <script type="text/javascript" id="upload_ue"></script>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <sapn class="input-group-text"><i class="fa fa-tripadvisor fa-fw"></i></sapn>
                                                        </div>
                                                        <input id="title" name="title" class="form-control" placeholder="新闻标题" type="text" tabindex="1">
                                                    </div>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <sapn class="input-group-text"><i class="fa fa-list fa-fw"></i></sapn>
                                                        </div>
                                                        <input id="detail" name="detail" class="form-control" placeholder="新闻摘要" type="text" tabindex="2">
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- 模态框底部 -->

                                            <div class="modal-footer justify-content-center">
                                                <button type="submit" class="btn btn-secondary" data-dismiss="modal"> 发布新闻</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- //发布新闻模态框 -->

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
                                <li class="nav-item"><a class="nav-link" href="about.jsp">我们</a></li>
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
    <div class="row">
        <div class="col-12" id="banner"></div>
    </div>
    <!--//banner-->
    

    
    
    
    

    <!--xs超小屏幕宽度<576px-->
    <div class="row">
        <div class="col-12">
            <!--newsHeader-->
            <div class="newsHeader text-center">
                <h1 class="hdng">新闻事件</h1>
                    
				    <!-- 浏览新闻模态框 模板-->
					<div class="modal fade" id="newsModal">
					    <div class="modal-dialog modal-lg">
					        <div class="modal-content">
					
					            <!-- 模态框头部 -->
					            <div class="modal-header">
					                <h4 class="modal-title mx-auto">新闻浏览</h4>
					            </div>
					
					            <!-- 模态框主体 -->
					            <div class="modal-body">
					            	<div class="" id="newsContentModal"></div>
					            </div>
					            <!-- 模态框底部 -->
					
					            <div class="modal-footer justify-content-center">
					                <button type="button" class="btn btn-secondary" data-dismiss="modal"> 评论</button>
					            </div>
					
					        </div>
					    </div>
					</div>
					<!-- //浏览新闻模态框模板 -->

                <h2 class="hdng-two">最时尚的热点新闻资讯</h2>
            </div>
            <!--//newsHeader-->
        </div>
    </div>
    <!--//xs超小屏幕宽度<576px-->

    <!--大屏lg>=992-->
    <div class="row">
        <div class="col-lg-6 ajaxRefresh">
            <div class="container-fluid">
                <!--sm小屏幕宽度>576px-->
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newImg-->
                                    <div class="newsImg testBorder text-center">
                                        <img src="images/img19.jpg" class="img-responsive m-auto" alt="/">
                                    </div>
                                    <!--//newImg-->
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newsCotent-->
                                    <div class="newsContent testBorder">
                                        
                                        <a class="nav-link" href="#" data-toggle="modal" data-target="#newsModal"><h5> August 20, 2015</h5></a>
										<p class="refreshDetail"></p>
										<div class="hiddenCotent" style="display:none"></div><!-- 位置很重要 -->                                    </div>
                                    <!--//newsCotent-->
                                    
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                </div>
                <!--//sm小屏幕宽度>576px-->
            </div>
        </div>
        <div class="col-lg-6 ajaxRefresh">
            <div class="container-fluid">
                <!--sm小屏幕宽度>576px-->
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newImg-->
                                    <div class="newsImg testBorder text-center">
                                        <img src="images/img19.jpg" class="img-responsive m-auto" alt="/">
                                    </div>
                                    <!--//newImg-->
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newsCotent-->
                                    <div class="newsContent testBorder">
										<a class="nav-link" href="#" data-toggle="modal" data-target="#newsModal"><h5> August 20, 2015</h5></a>
										<p class="refreshDetail"></p>
										<div class="hiddenCotent" style="display:none"></div>
                                    </div>
                                    <!--//newsCotent-->
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                </div>
                <!--//sm小屏幕宽度>576px-->
            </div>
        </div>
    </div>
    <!--大屏lg>=992-->
    <!--大屏lg>=992-->
    <div class="row">
        <div class="col-lg-6 ajaxRefresh">
            <div class="container-fluid">
                <!--sm小屏幕宽度>576px-->
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newImg-->
                                    <div class="newsImg testBorder text-center">
                                        <img src="images/img19.jpg" class="img-responsive m-auto" alt="/">
                                    </div>
                                    <!--//newImg-->
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newsCotent-->
                                    <div class="newsContent testBorder">
                                        <a class="nav-link" href="#" data-toggle="modal" data-target="#newsModal"><h5> August 20, 2015</h5></a>
										<p class="refreshDetail"></p>
										<div class="hiddenCotent" style="display:none"></div>
                                    </div>
                                    <!--//newsCotent-->
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                </div>
                <!--//sm小屏幕宽度>576px-->
            </div>
        </div>
        <div class="col-lg-6 ajaxRefresh">
            <div class="container-fluid">
                <!--sm小屏幕宽度>576px-->
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newImg-->
                                    <div class="newsImg testBorder text-center">
                                        <img src="images/img19.jpg" class="img-responsive m-auto" alt="/">
                                    </div>
                                    <!--//newImg-->
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="container-fluid">
                            <!--xs超小屏幕宽度<576px-->
                            <div class="row">
                                <div class="col-12">
                                    <!--newsCotent-->
                                    <div class="newsContent testBorder">
                                        <a class="nav-link" href="#" data-toggle="modal" data-target="#newsModal"><h5> August 20, 2015</h5></a>
                                        <p class="refreshDetail"></p>
										<div class="hiddenCotent" style="display:none"></div>
                                    </div>
                                    <!--//newsCotent-->
                                </div>
                            </div>
                            <!--//xs超小屏幕宽度<576px-->
                        </div>
                    </div>
                </div>
                <!--//sm小屏幕宽度>576px-->
            </div>
        </div>
    </div>
    <!--大屏lg>=992-->

    <div class="row">
        <div class="col-12">
            <!--pagination-->
            <script src="plugins/twbs-pagination-master/jquery.twbsPagination.js"></script>
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center" id="pagination"></ul>
            </nav>
            <!--//pagination-->
        </div>

    </div>


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