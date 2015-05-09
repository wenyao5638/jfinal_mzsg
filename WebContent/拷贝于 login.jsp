<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
    <%String contextPath=request.getContextPath(); %>
        <meta charset="utf-8" />
        <title>鄞州区社区专职工作者信息管理系统
</title>
        
        <!-- The stylesheet -->
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/styles.css" />
        <script src="<%=contextPath%>/assets/js/jquery-1.7.2.min.js"></script>
		<script src="<%=contextPath%>/assets/js/jquery.complexify.js"></script>
		<script src="<%=contextPath%>/assets/js/script.js"></script>
		<script src="<%=contextPath%>/assets/js/common.js"></script>
        <script src="<%=contextPath%>/assets/js/jquery.placeholder.js"></script>
        <!--[if lt IE 9]>
          <script src="<%=contextPath%>/assets/js/html5.js"></script>
        <![endif]-->

            <!--[if IE 6]>
<script src="<%=contextPath%>/assets/js/DD_belatedPNG_0.0.8a.js" mce_src="<%=contextPath%>/assets/js/DD_belatedPNG_0.0.8a.js"></script>
<script type="text/javascript">
   DD_belatedPNG.fix('background-image ,  .png_bg'); 
</script>
<![endif]-->
<!--[if lte IE 6]>
       <style type="text/css">
       body { behavior:url("<%=contextPath%>/assets/css/csshover.htc"); }
       </style>
<![endif]-->
    </head>
<script language="javascript">
$(function() {
	$('input, textarea').placeholder();
	$.ajax( {
		url :   '<%=contextPath%>/user/logout.do',
		type : 'POST',
		dataType : 'json'
	});	
});
function login(){
	var username = $("#username").val();
	var password = $("#password").val();
	if(username==null||username==""){
		alert("请输入用户名");
		return;
	}
	if(password==null||password==""){
		alert("请输入密码");
		return;
	}
	$.ajax({
		url : '<%=contextPath%>/loginCheck.do',
		data : {
				username   : username,
				password : password
		},
		type: "post",
		error : function() {
			alert("登陆出现问题，请再次尝试!");
		},
		success : function(data){
			if(data=="true"){
				window.location.href="<%=contextPath%>/login.do";
			}else{
				alert(data);
			}
		}
	});
}

function keydown(){
	if(event.keyCode==13) {
		login();
	}
}

</script>
<body>
   
    <div id="main" >
       	<form method="post" >
      
        	<div class="line"></div>	
       		<div class="login_div" style=" background-image:url(images/mail.png)" id="login_mail">
                <input type="text" id="username" name="username" placeholder="用户名" onClick="DisplayMail()" onBlur="HiddenMail()" />
            </div>
            <div class="line"></div>	
            <div class="login_div" style=" background-image:url(images/password.png)" id="login_password">
                <input type="password" id="password" name="password" placeholder="密码" onClick="DisplayPassword()" onBlur="HiddenPassword()" onKeyDown="keydown()"/>
            </div>
            <div class="line"></div>

        	
       		  <!-- The rotating arrow -->
            <a href="javascript:login()">
                <img onMouseOut="HiddenLogin()" onMouseOver="DisplayLogin()" id="login" style=" border:0px;" src="images/login.png" />
            </a>
      
       	</form>
    </div>
    <div class="footer">版权所有：浙江省公安厅高速公路交通警察总队<br>

技术支持：宁波市卓信信息技术有限公司    技术服务电话：18058580918 张工 <br>

建议IE8.0（<a href="/paic/down/IE8Setup.exe"><font color="red">下载</font></a>）及以上版本；
打印文书需要安装PDF阅读器（<a href="/paic/down/AdobeReader.exe"><font color="red">下载</font></a>）； 
分辨率不低于1024*768 软件更新日期：2014.10.31</div>

     

</body>
</html>