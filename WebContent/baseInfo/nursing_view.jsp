<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%String contextPath=request.getContextPath(); %>
<title>基础信息>>生养信息</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/common.css"/>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<style>
textarea
{
width:80%;
height:100%;
}
ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>

<script language="javascript">
		
$(function(){
});

function zsysp_base_addfromBaseInfo(){
	window.parent.location.href=("<%=contextPath%>/zsysp/zsysp_base_addfromBaseInfo.do?BT_CODE=<s:property value='BT_CODE'/>&lx=<s:property value='lx'/>&sqly=<s:property value='sqly'/>");
}
</script>
</head>

<body> 

<table width="90%" cellSpacing=1 cellPadding=1 class=box align="center">
	<tr bgcolor="#FFFFFF">
	<td align="center" class=box_td>孩次号</td>
	<td align="center" class=box_td>子女姓名</td>
	<td align="center" class=box_td>性别</td>
	<td align="center" class=box_td>出生日期</td>
	<td align="center" class=box_td>健康状况</td>
	<td align="center" class=box_td>抚养关系</td>
	<td align="center" class=box_td>生育指标</td>
	<td align="center" class=box_td>死亡原因</td>
	<td align="center" class=box_td>死亡日期</td>
	<s:iterator value="#request.nursingList" id="id"> 
		<tr bgcolor="#FFFFFF">
			<td align="center" class=box_td><s:property value="#id[1]" /></td>
			<td align="center" class=box_td><s:property value="#id[3]" /></td>
			<td align="center" class=box_td><s:property value="#id[18]" /></td>
			<td align="center" class=box_td><s:property value="#id[6]" /></td>
			<td align="center" class=box_td><s:property value="#id[19]" /></td>
			<td align="center" class=box_td><s:property value="#id[17]" /></td>
			<td align="center" class=box_td><s:property value="#id[21]" /></td>
			<td align="center" class=box_td><s:property value="#id[20]" /></td>
			<td align="center" class=box_td><s:property value="#id[14]" /></td>
		</tr>
	</s:iterator>
	<s:hidden name="basetable.BT_BNAME" id="BT_BNAME"/>
	<s:hidden name="husband.HB_HUSBAND_NAME" id="HB_HUSBAND_NAME"/>
	
	<s:if test="%{lx!=\"null\"}">
	<tr align="center" bgcolor="#FFFFFF"> 
		<td colspan="9" height="30"  valign="middle" class=box_td>
			<a id="btnEp" class="easyui-linkbutton" icon="icon-add" href="javascript:zsysp_base_addfromBaseInfo()" >选择 </a>&nbsp;&nbsp;
		</td>
	</tr>
	</s:if>
</table>
</body>
</html>