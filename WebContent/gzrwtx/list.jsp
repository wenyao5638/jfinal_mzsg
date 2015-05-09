<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
	<head>
		<title>工作任务提醒设置</title>
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
			//html += "<a href='#' onclick='doAjaxTitleOpen(\"dg\",\"${ctx}/xssxd/xssxd_open.do\",\""+row.id+"\", \"\",800,400,\"add\",\"工作任务提醒设置\")'>修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/xssxd/xssxd_del.do\",\""+row.id+"\", \"\")'>删除</a>";  
			  html += "<a href='#' onclick='doAjaxOpen(\"dg\",\"${ctx}/gzrwtx/gzrwtx_open.do\",\""+row.id+"\", \"\",600,300,\"add\")'>修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/gzrwtx/gzrwtx_del.do\",\""+row.id+"\", \"\")'>删除</a>";  
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
					<td align="right">名称:</td>
						<td ><s:textfield id="name" name='name' size="26" /></td>
					
						
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
		<div id="dg" border=0 title="工作任务提醒设置" pagination="true"
			toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
		</div>
	</div>
</div>
	
	<s:set var="columslist"
			value="{
			    #{'field':'action','title':'操作','width':'150','align':'center','formatterFun':'operate'},
				#{'field':'id','title':'ID','sortable':'true', 'hide':'true'},
			     #{'field':'name','title':'名称','sortable':'true','width':'150'},
				#{'field':'nf','title':'天数','sortable':'true','width':'140'}
			
				}" />
	  
	<s:set var="queryCondits"
			value="{
			    #{'field':'name', 'type':'string', 'logic':'like', 'value':'name'}
			
				}" />

	<tags:gridTag gridId="dg" loadUrl="${ctx}/gzrwtx/gzrwtx_list.do" addUrl="${ctx}/gzrwtx/gzrwtx_open.do" addArg="&m=2"  addWin="add"  winheight="300" winwidth="600"  columsPropes="${columslist}" queryCondits="${queryCondits}"  sortColum="name"  sortOrder="desc" width="99%" />
 
	</body>
</html>