<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();%>  
<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<%
		String menuString1 = (String) request.getAttribute("tree");
	%>

<html>
	<head>
		<title>等级工资设置</title>
	
	</head>
<script>

 	
$(document).ready(function(){
  
	$("#djgz").validate({
		rules: {
			'vo.lb':{
				required : true
			 
			},'vo.dj':{
				required : true
			 
			},'je':{
				required : true
			 
			}
				
		}
	});							 	
});  
 function savexDjgz(form, winId, parentWinId) {
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
	
	
	if($("#lb").val()==""){
	 $.messager.alert('系统提示', '请选择类别！','warning');
	 return false;
	  
	}else if($("#dj").val()==""){
		$.messager.alert('系统提示', '请选择等级！','warning');
		return false;
	}else if($("#je").val()==""){
	   $.messager.alert('系统提示', '请填写工资！','warning');
		return false;
	}
	$("#ije").val($("#je").val());
 $("#djgz").form("submit", {onSubmit:function () {
	    var valResult=$("#djgz").validate().form();
		
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

<form id="djgz" method="post"  name="djgz"
	action="<%=path%>/djgz/djgz_save.do">
 
 <input type="hidden" id="token" value="true" />
<s:hidden id="id" name="vo.id" />
<s:hidden id="ije" name="vo.je" />
<s:hidden id="enable" name="vo.enable" value="1"/>

	<table align="center" class="hovertable" border="0" cellpadding="0"
		cellspacing="0">
		<tr class="title">
			<td colspan="4">
				等级工资设置
			</td>
		</tr>
	
		<tr>
			<td class="title">
				<font color="red">*</font>类别:
			</td>
			<td colspan="3"> <s:select list="#request.lbs" listKey="code" listValue="name" name="vo.lb" id="lb"   headerKey="" headerValue="--类别--" cssStyle="width:200px" ></s:select>	
			</td>
			
			<tr>
	
			<td class="title">
				<font color="red">*</font>等级:
			</td>
			<td colspan="3"> <s:select list="#request.djs" listKey="code" listValue="name" name="vo.dj" id="dj"   headerKey="" headerValue="--等级--" cssStyle="width:200px" ></s:select>	
			</td>
			
			<tr>
			
			<td class="title">
				<font color="red">*</font>工资:
			</td>
			<td>
			     <s:textfield id="je" name='je' size="10"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  cssClass="search_inputl"/><font color="red">请输入数</font>
			</td>
			
		</tr>
		
	
	
	
		 
	</table>
    <div class="dialog-button">
		<a id="" class="l-btn" href="#" onClick="savexDjgz(this.form,'add')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">确认</span> </span> </a>
		<a class="l-btn" href="#"
			onclick="closeDialog('add')"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">取消</span> </span> </a>
		
	</div>
	
</form>