/**
 * Created by Administrator on 2018/10/16.
 */
var validateInfos = {

    firstName: {
        tip: "请输入中文",
        right: "姓氏格式正确",
        wrong: "邮箱格式有误，请重新输入",
        patt: /^[\u4e00-\u9fa5]+$/
    },
    lastName: {
        tip: "请输入中文",
        right: "名字格式正确",
        wrong: "名字格式有误，请重新输入",
        patt: /^[\u4e00-\u9fa5]+$/
    },
    email: {
        tip: "邮箱是您登录的唯一账号，请谨慎填写",
        right: "邮箱格式正确",
        wrong: "邮箱格式有误，请重新输入",
        patt: /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}/
    },
    mobile: {
        tip: "请输入11位电话号码",
        right: "电话号码输入正确",
        wrong: "电话号码输入有误，请重新输入",
        patt: /^((\(\d{2,3}\))|(\d{3}\-))?1[3,8,5]{1}\d{9}$/
    },
    pwd: {
        tip: "请输入6位以上密码",
        right: "密码格式正确",
        wrong: "请输入符合格式的密码",
        patt: /^\S{6,16}$/
    },
    pwd2: {
        tip: "请再次输入密码",
        right: "再次输入密码正确",
        wrong: "两次输入不一致或密码格式不正确，请重新输入或密码格式不正确",
        patt: /^\S{6,16}$/
    },
    loginEmail: {
        tip: "请输入邮箱号码",
        right: "邮箱格式正确",
        wrong: "邮箱格式有误，请重新输入",
        patt: /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}/
    },
    loginPwd: {
        tip: "请输入6位以上密码",
        right: "密码格式正确",
        wrong: "请输入符合格式的密码",
        patt: /^\S{6,16}$/
    }
};
//
function changeLoginBotton() {
    $("#login_link").attr("class", "border_bottom");
    $("#reg_link").removeClass();
    //document.getElementById("reg_link").className = "";
    //document.getElementById("login_form").className = "";
    $("#login_form").slideDown();
    //document.getElementById("reg_form").className = "hideForm";
    $("#reg_form").hide();
}
function changeRegBotton() {
    document.getElementById("reg_link").className = "border_bottom";
    document.getElementById("login_link").className = "";
    //document.getElementById("reg_form").className = "";
    //document.getElementById("login_form").className = "hideForm";
    $("#reg_form").slideDown();
    //document.getElementById("reg_form").className = "hideForm";
    $("#login_form").hide();
}
//校验提示小工具
function autoTip(curNode, style) {
    var curId = curNode.id;
    var curValidateInfo = validateInfos[curId];
    var tipString = curValidateInfo.tip;
    var tip = tipString;
    var tipIconNode = curNode.nextElementSibling;
    var tipNode = curNode.parentNode.nextElementSibling;
    if (tipNode == null)
        alert("null");
    $(curNode).removeClass("border border-info border-success border-danger").addClass("border border-" + style);
    if ("info" == style)
        $(tipIconNode).html("<span class='input-group-text'><i class='fa fa-hand-o-left text-info'></i> </span>");
    else if ("success" == style)
        $(tipIconNode).html("<span class='input-group-text'><i class='fa fa-check text-success'></i> </span>");
    else
        $(tipIconNode).html("<span class='input-group-text'><i class='fa fa-close text-danger'></i> </span>");
    $(tipIconNode).addClass("tipIconShow");
    tipNode.innerHTML = tip;
    $(tipNode).removeClass("alert alert-info alert-success alert-danger alertShow").addClass("alert alert-" + style + " alertShow");
}
function validate(curNodeOrCurEvent) {//是普通函数调用时参数是需要校验的input节点，是回调函数调用时注入的参数是事件event
    var curNode = curNodeOrCurEvent;
    if (curNode.type == "blur" || curNode.type == "focus")//回调函数注入的事件参数event
        curNode = curNodeOrCurEvent.target;
    var curId = curNode.id;
    var curValidateInfo = validateInfos[curId];
    var inputValue = curNode.value;
    if (inputValue == "") {
        autoTip(curNode, "info");
    } else {
        var patt = curValidateInfo.patt;
        var flag = patt.test(inputValue);
        if (flag) {
            //校验二次密码
            if ("pwd2" == curId) {
                if (inputValue == $("#pwd").val()) {
                    autoTip(curNode, "success");
                } else {
                    autoTip(curNode, "danger");
                    var tipNode = curNode.parentNode.nextElementSibling;
                    tipNode.innerHTML = "两次密码不一致";
                }
            } else {
                autoTip(curNode, "success");
            }
            //校验注册邮箱
            if ("email" == curId) {
                var url = "ajax/regValidate";
                var data = curNode.value;

                function callbackFn(result) {//回调函数
                    if ("true" == result) {
                        autoTip(curNode, "success");
                    } else {
                        autoTip(curNode, "danger");
                        var tipNode = curNode.parentNode.nextElementSibling;
                        tipNode.innerHTML = "该邮箱已被注册！";
                    }
                };
                var dataType = "text";
                //$.ajaxSettings.async = false;//设置成同步，为了提交时的校验
                $.post(url, data, callbackFn, dataType);//ajax
                //$.ajaxSettings.async = true;
            }
            //校验登录邮箱
            if ("loginEmail" == curId) {
                var url = "ajax/loginValidate";
                var data = curNode.value;

                function callbackFn(result) {//回调函数
                    if ("true" == result) {
                        autoTip(curNode, "success");
                    } else {
                        autoTip(curNode, "danger");
                        var tipNode = curNode.parentNode.nextElementSibling;
                        tipNode.innerHTML = "该邮箱未注册！";
                    }
                };
                var dataType = "text";
                //$.ajaxSettings.async = false;//设置成同步，为了提交时的校验
                $.post(url, data, callbackFn, dataType);//ajax
                //$.ajaxSettings.async = true;
            }

        } else {
            autoTip(curNode, "danger");
        }

    }
}
function validateSubmit(event) {
    var submitNode = event.target;
    var returnValue = true;
    var validateList = $(".validate").each(//遍历.validate节点并校验
        function (index, curNode) {
            validate(curNode);
        }
    ).each(
        function (index, curNode) {
            if (curNode.className.indexOf("border-success") < 0) {
                returnValue = false;
                curNode.focus();
                return returnValue;
            }
        }
    );
    if (!($("#agreeServer").is(":checked"))) {
        $("#agreeServer").focus();
        returnValue = false;
    }
    if(returnValue)
    	$("#pwd").val(hex_md5($("#pwd").val()));//MD5加密
    return returnValue;
};
function loginSubmit(event) {
    var submitNode = event.target;
    var returnValue = true;
    var validateList = $(".loginValidate").each(//遍历.validate节点并校验
        function (index, curNode) {
            validate(curNode);
        }
    ).each(
        function (index, curNode) {
            if (curNode.className.indexOf("border-success") < 0) {
                returnValue = false;
                curNode.focus();
                return returnValue;
            }
        }
    );
    if(returnValue)
    	$("#loginPwd").val(hex_md5($("#loginPwd").val()));//MD5加密
    return returnValue;
};
$(function () {
    $("#reg_link").click(changeRegBotton);
    $("#login_link").click(changeLoginBotton);

    $(".validate").on("blur focus", validate);
    $(".loginValidate").on("blur focus", validate);
    $("#regSubmit").on("click", validateSubmit);
    $("#loginSubmit").on("click", loginSubmit);
    $('[data-toggle="popover"]').popover();
});
