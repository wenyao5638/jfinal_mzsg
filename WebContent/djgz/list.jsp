<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

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
		<script type="text/javascript" src="${ctx}/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.ztree.excheck-3.5.js"></script>
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
	
	<script type="text/javascript"> 
		function operate(value,row,index){
			var html = "";
			//html += "<a href='#' onclick='doAjaxTitleOpen(\"dg\",\"${ctx}/xssxd/xssxd_open.do\",\""+row.id+"\", \"\",800,400,\"add\",\"等级工资设置\")'>修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/xssxd/xssxd_del.do\",\""+row.id+"\", \"\")'>删除</a>";  
			  html += "<a href='#' onclick='doAjaxOpen(\"dg\",\"${ctx}/djgz/djgz_open.do\",\""+row.id+"\", \"\",600,300,\"add\")'>修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/djgz/djgz_del.do\",\""+row.id+"\", \"\")'>删除</a>";  
				return html;
		}
	
  	</script>
	<body>
<div class="easyui-layout" style="width: 100%; height: 100%;" fit="true">
	<div region="north" border="false" class="demo-info">
		<div id="search" title="查询选项" icon="icon-search"
			style="overflow: hidden; height: 35px; padding: 5px; background: #fafafa;">
		<form method="post">
			<input type="hidden" id="m" name="m"/>
			<table width="90%" cellspacing="0" style="font-size: 12px;">
				<tr>	
					<td align="right">类别:</td>
						<td ><s:select list="#request.lbs" listKey="code" listValue="name" name="lb2" id="lb2"   headerKey="" headerValue="--类别--" cssStyle="width:200px" ></s:select></td>
					<td align="right">等级:</td>
					<td>
						<s:select list="#request.djs" listKey="code" listValue="name" name="dj2" id="dj2"   headerKey="" headerValue="--等级--" cssStyle="width:200px" ></s:select>	
					</td>
					<td>
						<a id="btnEp" class="easyui-linkbutton" href="javascript:doQuery('dg')">查询</a>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<div region="center" class="gridback">
		<div id="dg" border=0 title="等级工资设置" pagination="true"
			toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
		</div>
	</div>
</div>
	
	<s:set var="columslist"
			value="{
			    #{'field':'action','title':'操作','width':'150','align':'center','formatterFun':'operate'},
				#{'field':'id','title':'ID','sortable':'true', 'hide':'true'},
			     #{'field':'lb','title':'类别','sortable':'true','width':'150'},
				#{'field':'dj','title':'等级','sortable':'true','width':'140'},
				#{'field':'je','title':'工资','sortable':'true','width':'80'},
				#{'field':'czr','title':'操作人','sortable':'true','width':'80'},	
				#{'field':'czsj','title':'操作时间','sortable':'true','width':'120'}		
			
				}" />
	  
	<s:set var="queryCondits"
			value="{
			    #{'field':'lb', 'type':'string', 'logic':'=', 'value':'lb2'},
				#{'field':'dj', 'type':'string', 'logic':'=', 'value':'dj2'}
			
				}" />

	<tags:gridTag gridId="dg" loadUrl="${ctx}/djgz/djgz_list.do" addUrl="${ctx}/djgz/djgz_open.do" addArg="&m=2"  addWin="add"  winheight="300" winwidth="600"  columsPropes="${columslist}"  queryCondits="${queryCondits}"  sortColum="czsj"  sortOrder="desc" width="99%" />
 	<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
		<ul id="menutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
	</div>  

	</body>
</html>