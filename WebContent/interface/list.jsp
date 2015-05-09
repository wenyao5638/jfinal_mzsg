<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@ taglib prefix="s" uri="/struts-tags"%>

<head> 
 <%
			String contextPath = request.getContextPath();
		%>		

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Border Layout on Panel - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css">
	<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
    <script>
	 $(function(){
			$('#tt2').datagrid({
				iconCls:'icon-save',
				width:400,
				height:300,
				nowrap: true,
				striped: true,
				fit: true,
				url:'datagrid_data.json',
				sortName: 'code',
				sortOrder: 'desc',
				idField:'code',
			
				frozenColumns:[[
	                {field:'ck',checkbox:true},
	                {title:'编号',field:'code',width:80,sortable:true}
				]],
				columns:[[
			        	{field:'name',title:'名称',width:120},
					{field:'addr',title:'地址',width:120,sortable:true},
					{field:'col4',title:'数据',width:150},
					{field:'opt',title:'操作',width:100,align:'center',
						formatter:function(value,rec){
							return '<span style="color:red">Edit Delete</span>';
						}
					}
				]],
				toolbar:[{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						 $("#tt2").datagrid("insertRow", {
							 index: 0,
							 row: {"code":"011","name":"Name 11","addr":"Address 11","col4":"col4 data"}
						   });
					}
				},'-',{
					text:'删除',
					iconCls:'icon-remove',
					handler:function(){
						var row = $('#tt2').datagrid('getSelected');
						if (row){
							var index = $('#tt2').datagrid('getRowIndex', row);
							$('#tt2').datagrid('deleteRow', index);
						}
					}
				},'-',{
					text:'推荐',
					iconCls:'icon-save',
					handler:function(){
						$('#tt2').datagrid('acceptChanges');
					}
				},'-',{
					text:'刷新',
					iconCls:'icon-undo',
					handler:function(){
						 $('#tt2').datagrid('reload');
					}
				}
				],
				pagination:true,
				rownumbers:true
			});
		

			
		});
		
	
	</script>
</head>
<body class="easyui-layout" >
<div data-options="region:'north'" style="overflow:hidden;">
	<table width="933" cellpadding=0>
<tr>
                        <td width="60" align="right" height="20">用户名:</td>
      <td width="73"><s:textfield name="uname" id="uname" size="15"/></td>
        <td width="81" align="right">真实姓名:</td>
      <td width="80"><s:textfield  name="tname" id="tname" size="15"/></td>
       <td width="61" align="right">地址:</td>
      <td width="139"><s:textfield name="uaddress" id="uaddress" size="15"/></td>
                        <td width="97" align="right">联系电话:</td>
      <td width="274"><s:textfield  name="uphone" id="uphone" size="15"/></td>
      </tr>
                  
                 
                    
                      <tr>
                        <td align="right">性别:</td>
                        <td>	<s:radio name="usex" list="#{'-1':'全部','0':'男','1':'女'}" id="usex" value="-1"/></td>
                        <td align="right">状态:</td>
                        <td><s:radio name="ustatus" id="ustatus" list="#{'-1':'全部','0':'停用','1':'启用'}"  value="-1"/></td>
                           <td width="61" align="right" height="20">用户名:</td>
      <td width="139"><s:textfield name="uname" id="uname" size="15"/></td>
        <td width="97" align="right">真实姓名:</td>
<td width="274"><s:textfield  name="tname" id="tname" size="15"/>  <a id="btnEp" class="easyui-linkbutton"  href="javascript:searchUser()" >
                   查询</a></td>
      </tr>
                   
                </table>
</div>
		<div data-options="region:'center',title:'区域编码列表'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
	
</body>
</html>