<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="zt" value="${zt}" />
<html>
	<head>
		<title>工资变动</title>
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
	<%String menuString1 = (String)request.getAttribute("areaString"); %>

	<script type="text/javascript"> 


	var cz = '${cz}';
	$(function(){
     //openclxx();
		initTree('menu1','code1',${areaString},'${user.area}');
		
	});
	function operate(value,row,index){
	var qx = '${qx}';
				   var html = "";
				   var spzt="<s:property value='zt'/>";
				 //  html += "<a href='#' onclick='doAjaxTitleOpen(\"dg\",\"${ctx}/xssxd/xssxd_open.do\",\""+row.id+"\", \"\",800,400,\"add\",\"等级工资设置\")'>修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/xssxd/xssxd_del.do\",\""+row.id+"\", \"\")'>删除</a>"; 
			
				 if((spzt!=null && spzt=="00" )) {
				    if(row.zt=="00" && qx==1){
					   html += "<a href='#' onclick='edit(\""+row.id+"\",\"look\")'>查看</a> <a href='#' onclick='edit(\""+row.id+"\",\"edit\")'>上报/修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/gzbd/gzbd_del.do\",\""+row.id+"\", \"\")'>删除</a>";  
					  }else {
					       html += "<a href='#' onclick='edit(\""+row.id+"\",\"look\")'>查看</a>";  
					  }
				   }else if(spzt!=null && spzt=="01"){
				      if(row.zt=="01" && qx==1){
					     html += "<a href='#' onclick='edit(\""+row.id+"\",\"look\")'>查看</a> <a href='#' onclick='edit(\""+row.id+"\",\"sp\")'>审批</a>";
					  }else{
					    html += "<a href='#' onclick='edit(\""+row.id+"\",\"look\")'>查看</a>";  
					  }
				   }else{
				     html += "<a href='#' onclick='edit(\""+row.id+"\",\"look\")'>查看</a>"
				   }
				    return html;
					
				}
	function edit(id,bz){
	 window.parent.addTab("工资变动申请表","${ctx}/gzbd/gzbd_open.do?pid=${pid}&id="+id+"&cz="+cz+"&bz="+bz,"","");
	// window.parent.closeTab("社工工资变动申请");
	 
	}

  	</script>
	<body>
	<div class="easyui-layout" style="width: 100%; height: 100%;" fit="true">
		<s:if test="%{cz<4}">
		<div region="north" border="false" class="demo-info">
			<div id="search" title="查询选项" icon="icon-search"
				style="overflow: hidden; height: 65px; padding: 5px; background: #fafafa;">

			<form method="post">
			<input type="hidden" id="m" name="m"/>
           
			<input type="hidden" name="code1" id="code1"/>
			<table width="80%" cellspacing="0" style="font-size:12px;">
			<tr>
				<td align="right">所属地区：</td>
				<td><input id="menu1" type="text" value=""  size="8" onClick="showMenu(this);" readonly="readonly"/></td>	
				<td align="right">姓名：</td>
				<td><input id="xm" type="text" value=""  size="8"/></td>
				<td align="right">证件号码：</td>
				<td><input id="zjhm" type="text" value=""  size="18" ></td>
			</tr>
			<tr>
				<td align="right">上报日期：</td>
				<td> <s:textfield name="sbrqq" id="sbrqq" cssClass="text" size="8" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/>至<s:textfield name="sbrqz" id="sbrqz" cssClass="text" size="8" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/></td>
				<td align="right">审核日期：</td>
				<td><s:textfield name="shrqq" id="shrqq" cssClass="text" size="8" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/>至<s:textfield name="shrqz" id="shrqz" cssClass="text" size="8" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/></td>
				<td align="right">状态：</td>
				<td><s:select name="zt" id="zt" cssClass="text" list="#request.spzt" listKey="code" listValue="name"  headerKey="" headerValue="全部" /></td>
				<td>
					<a id="btnEp" class="easyui-linkbutton" href="javascript:doQuery('dg')">查询</a>
				</td>
			</tr>

	</table>
			</form>
			</div>
		</div>
				</s:if>

		<div region="center" class="gridback">
			<div id="dg"  border=0 pagination="true" title="社工工资变动列表"
				toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
			</div>
		</div>
		</div>
		<s:set var="frozencolumslist"
			value="{
			     #{'field':'action','title':'操作','width':'120','align':'center','formatterFun':'operate',rowspan:'2'},
			    #{'field':'jd','title':'街道','sortable':'true','width':'60',rowspan:'2'},
			    #{'field':'sq','title':'社区','sortable':'true','width':'60',rowspan:'2'}
 			}" />
	<s:set var="columslist"
			value="{
				#{'field':'id','title':'id','sortable':'true', 'hide':'true'},
				#{'field':'zt','title':'zt','sortable':'true', 'hide':'true'},
				#{'field':'xm','title':'姓名','sortable':'true','width':'70'},
				#{'field':'zjhm','title':'证件号码','sortable':'true','width':'130'},
				#{'field':'zw','title':'职务','sortable':'true','width':'80'},
				#{'field':'yzwdjgz','title':'原职务等级工资','width':100},  
				#{'field':'ygwgz','title':'原岗位工资','width':80},  
				#{'field':'ydqjt','title':'原地区津贴','width':80},  
				#{'field':'yzyzgjt','title':'原职业资格津贴','width':100},  
				#{'field':'xzydjgz','title':'现职务等工资','width':80},  
				#{'field':'xgwgz','title':'现岗位工资','width':80},  
				#{'field':'xdqjt','title':'现地区津贴','width':80},  
				#{'field':'xzyzgjt','title':'现职业资格津贴','width':100},
				#{'field':'jsqsj','title':'上岗时间','sortable':'true','width':'70'},
				#{'field':'sbr','title':'上报人','sortable':'true','width':'70'},
				#{'field':'sbrq','title':'上报日期','sortable':'true','width':'70'},
				#{'field':'qshr','title':'区审核人','sortable':'true','width':'70'},
				#{'field':'qshrq','title':'区审核日期','sortable':'true','width':'70'},
				#{'field':'spzt','title':'状态','sortable':'true','width':'50'}
				}" />
	<s:set var="queryCondits"
			value="{
			    #{'field':'sssq', 'type':'string', 'logic':'like', 'value':'code1'},
			    #{'field':'sgry.xm', 'type':'string', 'logic':'like', 'value':'xm'},
				#{'field':'sgry.zjhm', 'type':'string', 'logic':'like', 'value':'zjhm'},
				#{'field':'spb.tjrq', 'type':'string', 'logic':'>=', 'value':'sbrqq'},
				#{'field':'spb.tjrq', 'type':'string', 'logic':'<=', 'value':'sbrqz'},
				#{'field':'spb.qsprq', 'type':'string', 'logic':'>=', 'value':'shrqq'},
				#{'field':'spb.qsprq', 'type':'string', 'logic':'<=', 'value':'shrqq'},
				#{'field':'zt', 'type':'string', 'logic':'=', 'value':'zt'}
				
				}" />
<s:if test='%{cz==0 && qx==1}'>
	<tags:gridTag gridId="dg" loadUrl="${ctx}/gzbd/gzbd_list.do?zt=${zt}&cz=${cz}&ryid=${ryid}" addUrl="${ctx}/gzbd/gzbd_open.do?pid=${pid}&zt=${zt}&cz=${cz}&bz=sq&qx=${qx}" addArg="" addTitle="申请工资变动" addWin="add" newTitle="工资变动申请表" columsPropes="${columslist}" newaddButton="true"   addButton="false" sortColum="zt,czrq"  sortOrder="" width="99%" frozenColumsPropes="${frozencolumslist}" queryCondits="${queryCondits}" singleSelect="true" />
</s:if>
<s:else>
	<tags:gridTag gridId="dg" loadUrl="${ctx}/gzbd/gzbd_list.do?zt=${zt}&cz=${cz}&ryid=${ryid}"  columsPropes="${columslist}" newaddButton="false"   addButton="false" sortColum="zt,czrq"  sortOrder="" width="99%" frozenColumsPropes="${frozencolumslist}" queryCondits="${queryCondits}"  singleSelect="true" toolbar="false" />	
</s:else>

 	<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
		<ul id="menutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
	</div>  
	<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
		<ul id="menutree1" class="ztree" style="margin-top:0; width:200px; height: 300px;"></ul>
 	</div>  
	
	</body>
</html>