<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>再生育管理系统--短信接收对象</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css">
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/dxwh/js/dxwh_jsdx.js"></script>
<style>
textarea
{
width:60%;
height:100%;
}
</style>

 <script>
 $(function(){
 open_Jsdx();
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
				url:'<%=contextPath%>/dxwh/jsdxList.do?qx=<s:property value="qx"/>',
				sortName: 'id',
				sortOrder: 'desc',
				idField:'id',
				columns:[[
				    {field:'jsdx',title:'接收对象',width:100},
				    {field:'sl',title:'人数',width:100},
					{field:'opt',title:'操作',width:100,align:'center'}
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
function nosqr(){
	var jsdx = $('#jsdx').val();
	if(jsdx=="01"){
		$.messager.alert('系统提示', '申请人不用添加!','warning'); 
		$('#jsdx').val('');
		return;
	} 
}

//编辑短信接收对象
function dxwh_jsdx_edit(jsdx){
	$('#jsdxList').dialog({
		buttons:[{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$('#jsdxList').dialog('close');
			}
		}],
		title:"短信接收对象管理"
	});
	var url="<%=contextPath%>/dxwh/dxwh_jsdx_edit.do?jsdx="+jsdx;
	$("#jsdxs").attr("src",url);
	$('#jsdxList').dialog('open');
}
 </script>
</head>
<body class="easyui-layout" >
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<s:if test="%{qx==1 || qx==0}">
<div data-options="region:'north',title:'接收对象管理'" style="overflow:hidden;height:150px;">
<s:hidden name="id" id="id"></s:hidden>
<s:hidden name="username" id="username"></s:hidden>
<TABLE width=69% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
		  <TR>
    <TD align=middle>
		  <table width="82%" border="0" align="center" cellpadding="0" cellspacing="0" ><td width="26%">
		    
		    <tr bgcolor="#FFFFFF"><s:hidden id="id" name="id"/><s:hidden id="roleid" name="roleid"/><s:hidden id="szsj" name="szsj"/>
              <td align="right" height="28">接收对象：</td>
		      <td width="74%" align="left"><s:select name="jsdx" id="jsdx" list="#request.jsdxList" listKey="code" listValue="name" headerKey="" headerValue="==接收对象==" onchange="nosqr()"></s:select></td>
		     
		    </tr>
		    <tr bgcolor="#FFFFFF"> 
		      <td align="right" height="28">具体人员：</td>
		      <td width="74%" align="left"><s:textarea name="usercnname" id="usercnname" onClick="openUsers()" style="height:50px;width:400px" readOnly="true"></s:textarea></td>
		    </tr>
		   
		  </table></TD></TR>
		  </table>
						</TD>
					</TR>
				</TBODY>
  </TABLE>
  <div region="south" border="false" style="text-align: center; height: 20px; line-height: 22px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:save_Jsdx()" >
                   保存</a>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-redo" href="javascript:add()" >清空</a>
  </div>
                          

</div>
   </s:if>
<div data-options="region:'center',title:'接收对象管理'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
            
 <div id="userlist"   closed="true" modal="true" style="padding:5px;width:700px;height:400px;">
        <iframe scrolling="auto" id='users' name="users" frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
 </div>

 <div id="jsdxList" closed="true" modal="true" style="padding:5px;width:700px;height:400px;">
        <iframe scrolling="auto" id='jsdxs' name="jsdxs" frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
 </div>

	
</body>
</html>