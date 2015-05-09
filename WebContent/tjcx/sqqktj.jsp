<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="edge" />
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
	     opendbtj();
			 var contextPath = $('#contextPath').val();
			$('#tt2').datagrid({
				iconCls:'icon-save',
				width:800,
				height:400,
				singleSelect:false,
				nowrap: false,
				striped: true,
				pagination:true,
				loadMsg : '数据装载中......', 
				fit: true,
				url:'<%=contextPath%>/tjcx/sqqk.do',

				frozenColumns:[[
					     {field:'jd',title:'街道',width:80},
					     {field:'sq',title:'社区名称',width:80}					 
						]],
				columns:[[
						{field:'zxrzhs',title:'入住户数',width:80},  
				        {field:'ydrs',title:'按250:1配注社工户数',width:150},  
				        {field:'pzrs',title:'目前配注社工人数',width:100},  
				        {field:'kyrs',title:'根据目前入住户数还可以配注社工人数',width:120}
				      
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
						rownumbers:false
					});
				    displayMsg();  
	});
				
		function displayMsg() {  
				$('#tt2').datagrid('getPager').pagination({  
					 pageSize: 800,//每页显示的记录条数，默认为10   
					 pageList: [10,20,30,50,100,800],//可以设置每页记录条数的列表   
					 beforePageText: '第',//页数文本框前显示的汉字   
					 afterPageText: '页    共 {pages} 页',  
					 displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
		   });  
	   }
	
function search(){
	var sssq=$("#code1").val();
	
	$('#tt2').datagrid({
		queryParams: {"area":sssq}
	});
	displayMsg();  
}

function opendbtj() {
	//alert("test");
	$('#wplz').window( {
		title : '涉案物品入录',
		width : 750,
		modal : true,
		shadow : true,
		closed : true,
		height : 400,
		top:($(window).height() - 320) * 0.5,   
        left:($(window).width() - 600) * 0.5,
		resizable : false
	});
}
//导出
function to_excel(){
	var contextPath = $('#contextPath').val();
	var url=contextPath+'/tjcx/Sqqk_excel.do';
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
<table width="98%" cellpadding=0>
	<tr>
		<td>街道社区：</td>
		<td><input id="menu1" type="text" value="" style="width:130px;" onClick="showMenu(this);"/></td>
		<td><a id="btnEp" class="easyui-linkbutton" href="javascript:search()">查询</a></td>
	</tr>
</table>

</div>
	<div data-options="region:'center',title:'街道社工配注情况表'" style="background:#fafafa; padding:0px;overflow:hidden">
		<table id="tt2" bgcolor="#FFFFFF" ></table>
	</div>
	
	<div id="wplz" class="easyui-window" title="导出ＥＸＣＥＬ"
     data-options="modal:true" minimizable="false"
        maximizable="false"  style=" padding:10px;background: #fafafa; overflow:hidden" >  
        <iframe src="" overflow:visible height="380" width="650" id="wplziframe" frameborder=no></iframe>
     </div>
   
 
	</body>
</html>