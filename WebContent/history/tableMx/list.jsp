<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
	<head>
		<title>列表</title>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/js/themes/gray/easyui.css" />
		<link rel="stylesheet" type="text/css"
			href="${ctx}/js/themes/icon.css" />
    	<link rel="stylesheet" type="text/css" href="${ctx}/css/demo.css" />
     	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyUI.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyui-lang-zh_CN.js"></script>
	 
	</head>
 
	<script type="text/javascript">
 
	          	  	//Grid打印通用操作按钮
				function operate(value,row,index){
				    var zt=row.zt;
				    var html = "";
				    html += "<a href='#' onclick='doAjaxOpen(\"dg\",\"tableMx_open.do\",\""+row.id+"\", \"\",400,230,\"\")'>修改</a> ";
		            html += "<a href='#' onclick='doAjaxDel(\"dg\",\"tableMx_del.do\",\""+row.id+"\", \"\")'>删除</a> ";
				  
					return html;
				}
				   //显示类表名
			   function operateLm(value,row,index){
			          return row.xtszTable.lm;
			    }
  	</script>
	<body>
		<div class="easyui-layout" style="width: 100%; height: 100%;"
			fit="true">
			<div region="north" border="false" class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 35px; padding: 5px; background: #fafafa;">
					<input type="hidden" id="menuId" value="${menuId}" />
					<form>
						<table cellspacing="0" width="90%" style="font-size: 12px;">
							<tr>
								<td align="right"> 类名:</td>
								<td><s:select key="lm" list="#request.tlist" listKey="id"
									listValue="lm" headerKey="" headerValue="==请选择==" /></td>
								<td>
									<a id="btnEp" class="easyui-linkbutton"
										href="javascript:doQuery('dg')">查询</a>
								</td>
							</tr>
				       </table>
					</form>
				</div>
			</div>
			<div region="center" class="gridback">
				<div id="dg" border=0 title="列表" pagination="true"
					toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
				</div>
			</div>
		</div>
		    <div id="menuContent1" class="menuContent"
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
		</div>
		<s:set var="columslist"
			value="{
			     #{'field':'action','title':'操作','width':'150','align':'center','formatterFun':'operate'},
				#{'field':'lm','title':'类名','sortable':'true','width':'100','formatterFun' :'operateLm'}, 
				#{'field':'zdmc','title':'字段名称','sortable':'true','width':'100'},
				#{'field':'zdzwm','title':'字段中文名','sortable':'true','width':'100'}
		       
				 
 			}" />
		<s:set var="queryCondits"
			value="{
		        #{'field':'xtszTable.id', 'type':'string', 'logic':'=', 'value':'lm'}
				}" />

		<tags:gridTag gridId="dg" loadUrl="tableMx_list.do" addUrl="tableMx_open.do"
			winheight="230" winwidth="400" columsPropes="${columslist}"
			queryCondits="${queryCondits}" sortColum="zdmc" sortOrder="desc"
			width="99%" />
	 
	</body>
</html>