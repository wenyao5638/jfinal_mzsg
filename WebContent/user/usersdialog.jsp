<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/user/js/user.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
    
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>
<%String menuString1 = (String)request.getAttribute("areaString"); %>
<%String menuString2 = (String)request.getAttribute("roleString"); %>
<script>
var zNodesmenu1 =<%=menuString1%>;
var zNodesmenu2 =<%=menuString2%>;
var menusetting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick,
				onCheck: onCheck
			}
		};
		
  var code="<s:property value='%{user.area}'/>";
  
$(function(){
//地区
	$.fn.zTree.init($("#menutree1"), menusetting, zNodesmenu1);
//角色	
	$.fn.zTree.init($("#menutree3"), menusetting, zNodesmenu2);

	var zTree = $.fn.zTree.getZTreeObj("menutree1"),
	node = zTree.getNodeByParam("id","<s:property value='#request.userarea'/>",null);
	zTree.selectNode(node);
	var cityObj = $("#menu1");
	cityObj.attr("value", node.name);
	
	var contextPath = $('#contextPath').val();
			$('#tt2').datagrid({
				iconCls:'icon-save',
				width:200,
				height:200,
				nowrap: false,
				striped: true,
				pagination:true,
				loadMsg : '数据装载中......', 
				fit: true,
				url:'<%=contextPath%>/user/usersDialog.do',
				sortName: 'username',
				sortOrder: 'desc',
				idField:'uid',
				frozenColumns:[[
	             {field:'pid',checkbox:true}
				]],
				columns:[[
				    {field:'username',title:'用户名',width:80},
			        {field:'cnname',title:'姓名',width:80},
					{field:'area',title:'所属区域',width:90},
					{field:'code',title:'所属编码',width:100},
					{field:'role',title:'角色',width:90},
					{field:'phone',title:'手机',width:110}
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
					 pageSize: 18,//每页显示的记录条数，默认为10   
					 pageList: [18,20,30,50],//可以设置每页记录条数的列表   
					 beforePageText: '第',//页数文本框前显示的汉字   
					 afterPageText: '页    共 {pages} 页',  
					 displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
 
		   });  
	   }

function search(){
	var username = $('#susername').val();
	var cnname = $('#scnname').val();
	var area=$("#code1").val();
	var role=$('#code3').val();
	$('#tt2').datagrid({
		queryParams: {"search.username": username,"search.usercnname":cnname,"search.role":role,"search.area":area}
	});
	displayMsg();  
}
  
</script>
</head>
<body class="easyui-layout" >
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<input type="hidden" name="code1" id="code1"/>
<input type="hidden" name="code3" id="code3"/>
<div data-options="region:'north'" style="overflow:hidden;">
	<table width="100%" cellpadding=0>
<tr>
	<td align="right" height="28">地区:</td>
	<td>
		<input id="menu1" type="text" value="" style="width:100px;" onClick="showMenu(this);"/>
	</td>
	<td align="right">用户名:</td>
	<td><s:textfield  name="susername" id="susername" size="8"/></td>
	<td align="right">姓名:</td>
	<td><s:textfield name="scnname" id="scnname" size="8"/></td>

	<td align="right">角色:</td>
	<td><input id="menu3" type="text" readonly value="" style="width:100px;" onclick="showMenu(this);"/> </td>
	<td><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()" >查询</a></td>
</tr>
                </table>
</div>

<div data-options="region:'center',title:'用户列表'" style="background:#fafafa; padding:0px;overflow:hidden">
	<table id="tt2" bgcolor="#FFFFFF"></table>
</div>
  
<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
	<ul id="menutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>                  
<div id="menuContent3" class="menuContent" style="display:none; position: absolute;">
	<ul id="menutree3" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>   

	
</body>
</html>