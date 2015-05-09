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
<body topmargin="0">
<table align="center" class="hovertable" border="0" cellpadding="0"
		cellspacing="0">
		<form id="sq" method="post"  name="sq"
	action="<%=path%>/sq/sq_save.do">
 
 <input type="hidden" id="token" value="true" />
		<tr class="title">
			<td colspan="4">
				社区信息
			</td>
		</tr>
	　<tr>
			<td class="title">
				社区名称:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				社区类型:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		　<tr>
			<td class="title">
				所属社区:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				成立时间:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		　<tr>
			<td class="title">
				区域面积（平方米）:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				建筑面积（平方米）:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
	
	<tr class="title">
			<td colspan="4">
				社区四址
			</td>
		</tr>
	　<tr>
			<td class="title">
				东:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				南:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		　<tr>
			<td class="title">
				西:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				北:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr class="title">
			<td colspan="4">
				社区规模
			</td>
		</tr>
		　<tr>
			<td class="title">
				总户数:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				现入住户数:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr>
			<td class="title">
				总人口数:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				常住人口数:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
	<tr class="title">
			<td colspan="4">
				社区服务中心
			</td>
		</tr>
	　<tr>
			<td class="title">
				位置:
			</td>
			<td>
			     <s:textfield id="sj" name='vo.sj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				面积（平方米）:
			</td>
			<td>
			     <s:textfield id="jlr" name='vo.jlr' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		 </form>
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
	</body></html>
