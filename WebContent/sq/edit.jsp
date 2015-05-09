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
		<title>工资变动申请表</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/public.css" />
<link rel="stylesheet" href="${ctx}/interface/css/zTreeStyle.css" type="text/css"/>
		<link rel="stylesheet" type="text/css" href="${ctx}/css/demo.css" />		
		<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyUI.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyui-lang-zh_CN.js"></script>
			<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
		<script type="text/javascript" src="${ctx}/js/menutree.js"></script>
		<script type="text/javascript"
			src="${ctx}/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript"
			src="${ctx}/js/jquery.ztree.excheck-3.5.js"></script>
			<script type="text/javascript"
			src="${ctx}/gzbd/js/gzbd.js"></script>
			<script type="text/javascript" src="${ctx}/js/JqueryTree.js"></script>
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>
	</head>
<script>
$(document).ready(function(){
  
	$("#sq").validate({
		rules: {
		'vo.sqmc':{
				required : true
			 
			},	
			'menu1':{
				required : true
			 
			},	
			'vo.sqlx':{
				required : true
			 
			},	
			'vo.zhs':{
				required : true
			 
			},	
			'vo.xrzhs':{
				required : true
			 
			},	
			'vo.zrks':{
				required : true
			 
			},	
			'vo.czrks':{
				required : true
			 
			}
				
		}
	});							 	
});  
 function saveSq(form, winId, parentWinId) {
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
	
	//alert($("#id").val());
	//alert($("#pid").val());
	//$("#lb").val("b18");
	
 $("#sq").form("submit", {onSubmit:function () {
	    var valResult=$("#sq").validate().form();
		if (!valResult) {
   		  $.messager.alert('系统提示', '请完善录入信息','warning'); 
		  
		 }else{
		 var szsq=$("#code1").val();
		 if(szsq.length<14){
		    $.messager.alert('系统提示', '请选择对应的所属社区','warning'); 
			valResult=false;
		  }
		 
		}	
		if(valResult){
		   $("#token").val(false);
			$.messager.progress(); 
		}
	    
		return valResult;
	}, success:function (result) {
	   
		var res = eval("(" + result + ")");
	     
		if (res.success) {
		  
			showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
		//	closeDialog(winId);// data
			//window.parent.frames[--m].yerefresh(parentWinId);
			//var blbName ="学生思想动态研判工作记录";
		 window.parent.addTab("社区管理","${ctx}/sq/sq.do","","");
		  window.parent.closeTab("社区信息表");
		} else {
			$("#token").val(true);
		     
			showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
		}
	}
	});

} 

	
 $(function(){
     //openclxx();
	 var sssq="<s:property value='vo.sssq'/>";
	 if(sssq==""){
	   initTree('menu1','code1',${areaString},'');
	 }else{
	   initTree('menu1','code1',${areaString},sssq);
	 }
	  var isvisible = '<s:property value="bz"/>';
			   if(isvisible == "look"){
			   	$("input").attr("disabled",true);
			   	$("select").attr("disabled",true);
			   	$("textarea").attr("disabled",true);
			   }
 });
 function closeWin(name){
	//alert(name);
  window.parent.closeTab(name);
 }
</script>
	<style type="text/css">
ul.ztree {
	margin-top: 10px;
	border: 1px solid #617775;
	background: #FFFFFF;
	width: 98%;
	height: 400px;
	overflow-y: scroll;
	overflow-x: auto;
}
</style>

<center><h2>社区信息表</h2></center>
<form id="sq" method="post"  name="sq"
	action="<%=path%>/sq/sq_save.do">
 <input type="hidden" id="token" value="true" />
<s:hidden id="id" name="vo.id" />
	<table align="center" class="hovertable" border="0" cellpadding="0"
		cellspacing="0">
		<tr class="title">
			<td colspan="4">
				<strong>社区信息</strong>
			</td>
		</tr>
  <tr>
			<td class="title">
				社区名称:
			</td>
			<td>
			     <s:textfield id="sqmc" name='vo.sqmc' size="30"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				社区类型:
			</td>
			<td>
			    <s:select list="#request.codes" listKey="code" listValue="name" name="vo.sqlx" id="sqlx"   headerKey="0" headerValue="--社区类型--" cssStyle="width:200px" ></s:select>
			</td>
			
		</tr>
		<tr>
			<td class="title">
				所属社区:
			</td>
			<td>
			   <s:hidden name = "vo.sssq" id="code1"/>

			   <input id="menu1"  name="menu1" type="text" readonly="readonly" value="" style="width:120px;" onClick="showMenu(this);"/>
			</td>
			<td class="title">
				成立时间:
			</td>
			<td>
			     <s:textfield id="clsj" name='vo.clsj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"   cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr>
			<td class="title">
				区域面积（平方米）:
			</td>
			<td>
			     <s:textfield id="qymj" name='vo.qymj' size="15"   cssClass="search_inputl"/>
			</td>
			<td class="title">
				建筑面积（平方米）:
			</td>
			<td>
			     <s:textfield id="jzmj" name='vo.jzmj' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr class="title">
			<td colspan="4">
				<strong>社区四址</strong>
			</td>
		</tr>
		<tr>
			<td class="title">
				东:
			</td>
			<td>
			     <s:textfield id="dzd" name='vo.dzd' size="35"   cssClass="search_inputl"/>
			</td>
			<td class="title">
			南:
			</td>
			<td>
			     <s:textfield id="dzn" name='vo.dzn' size="35"  cssClass="search_inputl"/>
			</td>
			
		</tr>
			<tr>
			<td class="title">
				西:
			</td>
			<td>
			     <s:textfield id="dzx" name='vo.dzx' size="35"   cssClass="search_inputl"/>
			</td>
			<td class="title">
				北:
			</td>
			<td>
			     <s:textfield id="dzb" name='vo.dzb' size="35"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr class="title">
			<td colspan="4">
				<strong>社区规模</strong>
			</td>
		</tr>
		<tr>
			<td class="title">
				总户数:
			</td>
			<td>
			     <s:textfield id="zhs" name='vo.zhs' size="15"   cssClass="search_inputl" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			<td class="title">
					现入住户数:
			</td>
			<td>
			     <s:textfield id="xrzhs" name='vo.xrzhs' size="10"  cssClass="search_inputl" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			
		</tr>
		<tr>
			<td class="title">
				总人口数:
			</td>
			<td>
			     <s:textfield id="zrks" name='vo.zrks' size="15"   cssClass="search_inputl" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			<td class="title">
					常住人口数:
			</td>
			<td>
			     <s:textfield id="czrks" name='vo.czrks' size="10"  cssClass="search_inputl" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			
		</tr>
		<tr class="title">
			<td colspan="4">
				<strong>社区服务中心</strong>
			</td>
		</tr>
			<tr>
			<td class="title">
			位置:
			</td>
			<td>
			     <s:textfield id="fwzxwz" name='vo.fwzxwz' size="35"   cssClass="search_inputl"/>
			</td>
			<td class="title">
				面积（平方米）:
			</td>
			<td>
			     <s:textfield id="fwzxmj" name='vo.fwzxmj' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
	</table>
<div region="south" border="false" class="demo-info"> 
<s:if test="%{bz=='edit'}">
    <div align="center" style="padding:20px">
		<a id="" class="l-btn" href="javascript:void(0)" onclick="saveSq(this.form,'add')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">确认</span> </span> </a>
		
	</div>
	</s:if>
	<s:else>
	  <div align="center" style="padding:20px">
		<a id="" class="l-btn" href="javascript:void(0)" onClick="closeWin('社区信息表');"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">关闭</span> </span>  </a>
		
	</div>
	</s:else>
	</div>
	</form>
	 <div id="menuContent1"  
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
	</div>