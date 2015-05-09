<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<head>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/easyUI.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree.js"></script>
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>
<%String menuString1 = (String)request.getAttribute("areaString"); %>
<%List arealist = (List) request.getAttribute("arealist");%>   

 <script>
 	var cz = '${cz}';
 $(function(){
     //openclxx();
	 initTree('menu1','code1',${areaString},'${user.area}');
	 initTree('menu2','code2',${areaString},'');
     //$.fn.zTree.init($("#menutree2"), menusetting, zNodesmenu1);
	 var contextPath = $('#contextPath').val();
	 
			$('#dg').datagrid({
			　　　title:'社工调动列表',
				iconCls:'icon-save',
				width:200,
				height:200,
				singleSelect:false,
				nowrap: false,
				striped: true,
				pagination:true,
				loadMsg : '数据装载中......', 
				fit: true,
				url:'<%=contextPath%>/sgdcsq/sgdcsqList.do?zt=<s:property value="zt"/>&cz='+cz,
				frozenColumns:[[
					{field:'opt',title:'操作',width:90,align:'center'},
				    {field:'ysq',title:'原所属社区',width:90,align:'center'},
					{field:'xsq',title:'新所属社区',width:90,align:'center'}
							]],
				columns:[[
				   
					{field:'xm',title:'姓名',width:60,align:'center'},
					{field:'zjhm',title:'证件号',width:120,align:'center'},
					{field:'yzw',title:'原职务',width:70,align:'center'},
					{field:'xzw',title:'新职务',width:70,align:'center'},
					{field:'sgrq',title:'上岗时间',width:80,align:'center'},
					{field:'czrq',title:'上报日期',width:80,align:'center'},
					{field:'jddrshr',title:'审核人',width:60,align:'center'},
					{field:'jddrshrq',title:'审核时间',width:90,align:'center'},
				    {field:'zt',title:'状态',width:70,align:'center'}
					]],
					<s:if test="%{qx==1 &&cz==0}">
				toolbar:[{
					text:'<font color=red>申请调动</font>',
					iconCls:'icon-add',
					handler:function(){
						window.parent.closeTab("社工调动申请清单");			
						window.parent.addTab("社工调动申请清单","<%=contextPath%>/sgdcsq/addnew.do?pid=${pid}&cz="+cz+"&bz=sq");
					}
				}
				],
				</s:if>
				rownumbers:true
			});
		    displayMsg();  
		});
		function displayMsg() {  
				$('#dg').datagrid('getPager').pagination({  
					 pageSize: 10,//每页显示的记录条数，默认为10   
					 pageList: [10,20,30,40],//可以设置每页记录条数的列表   
					 beforePageText: '第',//页数文本框前显示的汉字   
					 afterPageText: '页    共 {pages} 页',  
					 displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
 
		   });  
	   }
	
//查询	
function search(){
	var ysq = $('#code1').val();
	var xm = $('#xm').val();
	var zjhm = $('#zjhm').val();
	var xsq = $('#code2').val();
	var czrqq = $('#czrqq').val();
	var czrqz = $('#czrqz').val();
	var zt = $('#zt').val();
	$('#dg').datagrid({
		queryParams: {"search.zt":zt,"search.ysq": ysq,"search.xm": xm,"search.zjhm": zjhm,"search.xsq": xsq,"search.czrqq": czrqq,"search.czrqz": czrqz}
	});
	displayMsg();  
}

function sgdcsqqd(){
	window.parent.closeTab("社工调动申请清单");			
	window.parent.addTab("社工调动申请清单","<%=contextPath%>/sgdcsq/addnew.do?pid=${pid}&cz="+cz+"&bz=sq");
}
//查看
function edit(id,bz){
	window.parent.closeTab("社工调动申请清单");
	window.parent.addTab("社工调动申请清单","<%=contextPath%>/sgdcsq/xiugai.do?pid=${pid}&id="+id+"&cz="+cz+"&bz="+bz);
}


//删除
function deleteSg(id){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('删除', '你确认要删除吗？', function(r){
		if (r){
			$.ajax({  
				url :contextPath+'/sgdcsq/deleteSgdcsq.do',   
				data : {   
					id : id
				},   
				type : 'POST',   
				success : function() {
					$.messager.alert('系统提示', '删除成功','warning');
					$('#dg').datagrid('reload');
				}   
			}); 
		}
 	}); 
}

//上报
function sqsb(id,zt){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('上报', '你确认要上报吗？', function(r){
		if (r){
			$.ajax({  
				url :contextPath+'/sgdcsq/sqsb.do',   
				data : {   
					id : id
				},   
				type : 'POST',   
				success : function() {
					$.messager.alert('系统提示', '上报成功','warning');
					$('#dg').datagrid('reload');
				}   
			}); 
		}
 	}); 
}




</script>
</head>
<body>
<div class="easyui-layout" style="width: 100%; height: 100%;" fit="true">
		<div region="north" border="false" class="demo-info">
			<div id="search" title="查询选项" icon="icon-search"
				style="overflow: hidden; height: 65px; padding: 5px; background: #fafafa;">
 
		<form method="post">
				<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<input type="hidden" name="code1" id="code1"/>
<input type="hidden" name="code2" id="code2"/>
<input type="hidden" id="m" name="m"/>

		<table width="80%" cellspacing="0" style="font-size:12px;">
			
	<tr>
		<td align="right">原所属社区：</td>
	  	<td><input id="menu1" type="text" value=""  size="8" onClick="showMenu(this);"/></td>
		<td align="right">姓名：</td>
	 	<td><s:textfield  name="xm" id="xm" size="8"/></td>
		<td align="right">证件号：</td>
	  <td><s:textfield  name="zjhm" id="zjhm" size="18"/></td>
	</tr>
	<tr>
		<td align="right">新所属社区：</td>
		<td><input id="menu2" type="text" value=""  size="8" onClick="showMenu(this);"/></td>
		<td align="right">上报日期：</td>
		<td><s:textfield id="czrqq" name="czrqq" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"/>
            	至&nbsp;<s:textfield id="czrqz" name="czrqz" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"/></td>
		<td align="right">状态：</td>
		<td><s:select name="zt" id="zt" cssClass="text" list="#request.spzt" listKey="code" listValue="name"  headerKey="-1" headerValue="全部" /></td>
   	    <td  align="center"><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()" >查询</a></td>
	</tr>
</table>
</form>
			</div>
		</div>
		<div region="center" class="gridback">
			<div id="dg"  border=0 pagination="true" title="社工调动列表"
				toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
			</div>
		</div>
		</div>
		

 	<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
		<ul id="menutree2" class="ztree" style="margin-top:0; width:200px; height: 300px;"></ul>
 	</div> 
 	<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
		<ul id="menutree1" class="ztree" style="margin-top:0; width:200px; height: 300px;"></ul>
 	</div>  
	
</body>
</html>