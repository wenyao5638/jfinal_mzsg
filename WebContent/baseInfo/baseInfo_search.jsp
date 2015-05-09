<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();
String path = "http://" + request.getServerName() + ":" + request.getServerPort() + contextPath;
%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>基础信息查看</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/zsysp/js/areatree.js"></script>
<%String menuString = (String)request.getAttribute("areaString"); %>
<%String lx = (String)request.getAttribute("lx"); %>
<style>
ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>

<script>
var zNodesmenu =<%=menuString%>;
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
$(function(){
 	$.fn.zTree.init($("#menutree"), menusetting, zNodesmenu);
	var zTree = $.fn.zTree.getZTreeObj("menutree"),
	node = zTree.getNodeByParam("id","<s:property value='#request.userarea'/>",null);
	zTree.selectNode(node);
	var cityObj = $("#menu_search");
	cityObj.attr("value", node.name);
	openSearch();
			$('#tt2').datagrid({
				iconCls:'icon-save',
				width:800,
				height:200,
				singleSelect:true,
				nowrap: false,
				striped: true,
				pagination:true,
				loadMsg : '数据装载中......', 
				fit: true,
				url:'<%=contextPath%>/baseInfo/base_infoList.do',
				sortName: 'id',
				sortOrder: 'desc',
				idField:'id',
				columns:[[
					{field:'choose',title:'选择',width:100,align:'center'},
				    {field:'SYGLD',title:'所属社区',width:100},
				    {field:'BT_BNAME',title:'妇女姓名',width:70},
				    {field:'HB_HUSBAND_NAME',title:'丈夫姓名',width:70},
				    {field:'BT_BIRTH_DATE',title:'出生日期(女)',width:90},
				    {field:'BT_ID_CARD',title:'身份证号',width:100},
				    {field:'BT_DOOR_PLACE',title:'户籍地址',width:120},
				    {field:'BT_ADDRESS',title:'现住地址',width:120},
				    {field:'BT_PHONE',title:'联系电话',width:80},
				    {field:'HB_BIRTH_DATE',title:'丈夫出生(男)',width:90},
				    {field:'HB_ID_CARD',title:'身份证号',width:100},
				    {field:'HB_DOOR_PLACE',title:'户籍地址',width:120},
				    {field:'HB_ADDRESS',title:'现住地址',width:120},
				    {field:'HB_PHONE',title:'联系电话',width:80},
				    {field:'BT_CODE',title:'信息卡号',width:130}
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

function baseInfo_view(bt_bname,hb_husband_name,bt_code){
	window.parent.addTab(bt_bname+"(育龄妇女)","<%=path%>/baseInfo/baseInfo_Frame.jsp?BT_CODE="+bt_code+"&lx=<s:property value='lx'/>&sqly=<s:property value='sqly'/>");
}

function zsysp_base_addfromBaseInfo(bt_bname,hb_husband_name,bt_code){
	var lx = "<s:property value='lx'/>";
	var sqly = "<s:property value='sqly'/>";
	window.parent.addTab(bt_bname+"、"+hb_husband_name,"<%=path%>/zsysp/zsysp_base_addfromBaseInfo.do?BT_CODE="+bt_code+"&lx=<s:property value='lx'/>&sqly=<s:property value='sqly'/>");
}

function openSearch() {
	$('#search').window( {
		title : '查询',
		width : 600,
		modal : true,
		shadow : true,
		closed : true,
		height : 280,
		top:($(window).height() - 280) * 0.5,   
        left:($(window).width() - 600) * 0.5,
		resizable : false
	});
}
	
function search(){
	var sygld = $('#sygld').val();
	var BT_BNAME = $('#BT_BNAME').val();
	var HB_HUSBAND_NAME = $('#HB_HUSBAND_NAME').val();
	var BT_ID_CARD = $('#BT_ID_CARD').val();
	var HB_ID_CARD = $('#HB_ID_CARD').val();
	if(BT_BNAME==""&&HB_HUSBAND_NAME==""&&BT_ID_CARD==""&&HB_ID_CARD==""){
		$.messager.alert('系统提示', '请输入"妇女姓名"、"丈夫姓名"、"妇女身份证号"、"丈夫身份证号"中任意一个查询条件!','warning');
		return;
	}
	var showall="";
	$("[name='showall']:checkbox").each(function(){
		if($(this).attr("checked")){
			showall = $(this).val();
		}	
	})
	$('#tt2').datagrid({
		queryParams: {"search.SYGLD": sygld,"search.BT_BNAME":BT_BNAME,"search.HB_HUSBAND_NAME":HB_HUSBAND_NAME,
		"search.BT_ID_CARD":BT_ID_CARD,"search.HB_ID_CARD":HB_ID_CARD,"search.SFZX":showall}
	});
	displayMsg();  
}
</script>

</head>
<body class="easyui-layout" >
<s:hidden name="sygld" id="sygld"/>
<div data-options="region:'north'" style="overflow:hidden;">
	<table width="98%" cellpadding=0>
		<tr>
			<td align="right" height="28">地区:</td>
			<td width="100">
				<input id="menu_search" type="text" value="" style="width:130px;" onClick="showMenu(this);"/>
			</td>
		 	<td align="right">妇女姓名：</td>
            <td align="left"><s:textfield name="BT_BNAME" id="BT_BNAME" cssClass="text" size="10" /></td>
		 	<td align="right" height="28">丈夫姓名：</td>
            <td align="left"><s:textfield name="HB_HUSBAND_NAME" id="HB_HUSBAND_NAME" cssClass="text" size="10" /></td>
		</tr>
		<tr>
		 	<td align="right">妇女身份证号：</td>
            <td align="left"><s:textfield name="BT_ID_CARD" id="BT_ID_CARD" cssClass="text" size="18" /></td>
		 	<td align="right" height="28">丈夫身份证号：</td>
            <td align="left"><s:textfield name="HB_ID_CARD" id="HB_ID_CARD" cssClass="text" size="18" /></td>
            <td></td>
            <td align="left"><s:checkboxlist list="#{'yes':'显示注销'}" name="showall" label="显示注销" /></td>
		</tr>
		<tr>
			<td colspan="6" align="center"><a id="btnEp" class="easyui-linkbutton" icon="icon-search" href="javascript:search()">查询</a></td>
		</tr>
	</table>
</div>

<div data-options="region:'center',title:'基本信息'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
</div>
	
<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="menutree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
	
</body>
</html>