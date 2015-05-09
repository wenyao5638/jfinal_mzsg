<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
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
				url:'<%=contextPath%>/code/spryList.do',
				
				columns:[[
				    {field:'bj',title:'操作',width:100,align:'center'},
					{field:'swxh',title:'序号',width:50},
					{field:'name',title:'审批类型',width:200},
					{field:'bz',title:'备注',width:200}					
					]],
				toolbar:[{
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
	var code = $('#code').val();
	$('#tt2').datagrid({
		queryParams: {"search.code": code}
	});
	displayMsg();  
}

function edit(id){
	parent.addTab("审批流程-人员管理","<%=contextPath%>/code/rygledit.do?id="+id,"","splc_rygl");
}
</script>
</head>
<body class="easyui-layout" >
<div data-options="region:'north'" style="overflow:hidden; padding:5px;">
<table width="90%" cellpadding=0>
	<tr>
		<td align="right">审批类型:</td>
    	<td>
    		<s:select name="code" id="code" list="#request.splxList" listKey="code" listValue="name" headerKey="" headerValue="==审批类型=="></s:select>
    	</td>
   	    <td><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()">查询</a></td>
	</tr>
</table>
</div>
		<div data-options="region:'center',title:'审批人员管理'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
   
	</body>
</html>