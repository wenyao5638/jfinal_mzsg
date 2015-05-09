<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>再生育审批——再生育证作废</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>

<script>
$(function(){
	$('#tt2').datagrid({
		iconCls:'icon-save',
		width:200,
		height:200,
		nowrap: false,
		striped: true,
		pagination:true,
		loadMsg : '数据装载中......', 
		fit: true,
		url:'<%=contextPath%>/dxwh/dxwh_jsdx_editList.do?jsdx=<s:property value="#request.jsdx"/>',
		sortName: 'id',
		sortOrder: 'desc',
		idField:'id',
		frozenColumns:[[
			{field:'id',checkbox:true}
		]],
		columns:[[
			{field:'usercnname',title:'短信接收人',width:120},
			{field:'phone',title:'移动电话',width:100},
			{field:'tjrcnname',title:'添加人',width:120},
			{field:'opt',title:'操作',width:80,align:'center'}
		]],
		toolbar:[{
			text:'刷新',
			iconCls:'icon-reload',
			handler:function(){
				 $('#tt2').datagrid('reload');
			}
		},'-',{
			text:'删除',
			iconCls:'icon-remove',
			handler:function(){
				dxwh_jsdx_delete()
			}
		}],
		rownumbers:true
	});
	displayMsg();  
});
function displayMsg() {  
	$('#tt2').datagrid('getPager').pagination({  
		pageSize: 18,//每页显示的记录条数，默认为10   
		pageList: [18,20,30,50],//可以设置每页记录条数的列表   
		beforePageText: '第',//页数文本框前显示的汉字   
		afterPageText: '页    共 {pages} 页',  
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
	});
}

function search(){
	var jsdx = "jsdx=<s:property value='#request.jsdx'/>";
	var usercnname = $('#usercnname').val();
	$('#tt2').datagrid({
		queryParams: {"usercnname":usercnname,"jsdx":jsdx}
	});
	displayMsg();  
}

function dxwh_jsdx_delete(){
	var ids = "";
	var row = $('#tt2').datagrid('getSelections');
	if(row.length>0){
		for(var i=0;i<row.length;i++){
			ids+=row[i].id+",";
		} 
		$.messager.confirm('删除', '你确认要删除所选择的短信接收对象?', function(r){
			if(r){
				$.ajax({
					url : '<%=contextPath%>/dxwh/dxwh_jsdx_delete.do',
					data:{ids : ids},  
					type : 'POST',
					error: function(){
						$.messager.alert('提示', '系统忙，请稍后再试！'); 
			    	},
					success : function() {
						$('#tt2').datagrid('reload');
						$('#tt2').datagrid('clearSelections');
						parent.$('#tt2').datagrid('reload');
					}
				})
			}
		})
	}else{
		$.messager.alert('提示', '请选择一条记录操作!'); 
			return;
	}
}
</script>

</head>
<body class="easyui-layout" >
<div data-options="region:'north'" style="overflow:hidden;">
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<table width="98%" cellpadding=0>
<tr>
	<td align="right" height="28">接收对象:</td>
	<td>
		<s:textfield name="usercnname" id="usercnname" cssClass="text"  size="10"/>
	</td>
	<td>
		<a id="btnEp" class="easyui-linkbutton" icon="icon-search" href="javascript:search()">查询</a>
	</td>
	<td></td>
</tr>
</table>

</div>

<div data-options="region:'center',title:'记录'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
</div>

</body>
</html>