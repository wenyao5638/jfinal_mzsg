<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>再生育管理系统>>短信维护>>待发送短信</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<style>
textarea
{
width:60%;
height:100%;
}
</style>
<script>

 $(function(){
	 var contextPath = $('#contextPath').val();
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
				url:'<%=contextPath%>/dxwh/dfsdxList.do?qx=<s:property value="qx"/>',
				idField:'area',
				columns:[[
				    {field:'jsdx',title:'接收对象',width:120},
			        {field:'jtry',title:'具体人员',width:100},
			        {field:'phone',title:'手机号码',width:100},
			        {field:'fsnr',title:'发送内容',width:300},
				    {field:'yfssj',title:'预计发送时间',width:120}
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
	var jsdx = $('#jsdx').val();
	var fsnr = $('#fsnr').val();
	var sqr = $('#sqr').val();
	$('#tt2').datagrid({
		queryParams: {"search_dfsdx.jsdx":jsdx,"search_dfsdx.fsnr":fsnr,"sqr":sqr}
	});
	displayMsg();  
}
 </script>
</head>
<body class="easyui-layout" >
<div data-options="region:'north'" style="overflow:hidden;">
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<table width="98%" cellpadding=0>
<tr>
	<td align="right" height="28">发送对象:</td>
	<td>
		<s:select name="jsdx" id="jsdx" list="#request.jsdxList" listKey="code" listValue="name" headerKey="" headerValue="==接收对象=="></s:select>
	</td>
	<td align="right" height="28">发送内容:</td>
	<td>
		<s:textfield name="fsnr"  id="fsnr" cssClass="text"  size="20"/>
	</td>
	<td align="right" height="28">申请人:</td>
	<td>
		<s:textfield name="sqr"  id="sqr" cssClass="text"  size="10"/>
	</td>
	<td>
		<a id="btnEp" class="easyui-linkbutton"  href="javascript:search()">查询</a>
	</td>
	<td></td>
</tr>
</table>

</div>
 
<div data-options="region:'center',title:'待发送短信记录'" style="background:#fafafa; padding:0px;overflow:hidden">
	<table id="tt2" bgcolor="#FFFFFF"></table>
</div>
        
</body>
</html>