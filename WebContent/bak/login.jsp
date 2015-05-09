<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
    <%String contextPath=request.getContextPath(); %>
         <meta charset="utf-8" />
        <title>宁波大学平安校园精细化管理系统</title>
        
        <!-- The stylesheet -->
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/styles.css" />
        
<!--         [if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif] -->
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
   <div id="main1">
          <div class=" logo"><img src="assets/img/logo.png" width="549" height="68"></div>
   </div>
        <div id="main">
        	
        	
        
       	  <form class="" method="post" action="">
        	         <div class="line">
                    </div>	
       		  <div class="row email">
	    			<input type="text" id="username" name="username" placeholder="用户名" onClick="DisplayMail()" onBlur="HiddenMail()" />
       		  </div>
        		
            <div class="row pass">
        			<input type="password" id="password" name="password" placeholder="密码" onClick="DisplayPassword()" onBlur="HiddenPassword()" onKeyDown="keydown()"/>
   		    </div>
            <div class="line"> </div>
       		  <!-- The rotating arrow -->
       		  <input type="submit" value="登 录" onClick="login()"/>
        		
       	  </form>
    </div>

   <div id="main2">
          <div>版权所有：宁波大学<br>

技术支持：宁波市科技园区思坦达软件开发有限公司<br>

软件版本号：V1.0.0.1
发布日期：2014.07.0</div>
   </div>

		     
</body>
</html>

