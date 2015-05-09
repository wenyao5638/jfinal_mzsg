<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%String contextPath = request.getContextPath();%>	
<html>
	<head>
		<title>社工管理</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/gray/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/css/public.css" />
	    <link rel="stylesheet" type="text/css" href="${ctx}/css/demo.css" />
		<link rel="stylesheet" href="${ctx}/interface/css/zTreeStyle.css" type="text/css" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyUI.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
		<script type="text/javascript" src="${ctx}/js/menutree.js"></script>
		<script type="text/javascript" src="${ctx}/js/photoTag.js"></script>
		<script type="text/javascript" src="${ctx}/js/UUID.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="${ctx}/js/JqueryTree.js"></script>
		
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
 
		 $(function(){
			 initTree('menu2','code2',${areaString},'${user.area}');
		 });
	 function xz(dg,name){
		var m="<s:property value='%{#request.m}'/>";
		
		var rows= $('#sg').datagrid('getSelections');  
		if(rows.length>1){
	   		$.messager.alert('系统提示', '请选择一条数据','warning'); 
	 	}else{
	 		for(var i=0;i<rows.length;i++){
				window.parent.frames[m].data(rows[i]);
			}
			
				closeDialog('jDialogContainer');
				
	  	}
	}
			 
  	</script>
	<body>
	
		<div class="easyui-layout"  style="width: 100%; height: 100%;"
			fit="true">
			<div region="north" border="false"class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 30px; background: #fafafa;">
				
				
					<form>
						<table cellspacing="0" style="font-size: 12px;" width="90%">
							<tr>
								<td align="right">所属社区:</td>
					    	    <td><input id="menu2" type="text" readonly="readonly" value="" style="width:120px;" onClick="showMenu(this);"/></td>
                                <input type="hidden" name="code2" id="code2"/>
								<td align="right">姓名:</td>
								<td>
									<s:textfield name="xms" id ="xms" size="10"/>
							    </td>
								<td align="right">证件号码:</td>
								<td>
									<s:textfield name="zjhms" id="zjhms" size="12"/>
							    </td>
								<td>工资待变动名单<select   name="bd" id="bd"><option value="0">全部</option><option value="1"　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　<s:if test='%{bd==1}'>  selected </s:if>　>是</option></select></td>
								<td align="center">
                            		<a id="btnEp" class="easyui-linkbutton"
										href="javascript:doQuery('sg')">查询</a>
                            	</td>
							</tr>
							
						</table>
					</form>
						<div id="menuContent2"  
			style="display: none; position: absolute;">
			<ul id="menutree2" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
		</div>
				</div>
			
			</div>
			<div region="center" class="gridback">
				<div id="sg" border=0 title="社工列表" pagination="true"
					toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
				</div>
			
			</div>
			<div region="south" border="false" class="demo-info" align="right"> 

		<a id="" class="l-btn" href="#" onClick="xz(this.form,'jDialogContainer')"> <span class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">确认</span> </span> </a>
		<a class="l-btn" href="#"
			onclick="closeDialog('jDialogContainer')"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">取消</span> </span> </a>
		
	</div>
		</div>
		
		<s:set var="columslist"
			value="{
				#{'field':'id','title':'id','sortable':'true', 'hide':'true'},
			
				#{'field':'jd','title':'街道','sortable':'true','width':'60' },
			    #{'field':'sq','title':'所属社区','sortable':'true','width':'80'},
				#{'field':'xm','title':'姓名','sortable':'true','width':'80'},
				#{'field':'xb','title':'性别','sortable':'true','width':'50'},
				#{'field':'zjhm','title':'证件号码','sortable':'true','width':'140'},
				#{'field':'zw','title':'职务','sortable':'true','width':'100'},	
				#{'field':'cjgzsj','title':'参加工作时间','sortable':'true','width':'100'},
				#{'field':'jsqsj','title':'上岗时间','sortable':'true','width':'100'}
				}" />
	
		<s:set var="queryCondits"
			value="{
			    #{'field':'szsq', 'type':'string', 'logic':'like', 'value':'code2'},
			    #{'field':'xm', 'type':'string', 'logic':'like', 'value':'xms'},
				#{'field':'zjhm', 'type':'string', 'logic':'like', 'value':'zjhms'},
				#{'field':'bd', 'type':'string', 'logic':'=', 'value':'bd'}
				}" />
<tags:gridTag gridId="sg" loadUrl="${ctx}/sgry/sgry_dialog_dialog.do?bd=${bd}" columsPropes="${columslist}"  queryCondits="${queryCondits}"  newaddButton="false"   addButton="false" sortColum="jsqsj"  checkbox="false" sortOrder="desc" width="99%"  singleSelect="false" toolbar="false"/>
		
		
	</body>
</html>