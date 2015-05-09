<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="user" class="model.User" scope="session"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<%String contextPath=request.getContextPath(); 
%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<title>再生育审批管理平台</title>

<!-- The stylesheet -->
<link rel="stylesheet" href="<%=contextPath%>/assets/css/styles.css" />
<script type="text/javascript" src="<%=contextPath%>/assets/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.complexify.js"></script>
<script type="text/javascript" src="<%=contextPath%>/assets/js/script.js"></script>
<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script language="javascript">
$(function() {
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
function reset(){
	$("#username").val("");
	$("#password").val("");
}
</script>
</head>

<body>
<div id="main">
	<h1><img src="<%=contextPath%>/assets/img/name.png" width="309" height="37"></h1>
        	
<form method="post" target="_top">
	<div class="row email">
		<input type="text" id="username" name="user" placeholder="用户名" />
	</div>
	<div class="row pass">
		<input type="password" id="password" name="user" placeholder="密码" />
	</div>
	<div class="row">
		报表控件：<a href="<%=contextPath%>/down/AdbeRdr940_zh_CN.exe">请点击下载</a><br>
		高拍仪驱动：<a href="<%=contextPath%>/down/ScanCtrl.exe">请点击下载</a><br>
	</div>

	<div class="denglu">
		<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<input type="submit" onClick="login()" value="登  录" />
					<input type="submit" onClick="reset()" value="重 置" />
				</td>
	    	</tr>
		</table>
	</div>
</form>
</div>
		     
</body>
</html>