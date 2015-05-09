<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree.js"></script>

<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>

 <script>
 $(function(){
	//地区
	     initTree('menu1','code1',${areaString},'${user.area}');
		 var contextPath = $('#contextPath').val();
		 //var row = $('#tt2').datagrid('getSelections');
		 //var id=row[i].id;
		 //alert("id:"+id);
		 
			$('#tt2').datagrid({
				iconCls:'icon-save',
				width:200,
				height:200,
				singleSelect:true,
				nowrap: false,
				striped: true,
				pagination:true,
				loadMsg : '数据装载中......', 
				fit: true,
				url:'<%=contextPath%>/tjcx/gzbdtjList.do',

				frozenColumns:[[
					     {field:'xm',title:'姓名',width:80,rowspan:2},
					     {field:'zw',title:'职务(岗位)',width:80,rowspan:2}
						]],
				columns:[
				     
						[{title:'变动前工资',colspan:4},  
				        {title:'变动后工资',colspan:4}, 
				        {field:'yzze',title:'月增资额',width:80,colspan:1,rowspan:2},  
				        {field:'xzyzgjtrq',title:'执行时间',width:80,colspan:1,rowspan:2},
				        {field:'bz',title:'备注',colspan:1,rowspan:2}], 
						 
				       [{field:'yzwdjgz',title:'职务等级工资',width:80,rowspan:1},  
				        {field:'ygwgz',title:'岗位工资',width:80,rowspan:1},  
				        {field:'ydqjt',title:'地区津贴',width:80,rowspan:1},  
				        {field:'yzyzgjt',title:'职业资格津贴',width:80,rowspan:1},  
				        {field:'xzydjgz',title:'职务等级工资',width:80,rowspan:1},  
				        {field:'xgwgz',title:'岗位工资',width:80,rowspan:1},  
				        {field:'xdqjt',title:'地区津贴',width:80,rowspan:1},  
				        {field:'xzyzgjt',title:'职业资格津贴',width:80,rowspan:1}
				      
				       ]],
						toolbar:[{
							text:'导出',
							iconCls:'icon-xls',
							handler:function(){
								to_excel();
							}
						},'-',{
							text:'刷新',
							iconCls:'icon-reload',
							handler:function(){
								 $('#tt2').datagrid('reload');
							}
						}
						],
						rownumbers:true
					});
				    displayMsg();  
	});
				
		function displayMsg() {  
				$('#tt2').datagrid('getPager').pagination({  
					 pageSize: 10,//每页显示的记录条数，默认为10   
					 pageList: [10,20,30,50],//可以设置每页记录条数的列表   
					 beforePageText: '第',//页数文本框前显示的汉字   
					 afterPageText: '页    共 {pages} 页',  
					 displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
		   });  
	   }
	
function search(){
	var sssq=$("#code1").val();
	var zxsjq = $('#zxsjq').val();
	var zxsjz = $('#zxsjz').val();
	var xm = $('#xm').val();
	var zw = $('#zw').val();
	if(zxsjq=="" && zxsjz==""){
	   $.messager.alert("系统提示", "请选择执行日期", "error");
	}else{
		$('#tt2').datagrid({
			queryParams: {"search.sssq":sssq,"search.zxsjq":zxsjq,"search.zxsjz":zxsjz,"search.xm":xm,"search.zw":zw}
		});
		displayMsg();  
	}
	
}


//导出
function to_excel(){
	var contextPath = $('#contextPath').val();
	var url=contextPath+'/tjcx/Gzbdtj_excel.do';
	$("#wplziframe").attr("src",url);
}
function closewplz(){
	 $('#wplz').dialog('close');
}

</script>
</head>
<body class="easyui-layout" >
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<div data-options="region:'north'" style="overflow:hidden; padding:5px;">
<input type="hidden" name="code1" id="code1"/>
<input type="hidden" name="id" id="id" value=""/>
<table width="90%" cellpadding=0>
	<tr>
		<td align="right">街道社区：</td>
		<td><input id="menu1" type="text" value="" size="8" onClick="showMenu(this);"/></td>
		<td align="right">执行时间：</td>
	    <td><s:textfield id="zxsjq" name="zxsjq" cssClass="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"/>至&nbsp;<s:textfield id="zxsjz" name="zxsjz" cssClass="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"/></td>
		<td align="right">姓名：</td>
		<td><s:textfield id="xm" name="xm" size="8"/></td>
		<td align="right">职务：</td>
		<td><s:textfield id="zw" name="zw" size="8"/></td>
		<td align="right"><a id="btnEp" class="easyui-linkbutton" href="javascript:search()">查询</a></td>
	</tr>
</table>

</div>
	<div data-options="region:'center',title:'社工工资变动统计'" style="background:#fafafa; padding:0px;overflow:hidden">
		<table id="tt2" bgcolor="#FFFFFF" ></table>
	</div>
		
  <div id="wplz" class="easyui-window" title="导出ＥＸＣＥＬ"
     data-options="modal:true" minimizable="false"
        maximizable="false"  style=" padding:10px;background: #fafafa; overflow:hidden" >  
        <iframe src="" overflow:visible height="380" width="650" id="wplziframe" frameborder=no></iframe>
     </div>
 
	</body>
</html>