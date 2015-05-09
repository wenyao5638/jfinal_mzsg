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
		<link rel="stylesheet" href="${ctx}/interface/css/zTreeStyle.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/gray/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/css/public.css" />
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
	</head>
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
