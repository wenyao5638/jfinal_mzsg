<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%String contextPath=request.getContextPath(); %>
<title>基础信息>>妇女信息</title>
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
		<td align="right" height="19" class=box_td>建卡日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_BUILDE_DATE"  id="BT_BUILDE_DATE" cssClass="text" size="20" readonly="true"/></td>
		<td align="right" height="19" class=box_td>建卡人：</td>
		<td class=box_td> <s:textfield name="basetable.BT_BUILDER"  id="BT_BUILDER" cssClass="text" size="20" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td width="10%" align="right" height="19" class=box_td>信息卡号：</td>
		<td width="15%" class=box_td> <s:textfield name="basetable.BT_CODE"  id="BT_CODE" cssClass="text" size="20" readonly="true"/></td>
		<td width="10%" align="right" height="19" class=box_td>身份证号：</td>
		<td width="15%" class=box_td> <s:textfield name="basetable.BT_ID_CARD"  id="BT_ID_CARD" cssClass="text" size="20" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>姓名：</td>
		<td class=box_td> <s:textfield name="basetable.BT_BNAME"  id="BT_BNAME" cssClass="text" size="20" readonly="true"/></td>
		<td align="right" height="19" class=box_td>联系电话：</td>
		<td class=box_td> <s:textfield name="basetable.BT_PHONE"  id="BT_PHONE" cssClass="text" size="20" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>户籍地址：</td>
		<td colspan="3" class=box_td> <s:textfield name="basetable.BT_DOOR_PLACE"  id="BT_DOOR_PLACE" cssClass="text" size="40" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>现住地址：</td>
		<td colspan="3" class=box_td> <s:textfield name="basetable.BT_ADDRESS"  id="BT_ADDRESS" cssClass="text" size="40" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>出生日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_BIRTHDAY_DATE"  id="BT_BIRTHDAY_DATE" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>名族：</td>
		<td align="left"><s:select name="basetable.BT_FOLK" id="BT_FOLK" list="#request.mzList" listKey="code" listValue="name" headerKey="" headerValue="==民族==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>户口性质：</td>
		<td align="left"><s:select name="basetable.BT_HKSX" id="BT_HKSX" list="#request.hkxzList" listKey="code" listValue="name" headerKey="" headerValue="==户口性质==" disabled="true"></s:select></td>
		<td align="right" height="19" class=box_td>职业：</td>
		<td align="left"><s:select name="basetable.BT_JOB" id="BT_JOB" list="#request.zyList" listKey="code" listValue="name" headerKey="" headerValue="==职业==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>工作单位：</td>
		<td class=box_td> <s:textfield name="basetable.BT_UNIT"  id="BT_UNIT" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>文化程度：</td>
		<td align="left"><s:select name="basetable.BT_CULTURE_DEGREE" id="BT_CULTURE_DEGREE" list="#request.whcdList" listKey="code" listValue="name" headerKey="" headerValue="==文化程度==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>政治面貌：</td>
		<td align="left"><s:select name="basetable.BT_PARTY" id="BT_PARTY" list="#request.zzmmList" listKey="code" listValue="name" headerKey="" headerValue="==政治面貌==" disabled="true"></s:select></td>
		<td align="right" height="19" class=box_td>健康状况：</td>
		<td align="left"><s:select name="basetable.BT_HEALTH_STATE" id="BT_HEALTH_STATE" list="#request.jkzkList" listKey="code" listValue="name" headerKey="" headerValue="==健康状况==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>户主姓名：</td>
		<td class=box_td> <s:textfield name="basetable.BT_MASTER"  id="BT_MASTER" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>婚姻状况：</td>
		<td align="left"><s:select name="basetable.BT_WED_STATUS" id="BT_WED_STATUS" list="#request.hyzkList" listKey="code" listValue="name" headerKey="" headerValue="==婚姻状况==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>初婚日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_WED_DATE"  id="BT_WED_DATE" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>初婚上报日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_WED_REPORT"  id="BT_WED_REPORT" cssClass="text" size="15" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>婚姻变动日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_WED_CHANGE"  id="BT_WED_CHANGE" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>婚姻登记日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_WED_DJDATE"  id="BT_WED_DJDATE" cssClass="text" size="15" readonly="true"/></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>迁入日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_INDATE"  id="BT_INDATE" cssClass="text" size="15" readonly="true"/></td>
		<td align="right" height="19" class=box_td>管理类型：</td>
		<td align="left"><s:select name="basetable.BT_MANAGER" id="BT_MANAGER" list="#request.gllxList" listKey="code" listValue="name" headerKey="" headerValue="==管理类型==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td align="right" height="19" class=box_td>是否独生子女：</td>
		<td align="left"><s:select name="basetable.BT_SFDSZN" id="BT_SFDSZN" list="#request.isornotList" listKey="name" listValue="name" headerKey="" headerValue="==是否独生子女==" disabled="true"></s:select></td>
		<td align="right" height="19" class=box_td>注销原因：</td>
		<td align="left"><s:select name="basetable.BT_LOG_CAUSE" id="BT_LOG_CAUSE" list="#request.zxyyList" listKey="code" listValue="name" headerKey="" headerValue="==注销原因==" disabled="true"></s:select></td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
		<td colspan="2" height="19" class=box_td></td>
		<td align="right" height="19" class=box_td>注销日期：</td>
		<td class=box_td> <s:textfield name="basetable.BT_LOG_DAY"  id="BT_LOG_DAY" cssClass="text" size="15" readonly="true"/></td>
	</tr>
	
	<tr>
		<td align="right" height="50" class=box_td>备注：</td>
		<td colspan="3" class=box_td>
			<s:textarea name="basetable.BT_BZ" id="BT_BZ" cssClass="text"></s:textarea>
		</td>
	</tr>
	<s:hidden name="husband.HB_HUSBAND_NAME" id="HB_HUSBAND_NAME"/>
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
