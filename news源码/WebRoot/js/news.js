/**
 * Created by chenzhong on 2018/11/19.
 */
$(
    function () {
    	//设置ajax请求完成后运行的函数,
        $.ajaxSetup({ 
            complete:function(xhr,status){
                if("REDIRECT" == xhr.getResponseHeader("REDIRECT")){ //若HEADER中含有REDIRECT说明后端想重定向，
                    var win = window;
                    while(win != win.top){
                        win = win.top;
                    }
                    win.location.href = xhr.getResponseHeader("CONTENTPATH");//将后端重定向的地址取出来,使用win.location.href去实现重定向的要求
                }
            }
        });

//富文本编辑器UEditor
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('newsUeditor', {
            initialFrameWidth: "100%",
            zIndex: 1055,//模态框的zIndex=1050,否则插件其他弹出框会被遮挡
            enableAutoSave: false,//关闭本地保存功能
            UEDITOR_HOME_URL: "/myBlog/plugins/ueditor/"
        });

        $("#myModal button").click(
            function () {
                var newsImg = $("#newsImg").val();
                var title = $("#title").val();
                var detail = $("#detail").val();
                var content = ue.getContent();
                var url = "newsAction";
                var data = {
                    "newsImg": newsImg,
                    "title": title,
                    "detail": detail,
                    "content": content
                };
                $.post(url, JSON.stringify(data), callbackFn);
                
                
                
                
                function callbackFn(returnData, status, xhr) {
                	var totalPages=returnData.totalPages;
                    pageClick(null, totalPages);//跳到最后一页
                };
                //清空
                $("#newsForm")[0].reset();
                $("#preview").attr("src","");
                ue.setContent("",false);
                
            }
        );

        
        
        
        
        var _editor;
      //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
      _editor = UE.getEditor('upload_ue',{zIndex:1055});
      _editor.ready(function () {
      //设置编辑器不可用
          _editor.setDisabled();
      //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
          _editor.hide();
      //侦听图片上传
          _editor.addListener('beforeInsertImage', function (t, arg) {
      //将地址赋值给相应的input,只去第一张图片的路径
              $("#newsImg").attr("value", arg[0].src);
      //图片预览
              $("#preview").attr("src", arg[0].src);
          });
      //侦听文件上传，取上传文件列表中第一个上传的文件的路径
          _editor.addListener('afterUpfile', function (t, arg) {
              $("#file").attr("value", _editor.options.filePath + arg[0].url);
          });
      });
      $("#selectImg").click(upImage);
      //弹出图片上传的对话框
      function upImage() {
          var myImage = _editor.getDialog("insertimage");
          myImage.open();
      }
      //弹出文件上传的对话框
      function upFiles() {
          var myFiles = _editor.getDialog("attachment");
          myFiles.open();
      }        
        
        
        
        
        

//分页导航twbsPagination
        var $pagination = $('#pagination');
        var defaultOpts = {
            totalPages: 100,
            visiblePages: 5,
            initiateStartPageClick: true,//第一次加载页面时模拟点击第一页启动ajax获取，默认为true
            hideOnlyOnePage: false, //默认false
            first: '<nobr>首页</nobr>',
            prev: '<nobr>前一页</nobr>',
            next: '<nobr>后一页</nobr>',
            last: '<nobr>尾页</nobr>',
            onPageClick: pageClick//点击的回调函数
        };

        $pagination.twbsPagination(defaultOpts);//第一次加载页面时模拟点击第一页,调用下面的回调函数获取totalPages 与分页内容，更新页面
        function pageClick(event, currentPage) {
            //启动异步通信向后台提交currenPage
            var url = "paginationAtion";
            var data = {"currentPage": currentPage};
            var dataType = "json";
            $.post(url, JSON.stringify(data), callbackFn, dataType);//ajax
            function callbackFn(returnJsonData) {//后台返回totalPages和分页数据returnJsonData
                var totalPages = returnJsonData.newTotalPages;
                $pagination.twbsPagination('destroy');
                defaultOpts.initiateStartPageClick = false;// !!!!否则会死循环！！！
                $pagination.twbsPagination($.extend({}, defaultOpts, {//刷新导航条
                    startPage: currentPage,
                    totalPages: totalPages
                }));
                refreshContent(returnJsonData.jsonContent);// 更新分页数据
            }
        }

        function refreshContent(jsonContent) {// 更新分页数据
            //遍历所有新闻模板节点
            $(".ajaxRefresh").each(function (index, curNode) {
                var curJsonContentLength = jsonContent.length;
                if (curJsonContentLength > index) {
                    curJsonContent = jsonContent[index];
                    var imageUrl = curJsonContent.newsImg;
                    var title = curJsonContent.title;
                    var detail = curJsonContent.detail;
                    var content = curJsonContent.content;
                    $($(curNode).find("img")[0]).attr("src", imageUrl);
                    $($(curNode).find("h5")[0]).html(title);
                    $($(curNode).find(".refreshDetail")[0]).html(detail);
                    $($(curNode).find(".hiddenCotent")[0]).html(content);
                    $(curNode).addClass("showNews");
                } else
                    $(curNode).removeClass("showNews");
            });
        };
        
        //查看新闻
        $("[data-target='#newsModal']").click(
        		function(){
        			var headerHtml=this.innerHTML;
        			var contentHtml=this.nextElementSibling.nextElementSibling.innerHTML;
        			$("#newsModal .modal-title").html(headerHtml);
        			$("#newsContentModal").html(contentHtml);
        		}
        		);
        
    }
)