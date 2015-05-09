<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
<%@page import="vo.Img"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/WEB-INF/photo"%>
<%String contextPath = request.getContextPath();%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%String hdlb = (String)request.getAttribute("hdlb");%>
<%String id = (String)request.getAttribute("id"); %>	
<head>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/easyUI.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/photoTag.js"></script>
<script type="text/javascript" src="<%=contextPath%>/sglygl/js/sglygl.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree.js"></script>

</head>
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
	<%
		String menuString1 = (String) request.getAttribute("areaString");
	%>
	<script type="text/javascript">
	var m;
var fname="申请录用";
<s:if test="%{vo.xm!=null && vo.xm!=''}">
fname="录用登记表";
</s:if>
 for(var i=0;i<parent.arrayObj.length;i++){
			var a=parent.arrayObj[i];

			if(a[0].id==fname){
			   m=i;
			   break;
			}
			
		}
				
		 $(function(){
			 var isvisible = '<s:property value="#request.flag"/>';
			  var szsq = '<s:property value="vo.szsq"/>';
			   if(isvisible == "view" || isvisible == "sb"){
			   	$("input").attr("disabled",true);
			   	$("select").attr("disabled",true);
			   	$("textarea").attr("disabled",true);
			   }
			 
			     if(szsq==""){
					initTree('menu1','code1',${areaString},'${user.area}');
					}else{
					 initTree('menu1','code1',${areaString},'<s:property value="vo.szsq"/>');
					}
			 
			 	//$("#code1").attr("value","${user.username}");
		 });

				
	
		 function closeW(){
		 
		  window.parent.closeTab(fname);
		 }
	</script>



<body>
<center><h2>宁波市鄞州区社区专职工作者录用登记表</h2></center>
<form id="ajxx" method="post" action="<%=contextPath%>/sglygl/lysq_save.do">
	<s:hidden name ="vo.id" id = "id"></s:hidden>
	 <input type="hidden" id="path" value="<%=contextPath%>" />
	<s:hidden name = "vo.zt" id="zt"/>
	<s:hidden name = "flag" id="flag" value="%{#request.flag}"/>
	<s:hidden name = "vo.czr" id="czr"/>
	<s:hidden name = "vo.czrq" id="czrq"/>
	<s:hidden name = "vo.szsq" id="code1"/>
	<s:hidden name = "zt" id="ztm"/>
		
		
          
		<table align="center" class="hovertable" border="0" cellpadding="0"cellspacing="0">
	
		<tr class="title" height="29px">
			<td colspan="4">
				街道（镇）  （盖章）:
			</td>
			<td colspan="3" align="center">
				申请日期：<s:property value="%{vo.czrq}"/>
			</td>
		</tr>
		<tr>
		 	<td class="title">
				<div style="width: 70px;"><font color="red">*</font>姓  名:</div>
			</td>
			<td>
				<s:textfield name="vo.xm" size="8"/>
			</td>	
		 	<td class="title">
				<div style="width: 70px;"><font color="red">*</font>性别:</div>
			</td>
			<td width="60%">
			<s:select name ="vo.xb" id="xb" list="#request.xbList"  label="abc" listKey="code" listValue="name"  headerKey="-1" headerValue="请选择" value="%{vo.xb}"  cssStyle="width:60px"/>
			</td>
		 	<td class="title">
				<div style="width: 60px;"><font color="red">*</font>民族:</div>
			</td>
			<td>
				<s:select name ="vo.mz" id="mz" list="#request.mzList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.mz}" cssStyle="width:100%;"/>
			</td>
		 	<td class="title" width="25%" rowspan="5">
				<input type="hidden" name="id" id="id" value='<%=id%>'/> 
				<div align="left">
					<p:image ywId="<%=id%>" ywb="IMS_SGRYLYXX" edit="true" showimg="true" lb="01"/>
				</div>
			</td>
		</tr>
		<tr>
		 	<td class="title" width="20%" >
				<font color="red">*</font>证件类型:
			</td>
			<td width="20%">
				<s:select name ="vo.zjlx" id="zjlx" list="#request.zjlxList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zjlx}"/>
			</td>
		 	<td class="title" width="20%" >
				<font color="red">*</font>证件号码:
			</td>
			<td width="60%" colspan="1">
				<s:textfield name="vo.zjhm" maxlength="18" cssStyle="width: 80%;" readonly="false" />
			</td>
			<td class="title" width="20%">
				<font color="red">*</font>参加工作时间:
			</td>
			<td width="20%">
				<s:textfield name="vo.cjgzsj" id="cjgzsj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="6" ></s:textfield>
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" >
				<font color="red">*</font>出生年月:
			</td>
			<td width="20%">
				<s:textfield name="vo.csny" id="csny" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"></s:textfield>
			</td>
			<td class="title" width="20%" >
				<font color="red">*</font>文化程度:
			</td>
			<td width="20%">
				<s:select name ="vo.whcd" id="whcd" list="#request.whcdList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.whcd}"/>
			</td>
			<td class="title" width="20%" >
				<font color="red">*</font>政治面貌:
			</td>
			<td width="20%">
				<s:select name ="vo.zzmm" id="zzmm" list="#request.zzmmList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zzmm}"/>
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" >
				<font color="red">*</font>婚姻状况:
			</td>
			<td width="20%">
				<s:select name ="vo.hyzk" id="jtzk" list="#request.hyzkList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.hyzk}"/>
			</td>
			<td class="title" width="20%" >
				家庭状况:
			</td>
			<td width="20%">
				<s:select name ="vo.jtzk" id="jtzk" list="#request.jtzkList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.jtzk}"/>
			</td>
			<td class="title" width="20%" >
			医疗保障:
			</td>
			<td width="20%">
				<s:textfield name="vo.yybz" id="yybz" size="10"/>
			</td>
		</tr>
		<tr>
		 	<td class="title">
				电话号码:
			</td>
			<td>
				<s:textfield name="vo.dhhm" cssStyle="width: 50%;" />
		 	<td class="title">
				手机号码:
			</td>
			<td>
				<s:textfield name="vo.sjhm" size="12" />
			</td>
		 	<td class="title">
					<font color="red">*</font>人员来源:
			</td>
			<td>
				<s:select name ="vo.ryly" id="ryly" list="#request.rylyList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.ryly}"/>
			</td>
		</tr>
		<tr>
			<td class="title">
				籍贯:
			</td>
			<td>
				<s:textfield name ="vo.jg" id="jg" size="8"/>
			</td>
		 	<td class="title">

					<font color="red">*</font>户口性质:
			</td>
			<td>
				<s:select name ="vo.hkxx" id="hkxx" list="#request.hkxzList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.hkxx}"/>
			</td>
		 	<td class="title">

				户口所在地:
			</td>
			<td colspan="2">
				<s:textfield name="vo.hkszd" cssStyle="width: 80%;" />
			</td>
		</tr>
		<tr>
		 	<td class="title" width="20%">
				家庭地址:
			</td>
			<td width="60%" colspan="6">
				<s:textfield name="vo.jtdz" cssStyle="width: 90%;" />
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">
				<font color="red">*</font>劳动合同<br/>签订情况:
			</td>
			<td width="60%">
				<s:select name ="vo.ldhtqdqk" id="ldhtqdqk" list="#request.ldhtList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.ldhtqdqk}"/>
			</td>
			<td class="title" width="20%" >
				<font color="red">*</font>社会工作资格证书获得情况:
			</td>
			<td width="60%">
				<s:select name ="vo.zgzs" id="zgzs" list="#request.zgzsqkList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zgzs}"/>
			</td>
			<td class="title" width="20%">
				授予时间:
			</td>
			<td width="20%" colspan="2">
				<s:textfield name="vo.zgzssysj" id="zgzssysj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="6" ></s:textfield>
			</td>
		</tr>
		
		<tr>
			<td class="title" width="20%">
				<font color="red">*</font>所属社区:
			</td>
			 
			<td width="20%">
			 	<input id="menu1" name='menu1' type="text"  value="" style="width:120px;" onClick="showMenu(this);"/>
			</td>
			
			<td class="title" width="20%">
				<font color="red">*</font>上岗时间:
			</td>
			<td width="20%">
				<s:textfield name="vo.jsqsj" id="jsqsj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"></s:textfield>
			</td>
			<td><font color="red">*</font>职务：</td>
			<td width="60%" colspan="2">
			<s:iterator value="%{#request.zwList}" id="Code">
			  <input type="checkbox" name="zw" id="zw" value="${code}" <s:iterator value="%{#request.zws}" id="zwname"><s:if test="%{#zwname==code}"> checked="checked" </s:if></s:iterator>>${name}&nbsp;&nbsp;&nbsp;
			</s:iterator>
			
			</td>
			
		</tr>
		<tr>
			<td class="title" width="20%" rowspan="5">
				<font color="red">*</font>工资情况
			</td>
			<td class="title" width="20%" colspan="2">
			 	栏目
			</td>
			 
			<td class="title" width="20%">
				<font color="red">*</font>等级:
			</td>
			<td class="title" width="20%">
				工资额
			</td>
			<td class="title2" align="center" width="60%" colspan="2">
				执行起始时间
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	职务等级工资
			</td>
			 
			<td class="title" width="20%">
				<s:select name ="vo.zydjdj" id="zydjdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zydjdj}" onchange="gzdd('01')"/>
			</td>
			<td class="title" width="20%">
				<s:textfield name="vo.zydjgz" id="zydjgz" size="8"/>
			</td>
			<td width="60%" colspan="2">
				<s:textfield name="vo.zxqssj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	岗位工资
			</td>
			<td class="title" width="20%">
				<s:select name ="vo.gwdj" id="gwdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.gwdj}" onchange="gzdd('02')"/>
			</td>
			<td class="title" width="20%">
				<s:textfield name="vo.gwgz" id="gwgz" size="8"/>
			</td>
			<td width="60%" colspan="2">
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	地区津贴
			</td>
			<td class="title" width="20%">
				<s:select name ="vo.dqjtdj" id="dqjtdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.dqjtdj}" onchange="gzdd('03')"/>
			</td>
			<td class="title" width="20%">
				<s:textfield name="vo.dqjt" id="dqjt" size="8"/>
			</td>
			<td width="60%" colspan="2">
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	职业资格津贴
			</td>
			<td class="title" width="20%">
				<s:select name ="vo.zyzgjtdj" id="zyzgjtdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zyzgjtdj}" onchange="gzdd('04')"/>
			</td>
			<td class="title" width="20%">
				<s:textfield name="vo.zyzgjt" id="zyzgjt" size="8"/>
			</td>
			<td width="60%" colspan="2">
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">奖励或处分情况</td>
			<td colspan="6" align="left">
				<s:textarea  name="vo.ylqk" rows="7" cols="90" />
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">简历</td>
			<td colspan="6" align="left">
				<s:textarea  name="vo.jlxx" rows="7" cols="90" />
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">家庭成员信息</td>
			<td colspan="6">
				<s:textarea  name="vo.jtcyxx" rows="7" cols="90" />
			</td>
		</tr>
		
		<s:iterator value="#request.imgList" id = "emt" status="0">
			<s:if test="%{#emt.code != '01'}">
			<s:set value="%{#emt.code}" var="lbcode"/>
			<tr>
				<td class="title" width="20%"> <s:property value="#emt.name" /></td>
				<td colspan="6">
					<p:image ywId="<%=id%>" ywb="IMS_SGRYLYXX" edit="true" lb="${lbcode}" showimg="false"/>
				</td>
			</tr>
			</s:if>
			<s:elseif test="%{#emt.code = '01'}">
				<s:set value="%{#emt.code}" var="headlb"/>
			</s:elseif>
		</s:iterator>
		</table>
	
		
<div region="south" border="false" class="demo-info"> 
    <div align="center" style="padding:20px">
	
		 <s:if test="#request.flag=='view'">
		 		<a class="l-btn" href="javascript:void(0)"
			onClick="closeW();"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">关闭</span> </span> </a>
		 </s:if>
		 <s:elseif test="#request.flag=='input'">
		 
		 	<a id="" class="l-btn" href="javascript:void(0)" onClick="tjbd('00')">
		 	<span class="l-btn-left"> <span class="icon-add"
				style="padding-left: 20px;">保存</span> </span> </a>&nbsp;&nbsp;
				<a class="l-btn" href="javascript:void(0)"
			onclick="tjbd('01')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">上报</span> </span>  </a>
				
		 </s:elseif> 
		 <s:elseif test="#request.flag=='update'">
		 		<a class="l-btn" href="javascript:void(0)"
			onclick="tjbd('00')"> <span
			class="l-btn-left"> <span class="icon-add"
				style="padding-left: 20px;">保存</span> </span>  </a>&nbsp;&nbsp;
					<a class="l-btn" href="javascript:void(0)"
			onclick="tjbd('01')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">上报</span> </span>  </a>
				
		 </s:elseif> 
		 
		<s:else>
			<a class="l-btn" href="javascript:void(0)"
			onclick="closeW();"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">关闭</span> </span> </a>
		</s:else>
		</div>
		</div>
		
       </div>
		
    
	   <div id="menuContent1"  
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
	</div>


</form>
</body>
</html>
