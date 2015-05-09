<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%String contextPath = request.getContextPath();%>	
<html>
	<head>
		<title>社工变动统计</title>
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
			 	//$("#code2").attr("value","${user.username}");;
				
				 var contextPath = $('#contextPath').val();
						$('#dg').datagrid({
							iconCls:'icon-save',
							width:200,
							height:200,
							singleSelect:false,
							nowrap: false,
							striped: true,
							pagination:true,
							loadMsg : '数据装载中......', 
							fit: true,
							url:'<%=contextPath%>/tjcx/sgdd_list.do',
							frozenColumns:[[
								             { title: '街道（镇乡）', field: 'jd', width: 100},
								             { title: '社区名称', field: 'sq', width:100},
								             { title: '现入住户数<br/>(实际管辖户数)', field: 'rzhs', width: 100} 
											]],
							columns:[
							         [{"title":"12月底在册社区专职工作者","colspan":2},  
							          {"title":"社区专职工作者变化情况","colspan":4}],
							          //{"field":"bz","title":"备注","rowspan":2}  
							         [{"field":"zzsgsl","title":"人数",width:30,"rowspan":1},  
							          {"field":"zzsgxm","title":"姓名",width:200,"rowspan":1},  
							          {"field":"xzsgsl","title":"人数",width:30,"rowspan":1},  
							          {"field":"xzsgxmsj","title":"新增人员名单及上岗月份",width:200,"rowspan":1},  
							          {"field":"jcsgsl","title":"人数",width:30,"rowspan":1},  
							          {"field":"jcsgxmsj","title":"减少人员名单及离岗月份",width:200,"rowspan":1}
							         ]],
							toolbar:[{
								text:'导出Excel',
								iconCls:'icon-xls',
								handler:function(){
								to_excel();
								}
							},'-',{
								text:'刷新',
								iconCls:'icon-reload',
								handler:function(){
									 $('#dg').datagrid('reload');
								}
							}
							],
							rownumbers:true
						});
					    displayMsg();  
					});
					function displayMsg() {  
							$('#dg').datagrid('getPager').pagination({  
								 pageSize: 10,//每页显示的记录条数，默认为10   
								 pageList: [10,20,30,50],//可以设置每页记录条数的列表   
								 beforePageText: '第',//页数文本框前显示的汉字   
								 afterPageText: '页    共 {pages} 页',  
								 displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
			 
					   });  
				   }
					
					function search(){
						var nf = $('#nf').val();
						if(nf=="0"){
						  $.messager.alert("系统提示", "请选择变动年份", "error");
						}else{
							var area = $('#code1').val();
							$('#dg').datagrid({
								queryParams: {"search.nf": nf,"search.area":area}
							});
							displayMsg();  
						}
					}

				
					//导出
					function to_excel(){
						var contextPath = $('#contextPath').val();
						var url=contextPath+'/tjcx/Sgddtj_excel.do';
						$("#wplziframe").attr("src",url);
					}
					function closewplz(){
						 $('#wplz').dialog('close');
					}
					
			 
  	</script>
	<body>
		<div class="easyui-layout"  style="width: 100%; height: 100%;"
			fit="true">
			<div region="north" border="false"class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 35px; padding: 5px; background: #fafafa;">
					<input type="hidden" id="menuId" value="${menuId}" />
					<input type="hidden" id="code1" value="${menuId}" />
					<input type="hidden" id="code2" value="" />
					<form>
						<table width="90%" cellspacing="0" style="font-size: 12px;">
							<tr>
								<td align="right">所属街道/社区:</td>
						    	<td><input id="menu1" type="text" readonly="readonly" value="" style="width:100px;" onClick="showMenu(this);"/></td>
								<td align="right">变动年份:</td>
								<td>
									<select name="nf" id="nf">
										<option value="0">===请选择年份===</option>
										<s:iterator value="#request.nfList" id = "emt">
											<option value='<s:property value="#emt.code" />'><s:property value="#emt.name" /></option>
										</s:iterator>
									</select>
								</td>
                            	<td align="center" colspan="4">
                            		<a id="btnEp" class="easyui-linkbutton"
										href="javascript:search()">查询</a>
                            	</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div region="center" class="gridback">
				<div id="dg" border=0 pagination="true"
					toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
				</div>
			
			</div>
		</div>
		<div id="menuContent1"  
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
		</div>

 	

		
	</body>
</html>