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
		<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
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
			 initTree('menu1','code1',${areaString},'${user.area}');
			 //$("#code2").attr("value","${user.username}");
		 });
	            //提交的操作
				  function tj(id) {
						var url ="ajxx_tj.do?id="+id;
					    $.messager.confirm("\u63d0\u793a\u4fe1\u606f", "确定提交吗？", function (r) {
							if (r) {
								$.post(url, function (result) {
									if (result.success) {
										refreshGrid('dg');
										showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
									} else {
										showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
									}
								}, "json");
							}
						});
					}
				  	//Grid打印通用操作按钮
				function operate(value,row,index){
					var qx = '<s:property value='#request.qx'/>';
				    var html = "";
				    html += "<a href='#' onclick='chakan(\""+row.id+"\",\"0\")'>查看</a> ";
				   var cz="<s:property value='cz'/>";
				  // alert(cz);
				   if(cz=='1'){
				      html += "<a href='#' onclick='chakan(\""+row.id+"\",\"1\")'>修改</a> ";
				   }
				    
					return html;
				}
			   
			   
				function chakan(jbxxId,cz){
				
					window.parent.closeTab("社工信息");
					window.parent.addTab("社工信息","<%=contextPath%>/sgry/sgry_open.do?flag=view&id="+jbxxId+"&cz="+cz);
				}
				function add(){
					window.parent.closeTab("社工信息");
					window.parent.addTab("社工信息","<%=contextPath%>/sgry/sgry_open.do?flag=input&cz=1");
				}
				
				
				
				
		function dc(){
			 var row = $('#dg').datagrid('getSelections');
				if(row.length==0){
				    $.messager.alert('系统提示', '请选择一条信息','warning'); 
				}else{
					var array = new Array();
					for(var i = 0; i< row.length;i++){
						
						array.push(row[i].id);
						
					}
					$.messager.confirm('导出', '你确认要导出吗？', function(r){
						if (r){
							 $.ajax({  
								url :contextPath+'/sgry/sgry_dr.do',  
								dataType:'json',
								data : {   
									array:array
								},   
								type : 'POST',   
								success : function() {
								  $.messager.alert('系统提示', '导出成功','warning');
								  //$('#dg').datagrid('reload');
								}   
		                   }); 
						}
					  }); 
				}
		}
			//导出
function to_excel(){
var gridId="dg";
	var contextPath = $('#contextPath').val();
	var queryCondits=eval("_getQueryParam" + gridId + "()");
	$("#queryCondits").val(queryCondits);
	var url='${ctx}/sgry/to_excel.do';
	  $("form[id=dcform]").attr("action",url);
				  $("form[id=dcform]").submit();
} 
  	</script>
	<body>
		<div class="easyui-layout"  style="width: 100%; height: 100%;"
			fit="true">
			<div region="north" border="false"class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 65px; padding: 5px; background: #fafafa;">
					<input type="hidden" id="menuId" value="${menuId}" />
					<input type="hidden" id="code1" value="${menuId}" />
					<input type="hidden" id="code2" value="" />
					<form>
						<table width="90%" cellspacing="0" style="font-size: 12px;">
							<tr>
								<td align="right">所属社区:</td>
						    	<td><input id="menu1" type="text" readonly="readonly" value="" size="8" onClick="showMenu(this);"/></td>
                                <input type="hidden" name="code1" id="code1"/>
								<td align="right">姓名:</td>
								<td>
									<s:textfield name="xm" id ="xm" size="8"/>
								</td>
								<td align="right">证件号码:</td>
								<td>
									<s:textfield name="zjhm" id="zjhm" size="18"/>
								</td>
								<td align="right">文化程度:</td>
								<td>
									<s:select name = "whcd" id="whcd" list="#request.whcdList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
							
								<td  colspan="2">工资待变动名单<select   name="bd" id="bd"><option value="0">全部</option><option value="1"　　　　　　　　　　　　　　　　<s:if test='%{bd==1}'>  selected </s:if>　>是</option></select></td>
                            </tr>
                            <tr>
									<td align="right">政治面貌:</td>
								<td>
									<s:select name = "zzmm" id="zzmm" list="#request.zzmmList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
								<td align="right">人员来源:</td>
								<td>
									<s:select name = "ryly" id="ryly" list="#request.rylyList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
									<td align="right">社会工作资格证书获得情况:</td>
								<td>
									<s:select name = "zgzs" id="zgzs" list="#request.zgzsqkList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
								
								<td align="right">签订劳动合同情况:</td>
								<td>
									<s:select name = "ldhtqdqk" id="ldhtqdqk" list="#request.ldhtqdqkList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
							
								<td align="center" >
                            		<a id="btnEp" class="easyui-linkbutton"
										href="javascript:doQuery('dg')">查询</a>
                            	</td>
							</tr>
							
						</table>
					</form>
				</div>
			</div>
			<div region="center" class="gridback">
				<div id="dg" border=0 title="社工列表" pagination="true"
					toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
				</div>
			
			</div>
				
		</div>
		<div id="menuContent1"  
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
		</div>
		<s:set var="columslist"
			value="{
			    #{'field':'action','title':'操作','width':'120','align':'center','formatterFun':'operate'},
			    #{'field':'jd','title':'街道','sortable':'true','width':'80'},
			    #{'field':'sq','title':'社区','sortable':'true','width':'80'},
			    #{'field':'xm','title':'姓名','sortable':'true','width':'80'},  
			    #{'field':'zjhm','title':'证件号','sortable':'true','width':'140'},
			    #{'field':'whcd','title':'文化程度','sortable':'true','width':'100'},  
			    #{'field':'ryly','title':'人员来源','sortable':'true','width':'100'},  
			    #{'field':'dhhm','title':'联系电话','sortable':'true','width':'80'}, 
			    #{'field':'zw','title':'职务','sortable':'true','width':'150'},  
			    #{'field':'jsqsj','title':'上岗日期','sortable':'true','width':'80'}
 			}" />
		<s:set var="queryCondits"
			value="{
			    #{'field':'szsq', 'type':'string', 'logic':'like', 'value':'code1'},
			    #{'field':'xm', 'type':'string', 'logic':'like', 'value':'xm'},
				#{'field':'zjhm', 'type':'string', 'logic':'like', 'value':'zjhm'},
				#{'field':'gwdj', 'type':'string', 'logic':'=', 'value':'ryly'},
				#{'field':'ldhtqdqk', 'type':'string', 'logic':'=', 'value':'ldhtqdqk'},
				#{'field':'zgzs', 'type':'string', 'logic':'=', 'value':'zgzs'},
				#{'field':'zzmm', 'type':'string', 'logic':'=', 'value':'zzmm'},
				#{'field':'bd', 'type':'string', 'logic':'=', 'value':'bd'},
				#{'field':'ryly', 'type':'string', 'logic':'=', 'value':'ryly'}
				}" />
		<tags:gridTag gridId="dg" loadUrl="sgry_list.do?bd=${bd}" addButton="true" addButtonEven="add()" newaddButton="false" excelButton="true"  excelButtonEven="to_excel()" toolbar="true" singleSelect="true"  
		winheight="350" winwidth="700" columsPropes="${columslist}"
			queryCondits="${queryCondits}" sortColum="jsqsj" sortOrder="desc" width="99%" />
	 <form id="dcform"><input type="hidden" name="queryCondits" id="queryCondits"/></form>
  
	</body>
</html>