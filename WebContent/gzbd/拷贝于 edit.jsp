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
		<link rel="stylesheet" type="text/css" href="${ctx}/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css" />
		
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
	</head>
<script>
var m;
var fname="工资变动申请表";
 for(var i=0;i<parent.arrayObj.length;i++){
			var a=parent.arrayObj[i];

			if(a[0].id==fname){
			   m=i;
			   break;
			}
			
		}
		
$(document).ready(function(){
  
	$("#gzbd").validate({
		rules: {
			'vo.sgry.xm':{
				required : true
			 
			},
			'vo.bdyy':{
				required : true
			 
			}
			<s:if test="%{bz=='edit'}">
            ,
			'vo.spb.sqheyj':{
				required : true
			 
			}
			
			</s:if>
			<s:if test="%{bz=='sp'}">
			,
			'vo.spb.qspyj':{
				required : true
			 
			}
			
			</s:if>
				
		}
	});							 	
});  
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

<form id="gzbd" method="post"  name="gzbd"
	action="<%=path%>/gzbd/gzbd_save.do"　class="form-horizontal">
 <input type="hidden" id="path" value="<%=path%>" />
 <input type="hidden" id="token" value="true" />
<s:hidden id="id" name="vo.id" />
<s:hidden id="ryid" name="vo.sgry.id" />
<s:hidden id="zt" name="vo.zt" />
<s:hidden id="ryid" name="vo.spb.id" />
<s:hidden id="sssq" name="vo.sssq" />
<s:hidden id="sbarea" name="vo.spb.sbarea" />
<s:hidden id="qarea" name="vo.spb.qarea" />
<s:hidden id="03" name="vo.spb.splx" />
<s:hidden id="name" name="name" />


<center><h2>鄞州区社区专职工作人员工资变动审批表</h2></center>
	<table align="center" class="form-horizontal" border="0" cellpadding="0"
		cellspacing="0">
  <tr >
    <td width="15%" valign="top" class="control-label">姓名</td>
    <td width="18%" valign="top"　class="controls"><s:textfield name="vo.sgry.xm" id="xm" cssClass="text" size="10" readOnly="true" /><s:if test="%{ (bz=='sq'|| bz=='edit')}"><input type="button" name="dialog" value="选择" onClick="dialog2()"></s:if><!--<a id="btnEp"	href="javascript:dialog('dg')"> 选择</a>--> </td>
    <td width="17%" valign="top" class="title">性别</td>
    <td width="17%" valign="top" ><s:textfield name="vo.sgry.xb" id="xb" cssClass="text" size="10" readOnly="true" /></td>
    <td width="16%" valign="top" class="title">出生年月</td>
    <td width="17%"  valign="top"><s:textfield name="vo.sgry.csny" id="csny" cssClass="text" size="10" readOnly="true" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
  </tr>
  <tr>
    <td  valign="top" class="title" ><p>参加工作时间 </p></td>
    <td  valign="top"><s:textfield name="vo.sgry.cjgzsj" id="cjgzsj" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readOnly="true" /></td>
	 <td valign="top" class="title"><p>进社区时间 </p></td>
    <td valign="top"><s:textfield name="vo.jsqsj" id="jsqsj" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readOnly="true"/></td>
    <td  valign="top" class="title"><p>职务 </p></td>
    <td  valign="top"><s:textfield name="vo.zw" id="zw" cssClass="text" size="10" readOnly="true"/></td>
  </tr>
  <tr>
    <td  rowspan="5" class="title"><p align="center">变动前工资情况</td>
    <td  valign="top" class="title" align="center">栏目</td>
    <td  valign="top" class="title5" align="center">等级 </td>
    <td  valign="top" class="title5" align="center">工资额</td>
    <td colspan="2" valign="top" class="title5">执行起始时间</td>
  </tr>
  <tr>
    <td  valign="top" class="title"><p>职务等级工资 </p></td><s:hidden id="yzwdj2" name="vo.yzwdj" />

    <td  valign="top"><p>
	<s:textfield name="yzwdj_name" id="yzwdj" cssClass="text" size="10" readOnly="true"/> </p></td>
    <td  valign="top"><p><s:textfield name="vo.yzwdjgz" id="yzwdjgz" cssClass="text" size="10" readOnly="true"/>元 </p></td>
    <td colspan="2" valign="top"><p><s:textfield name="vo.yzwgzdjrq" id="yzwgzdjrq" cssClass="text" size="10" readOnly="true"/></p></td>
  </tr>
  <tr>
    <td  valign="top" class="title"><p>岗位工资 </p></td><s:hidden id="ygwdj2" name="vo.ygwdj" />
    <td valign="top"><p><s:textfield name="ygwgz_name" id="ygwdj" cssClass="text" size="10" readOnly="true"/></p></td>
    <td  valign="top"><p><s:textfield name="vo.ygwgz" id="ygwgz" cssClass="text" size="10" readOnly="true"/>元 </p></td>
    <td colspan="2" valign="top"><s:textfield name="vo.ygwgzrq" id="ygwgzrq" cssClass="text" size="10" readOnly="true"/></td>
  </tr>
  <tr>
    <td  valign="top" class="title"><p>地区津贴 </p></td><s:hidden id="ydqjtdj2" name="vo.ydqjtdj" />
    <td  valign="top"><p><s:textfield name="ydqjtdj_name" id="ydqjtdj" cssClass="text" size="10" readOnly="true"/> </p></td>
    <td  valign="top"><p><s:textfield name="vo.ydqjt" id="ydqjt" cssClass="text" size="10" readOnly="true"/>元 </p></td>
    <td colspan="2" valign="top"><s:textfield name="vo.ydqjtrq" id="ydqjtrq" cssClass="text" size="10" readOnly="true"/></td>
  </tr>
  <tr>
    <td  valign="top" class="title"><p>职业资格津贴 </p></td><s:hidden id="yzyzgjtdj2" name="vo.yzyzgjtdj" />
    <td  valign="top"><p><s:textfield name="yzyzgjtdj_name" id="yzyzgjtdj" cssClass="text" size="10" readOnly="true"/></p></td>
    <td  valign="top"><p><s:textfield name="vo.yzyzgjt" id="yzyzgjt" cssClass="text" size="10" readOnly="true"/>元 </p></td>
    <td colspan="2" valign="top"><s:textfield name="vo.yzyzgjtrq" id="yzyzgjtrq" cssClass="text" size="10" readOnly="true"/></td>
  </tr>
  <tr>
    <td valign="top" class="title"><p>变动原因 </p></td>
    <td  valign="top" colspan="5"><s:textfield name="vo.bdyy" id="bdyy" cssClass="text" size="120"/></td>
    
  </tr>
  <tr>
    <td rowspan="5" class="title"><p align="center">变动后工资情况 </p></td>
    <td  valign="top" class="title" align="center">栏目</td>
    <td  valign="top" class="title5" align="center">等级</td>
    <td  valign="top" class="title5" align="center">工资额</td>
    <td colspan="2" valign="top" class="title5" align="center">执行起始时间</td>
  </tr>
  <tr>
    <td  valign="top" class="title"><p>职务等级工资 </p></td>
    <td  valign="top"><p><s:select name="vo.xzydj" id="xzydj" cssClass="text" list="#request.djs" listKey="code" listValue="name"  headerKey="" headerValue="" onChange="gzdd('01')"/>级 
</p></td>
    <td  valign="top"><p><s:textfield name="vo.xzydjgz" id="xzydjgz" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>元 </p></td>
    <td colspan="2" valign="top"><p><s:textfield name="vo.xzydjgzrq" id="xzygzdjrq" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" onBlur="changeRq()"/></p></td>
  </tr>
  <tr>
    <td valign="top" class="title"><p>岗位工资 </p></td>
    <td valign="top"><p><s:select name="vo.xgwdj" id="xgwdj" cssClass="text" list="#request.djs" listKey="code" listValue="name"  headerKey="" headerValue="" onChange="gzdd('02')"/>级 </p></td>
    <td  valign="top"><p><s:textfield name="vo.xgwgz" id="xgwgz" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>元 </p></td>
    <td colspan="2" valign="top"><s:textfield name="vo.xgwgzrq" id="xgwgzrq" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
  </tr>
  <tr>
    <td  valign="top" class="title"><p>地区津贴 </p></td>
    <td  valign="top"><p><s:select name="vo.xdqjtdj" id="xdqjtdj" cssClass="text" list="#request.djs" listKey="code" listValue="name"  headerKey="" headerValue="" onChange="gzdd('03')"/>级 </p></td>
    <td  valign="top"><p><s:textfield name="vo.xdqjt" id="xdqjt" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>元 </p></td>
    <td colspan="2" valign="top"><s:textfield name="vo.xdqjtrq" id="xdqjtrq" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
  </tr>
  <tr>
    <td  valign="top" class="title"><p>职业资格津贴 </p></td>
     <td  valign="top"><p><s:select name="vo.xzyzgjtdj" id="xzyzgjtdj" cssClass="text" list="#request.djs" listKey="code" listValue="name"  headerKey="" headerValue="" onChange="gzdd('04')"/>级 </p></td>
    <td  valign="top"><p><s:textfield name="vo.xzyzgjt" id="xzyzgjt" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>元 </p></td>
    <td colspan="2" valign="top"><s:textfield name="vo.xzyzgjtrq" id="xzyzgjtrq" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
  </tr>
  <tr>
    <td class="title"><p align="center">备注 </p></td>
    <td colspan="5" valign="top"><s:textarea name="vo.bz" id="bz" cssClass="text" cssStyle="width: 880px; height:80px;" /></td>
  </tr>
  <tr>
    <td class="title" rowspan="2"><p align="center">社区意见 </p></td>
    <td colspan="5" valign="top"><s:if test="%{(bz=='sq'|| bz=='edit')&& (vo.zt==null || vo.zt=='00'||vo.zt=='')}"><s:textarea name="vo.spb.sqheyj" id="sqheyj" cssClass="text" cssStyle="width: 880px; height:80px;" /></s:if><s:else><s:textarea name="vo.spb.sqheyj" id="sqheyj" cssClass="text" cssStyle="width: 880px; height:80px;" readonly="true"/></s:else></td>
  </tr>
  <tr>
  <td colspan="5" align="right">日期:<s:textfield name="vo.spb.sqherq" id="sqherq" cssClass="text" size="18" readOnly="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td  class="title" rowspan="2">街道（乡镇）<br>意见 </td>
    <td colspan="5" valign="top"><s:if test="%{(bz=='sq'|| bz=='edit')&& (vo.zt==null ||vo.zt=='00'||vo.zt=='')}"><s:textarea name="vo.spb.tjyj" id="tjyj" cssClass="text" cssStyle="width: 880px; height:80px;" /></s:if><s:else><s:textarea name="vo.spb.tjyj" id="tjyj" cssClass="text" cssStyle="width: 880px; height:80px;" readonly="true"/></s:else>
      </td>
  </tr>
   <tr>
  <td colspan="5" align="right">上报人：<s:textfield name="vo.spb.tjr" id="tjr" cssClass="text" size="10"  readOnly="true"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期:<s:textfield name="vo.spb.tjrq" id="tjrq" cssClass="text" size="20" readOnly="true"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="title"  rowspan="2"><p align="center">区民政局 <br>
      意见 </p></td>
    <td colspan="5" valign="top"><s:if test="%{bz=='sp'&& vo.zt=='01'}"><s:textarea name="vo.spb.qspyj" id="qspyj" cssClass="text" cssStyle="width: 880px; height:80px;"  /></s:if><s:else><s:textarea name="vo.spb.qspyj" id="qspyj" cssClass="text" cssStyle="width: 880px; height:80px;" readonly="true" /></s:else>
      </td>
  </tr>
    <tr>
  <td colspan="5" align="right">审核人：<s:if test="%{bz=='sp'&& vo.zt=='01'}"><s:textfield name="vo.spb.qspr" id="qspr" cssClass="text" size="10"  readOnly="true"/></s:if><s:else>
  <s:textfield name="vo.spb.qspr" id="qspr" cssClass="text" size="10"  readOnly="true"/></s:else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期:<s:if test="%{bz=='sp'&& vo.zt=='01'}"><s:textfield name="vo.spb.qsprq" id="qsprq" cssClass="text" size="10" readOnly="true"/></s:if><s:else><s:textfield name="vo.spb.qsprq" id="qsprq" cssClass="text" size="10"  readOnly="true"/></s:else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  
 
</table>
<div region="south" border="false" class="demo-info"> 
    <div align="center" style="padding:20px">
	 <s:if test="%{bz=='look'}">
	   <a id="" class="l-btn" href="javascript:void(0)" onClick="closeWin('工资变动申请表');"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">关闭</span> </span>  </a>
	 
	 </s:if>
	 <s:elseif test="%{cz==0 &&(bz=='edit'|| bz=='sq')}">
		<a id="" class="l-btn" href="javascript:void(0)" onClick="saveGzbd('00')"> <span
			class="l-btn-left"> <span class="icon-add"
				style="padding-left: 20px;">保存</span> </span>  </a>&nbsp;&nbsp;
		<a class="l-btn" href="javascript:void(0)"
			onclick="saveGzbd('01')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">上报</span> </span>  </a>
				</s:elseif>
		<s:elseif test="%{cz==1&& bz=='sp'}">
		<a id="" class="l-btn" href="javascript:void(0)" onClick="saveGzbd('02')"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">退回</span></span> </a>&nbsp;&nbsp;
		<a class="l-btn" href="javascript:void(0)"
			onclick="saveGzbd('03')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">批准</span></span>  </a>
		 
		</s:elseif>
				</form>
		</div>
</div>
