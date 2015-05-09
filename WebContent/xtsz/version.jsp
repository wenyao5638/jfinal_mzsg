<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>版本信息</title>
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
		singleSelect:true,
		nowrap: false,
		striped: true,
		pagination:true,
		loadMsg : '数据装载中......', 
		fit: true,
		url:'<%=contextPath%>/login/versionList.do',
		sortName: 'id',
		sortOrder: 'desc',
		idField:'id',
		columns:[[
			{field:'ver',title:'版本日期',width:100,align:'center'},
		    {field:'xgnr',title:'变更内容',width:200},
		    {field:'bz',title:'备注',width:200}
			]],
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

</script>

</head>
<body class="easyui-layout" >
<div data-options="region:'north'" style="overflow:hidden;">
	<table width="98%" cellpadding=0>
		<tr>
        <td width="100%" align="left" height="20" colspan="4" class=box_td> 
        <font size="4.5">
       <strong>软件名称：</strong>
       	海曙区再生育审批管理平台
       <p> 
        <strong>当前版本：</strong>
        	2014-03-18
		<p> 
        <strong>最新版本：</strong>
        	<s:property value="#request.ver"/>
        <p> 
        <strong>研发单位：</strong>
        	海曙区人口和计划生育局&宁波市思坦达软件
        </font>
        </td>
     </tr>
	</table>
</div>

<div data-options="region:'center',title:'历史记录'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
</div>

</body>
</html>