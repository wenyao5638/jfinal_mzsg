<!DOCTYPE html>
<html>
<head>    <%
			String contextPath = request.getContextPath();
		%>		

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Border Layout on Panel - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/default/easyui.css">
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
<body>
	<h2>Border Layout on Panel</h2>
	<div class="demo-info" style="margin-bottom:10px">
		<div class="demo-tip icon-tip"></div>
		<div>The layout can be applied on panel.</div>
	</div>
	
	<div class="easyui-layout" style="width:700px;height:400px;">
		<div data-options="region:'north'" style="overflow:hidden;padding:10px">
			<h2>Layout in Panel</h2>
		</div>
		<div data-options="region:'south',split:true" style="height:50px;background:#fafafa;"></div>
		<div data-options="region:'east',iconCls:'icon-reload',split:true" title="East" style="width:180px;"></div>
		<div data-options="region:'west',split:true" title="West" style="width:100px;"></div>
		<div data-options="region:'center',title:'Main Title'" style="background:#fafafa;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
	</div>
</body>
</html>