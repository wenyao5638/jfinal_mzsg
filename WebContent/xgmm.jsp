<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<title>密码修改</title>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
    
<script>
function serverLogin(){
	 var  oldPass=$("#oldPass").val();
     var  newPass=$("#newPass").val();
	 var rePass=$("#rePass").val();
	 if(newPass==""){
		 $.messager.alert('系统提示', '请输入新密码', 'warning'); 
	 }else if (newPass.length>14||newPass.length<6) {
		 $.messager.alert('系统提示', '新密码有误,长度为6~14位的密码', 'warning'); 
	 }else if(newPass!=rePass){
		 $.messager.alert('系统提示', '新密码跟确认密码不一致,请核对', 'warning');
	 }else{
		var re = /[a-zA-Z]/;
		var rs = /[0-9]/;
		if (re.test(newPass)&&rs.test(newPass)) {
		    $.ajax( {
				url :   '<%=contextPath%>/user/updateXgmm.do',
				data : {
					"oldPass" : oldPass,
					"newPass" : newPass
				},
				type : 'POST',
				dataType : 'json',
				error : function() {
					$.messager.alert('提示', '密码修改出现错误');
				},
				success : function(data) {
					  if(data==false){
					  	  $.messager.alert('提示', '旧密码输入错误,请重新输入!');
					  }else{
					      $.messager.confirm('提交','密码修改成功！',function(s){
							if(s){
						  		window.close();
						  	}
						  })
					  }
				}
			});
		}else{
			alert("密码必须为字母和数字组合!");
			return;
		}
	 }
}
</script>
</head>
<body class="easyui-layout" >
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>旧密码：</td>
                        <td><input id="oldPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="newPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="rePass" type="password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="center" border="false" style="text-align: center; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:serverLogin()" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:window.close()">取消</a>
            </div>
        </div>
</body>
</html>