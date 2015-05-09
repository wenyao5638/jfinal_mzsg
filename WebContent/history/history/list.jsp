<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
	<head>
		<title>列表</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/gray/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css" />
    	<link rel="stylesheet" type="text/css" href="${ctx}/css/demo.css" />
     	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyUI.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyui-lang-zh_CN.js"></script>
	 	<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
	</head>
 
	<body>
		<div class="easyui-layout" style="width: 100%; height: 100%;"
			fit="true">
			<div region="north" border="false" class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 35px; padding: 5px; background: #fafafa;">
					<input type="hidden" id="menuId" value="${menuId}" />
					<form>
						<table width="90%" cellspacing="0" style="font-size: 12px;">
							<tr>
								<td align="right">表名称:</td>
								<td><input type="text" id="table" /></td>
								<td align="right">操作时间:</td>
								<td><s:textfield name="qsrq" cssStyle="Wdate" readonly="true"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  size="10" />
									至
									<s:textfield name="jsrq" cssStyle="Wdate" readonly="true"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  size="10" />
								</td>
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
				<div id="dg" border=0 title="历史记录列表" pagination="true"
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
				
				#{'field':'ht_table','title':'表格名称','sortable':'true','width':'100'},
			 	#{'field':'ht_col','title':'字段名称','sortable':'true','width':'100'},
				#{'field':'ht_prikey','title':'记录主键值','sortable':'true','width':'200'},
				#{'field':'ht_type','title':'操作类型','sortable':'true','width':'100'},
			    #{'field':'ht_oldvalue','title':'修改前','sortable':'true','width':'100'},
			    #{'field':'ht_newvalue','title':'修改后','sortable':'true','width':'100'},
				#{'field':'ht_date','title':'操作时间','sortable':'true','width':'150','formatterFun' :'rendererDateTime'},
				#{'field':'ht_user','title':'操作人','sortable':'true','width':'100'}
		 		 
 			}" />
		<s:set var="queryCondits"
			value="{
		        #{'field':'ht_table', 'type':'string', 'logic':'like', 'value':'table'},
		        #{'field':'ht_date', 'type':'date', 'logic':'>=', 'value':'qsrq'},
				#{'field':'ht_date', 'type':'date', 'logic':'<=', 'value':'jsrq'}
				}" />

		<tags:gridTag gridId="dg" loadUrl="history_list.do" addUrl="history_open.do" addButton="false" toolbar="false"
			winheight="230" winwidth="400" columsPropes="${columslist}"
			queryCondits="${queryCondits}" sortColum="ht_date" sortOrder="desc"
			width="99%" />
	 
	</body>
</html>