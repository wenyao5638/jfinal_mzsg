<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();%>  
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
	<head>
		<title>工作任务提醒设置</title>
	
	</head>
<script>

 	
$(document).ready(function(){
  
	$("#gzrwtx").validate({
		rules: {
			'vo.name':{
				required : true
			 
			},'vo.nf':{
				required : true
			 
			}
				
		}
	});							 	
});  
 function savexGzrwtx(form, winId, parentWinId) {
	/**
	 * 防止重复提交校验
	 */
	  var flag = $("#token").val();
	if (flag == false || flag == "false") {
		$.messager.alert("\u63d0\u793a\u4fe1\u606f", "\u8bf7\u52ff\u91cd\u590d\u63d0\u4ea4\uff01", "error");
		return;
	}
	if (winId && winId != "") {
	} else {
		winId = "jDialogContainer";
	}
	if (parentWinId && parentWinId != "") {
	} else {
		parentWinId = "dg";
	}
	//alert($("#code3").val());
	
	
	if($("#name").val()==""){
	 $.messager.alert('系统提示', '请输入名称！','warning');
	 return false;
	  
	}else if($("#nf").val()==""){
		$.messager.alert('系统提示', '请输入天数！','warning');
		return false;
	}
 $("#gzrwtx").form("submit", {onSubmit:function () {
	    var valResult=$("#gzrwtx").validate().form();
		
	    if (valResult) {
			$("#token").val(false);
		}
		
		return valResult;
	}, success:function (result) {
	   
		var res = eval("(" + result + ")");
	     
		if (res.success) {
		  
			showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
			
		    closeDialog(winId);// data
		   $("#" + parentWinId).datagrid("reload");
		} else {
			$("#token").val(true);
		     
			showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
		}
	}
	});

} 

 
  $(function(){
	
	 });   
	



 
</script>

<form id="gzrwtx" method="post"  name="gzrwtx"
	action="<%=path%>/gzrwtx/gzrwtx_save.do">
 
 <input type="hidden" id="token" value="true" />
<s:hidden id="id" name="vo.id" />

	<table width="90%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="hovertable">
		<tr class="title">
			<td colspan="4">
				工作任务提醒设置
			</td>
		</tr>
	
		<tr>
			<td width="377" class="title">名称:			</td>
			<td width="487" colspan="3"><s:textfield id="name" name='vo.name' size="26" />
		  </td>
			
  <tr>
	
			<td class="title">天数:			</td>
			<td colspan="3"> <s:textfield id="nf" name='vo.nf' size="10"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  cssClass="search_inputl"/>
			
  <tr>
			
			
			
  </tr>
		
	
	
	
		 
</table>
    <div class="dialog-button">
		<a id="" class="l-btn" href="#" onClick="savexGzrwtx(this.form,'add')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">确认</span> </span> </a>
		<a class="l-btn" href="#"
			onclick="closeDialog('add')"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">取消</span> </span> </a>
		
	</div>
	
</form>