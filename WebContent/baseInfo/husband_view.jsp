<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%String contextPath=request.getContextPath(); %>
<title>基础信息>>丈夫信息</title>
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
	window.parent.location.href="<%=contextPath%>/zsysp/zsysp_base_addfromBaseInfo.do?BT_CODE=<s:property value='BT_CODE'/>&lx=<s:property value='lx'/>&sqly=<s:property value='sqly'/>";
}
</script>

</head>
  
<body>
<table width="50%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="left"><font color="#FF0000"><s:property value="%{#request.info}"/></font></td>
	</tr>
</table>
<form id="basetable" method="post" enctype="multipart/form-data">
<table width="80%" cellSpacing=1 cellPadding=1 class=box align="center">
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>姓名：</td>
		<td class=box_td> <s:textfield name="husband.HB_HUSBAND_NAME"  id="HB_HUSBAND_NAME" cssClass="text" size="20" readonly="true"/></td>
		<td align="right" height="19" class=box_td>身份证号：</td>
		<td class=box_td> <s:textfield name="husband.HB_ID_CARD"  id="HB_ID_CARD" cssClass="text" size="20" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>出生日期：</td>
		<td class=box_td> <s:textfield name="husband.HB_BIRTH_DATE"  id="HB_BIRTH_DATE" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>名族：</td>
		<td align="left"><s:select name="husband.HB_FOLK" id="HB_FOLK" list="#request.mzList" listKey="code" listValue="name" headerKey="" headerValue="==民族==" disabled="true"></s:select></td>
	</tr>

	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>户口性质：</td>
		<td align="left"><s:select name="husband.HB_HKSX" id="HB_HKSX" list="#request.hkxzList" listKey="code" listValue="name" headerKey="" headerValue="==户口性质==" disabled="true"></s:select></td>
		<td align="right" height="19" class=box_td>职业：</td>
		<td align="left"><s:select name="husband.HB_JOB" id="HB_JOB" list="#request.zyList" listKey="code" listValue="name" headerKey="" headerValue="==职业==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>工作单位：</td>
		<td class=box_td> <s:textfield name="husband.HB_UNIT"  id="HB_UNIT" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>文化程度：</td>
		<td align="left"><s:select name="husband.HB_CULTURE_DEGREE" id="HB_CULTURE_DEGREE" list="#request.whcdList" listKey="code" listValue="name" headerKey="" headerValue="==文化程度==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF">
		<td align="right" height="19" class=box_td>婚姻状况：</td>
		<td align="left"><s:select name="husband.HB_WED_STATUS" id="HB_WED_STATUS" list="#request.hyzkList" listKey="code" listValue="name" headerKey="" headerValue="==婚姻状况==" disabled="true"></s:select></td>
		<td align="right" height="19" class=box_td>政治面貌：</td>
		<td align="left"><s:select name="husband.HB_PARTY" id="HB_PARTY" list="#request.zzmmList" listKey="code" listValue="name" headerKey="" headerValue="==政治面貌==" disabled="true"></s:select></td>
	</tr>

	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>联系电话：</td>
		<td class=box_td> <s:textfield name="husband.HB_PHONE"  id="HB_PHONE" cssClass="text" size="20" readonly="true"/></td>
		<td align="right" height="19" class=box_td>是否独生子女：</td>
		<td align="left"><s:select name="husband.HB_SFDSZN" id="HB_SFDSZN" list="#request.isornotList" listKey="name" listValue="name" headerKey="" headerValue="==是否独生子女==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>户籍地址：</td>
		<td colspan="3" class=box_td> <s:textfield name="husband.HB_DOOR_PLACE"  id="HB_DOOR_PLACE" cssClass="text" size="40" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>现住地址：</td>
		<td colspan="3" class=box_td> <s:textfield name="husband.HB_ADDRESS"  id="HB_ADDRESS" cssClass="text" size="40" readonly="true"/></td>
	</tr>
	<s:hidden name="basetable.BT_BNAME" id="BT_BNAME"/>
	
	<s:if test="%{lx!=\"null\"}">
	<tr align="center" bgcolor="#FFFFFF"> 
		<td colspan="4" height="30"  valign="middle" class=box_td>
			<a id="btnEp" class="easyui-linkbutton" icon="icon-add" href="javascript:zsysp_base_addfromBaseInfo()" >选择 </a>&nbsp;&nbsp;
		</td>
	</tr>
	</s:if>
	
<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="menutree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
</TABLE>

</form>
</body>
</html>
