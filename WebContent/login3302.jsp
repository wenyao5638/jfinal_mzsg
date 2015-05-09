<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<%String contextPath=request.getContextPath(); %>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>再生育审批管理平台</title>

<!-- The stylesheet -->
<link href="assets/css/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=contextPath%>/assets/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.complexify.js"></script>
<script type="text/javascript" src="<%=contextPath%>/assets/js/script.js"></script>
<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<%String username = (String)request.getAttribute("username");%>
<%String info = (String)request.getAttribute("info");%>

<script language="javascript">
$(function(){
	$("#username").val("<%=username%>");
	var info = "<%=info%>";
	if(info!="null"&&info!=""){
		alert(info);
		return;
	}
})

function login(){
	var username = $("#username").val();
	var password = $("#password").val();
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
	 <table class="container" style="float:left;"  >
    <tr align="left">
      <td valign="middle" align="right" class="use">用户名:</td>
      <td width="230px"><input type="text" class="inputgri" name="username" id="username"></td>
    </tr>
    <tr align="left">
      <td valign="middle" align="right" class="use">密&nbsp;&nbsp;&nbsp;码:</td>
      <td width="230px"><input type="password" class="inputgri" name="password" id="password"></td>
    </tr>
  </table>



<div class="row">
		报表控件：<a href="<%=contextPath%>/down/AdbeRdr940_zh_CN.exe">请点击下载</a><br>
		高拍仪驱动：<a href="<%=contextPath%>/down/ScanCtrl.exe">请点击下载</a><br>
	</div>

	<div class="denglu" >
		<table width="60%" align="center" cellpadding="0" cellspacing="0" >
			<tr>
				<td>
					<input type="submit" onClick="login()" value="登&nbsp;录" />
					<input type="submit" onClick="reset()" value="重&nbsp;置" />
				</td>
	    	</tr>
		</table>
	</div>
</form>
</div>
		     
</body>
</html>