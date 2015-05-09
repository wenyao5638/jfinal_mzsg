<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
 <%
			String contextPath = request.getContextPath();
		%>		
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>再生育管理系统- 权限管理</title>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css">
	<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/user/js/fun.js"></script>
 <script>
 $(function(){
 openFun();
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
				url:'<%=contextPath%>/fun/funList.do?qx=<s:property value="qx"/>',
				sortName: 'id',
				sortOrder: 'desc',
				idField:'id',
				<s:if test="%{qx==1 || qx==0}">frozenColumns:[[
	             {field:'nid',checkbox:true}
				]],</s:if>
				columns:[[
				    {field:'id',title:'编号',width:80},
					{field:'pid',title:'父编号',width:80},
			        {field:'cnname',title:'名称',width:120},
					 {field:'href',title:'地址',width:200},
					{field:'dlbz',title:'代理标志',width:120},
					{field:'manage',title:'管理标志',width:120},
					{field:'opt',title:'操作',width:100,align:'center'}
					]],
				toolbar:[<s:if test="%{qx==1 || qx==0}">{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						add();
					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function(){
							var row = $('#tt2').datagrid('getSelections');
							if(row.length==0){
							    $.messager.alert('系统提示', '请选择要删除的数据','warning'); 
							}else{
							   var ids="";
								for(var i=0;i<row.length;i++){
								     ids+=row[i].id;
									 if(i+1!=row.length){
									  ids+=',';
								     }	
								 } 
								del(ids);
							}
					}
				},'-',</s:if>{
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
	 
	
 </script>
</head>
<body class="easyui-layout" >

<div data-options="region:'north'" style="overflow:hidden;">
	<table width="98%" cellpadding=0>
	<tr>    
		<td align="right" height="38">编码:</td>
		<td><s:textfield name="sid" id="sid" size="8"/></td>
		<td align="right">名称:</td>
		<td><s:textfield  name="scnname" id="scnname" size="8"/></td>
		<td align="right">父编码:</td>
		<td><s:textfield  name="spid" id="spid" size="8"/></td>
		<td align="right">代理标志:</td>
		<td> <s:radio name="sdlbz" list="#{'':'全部','1':'代理','0':'不代理'}"  id="sdlbz" /></td> 
	</tr>
	<tr>
		<td align="right">管理标志:</td>
		<td colspan="4"> <s:radio name="smanage" list="#{'':'全部','0':'两者兼是','1':'管理','2':'普通'}" id="smanage" /></td>
		<td colspan="3"><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()" >查询</a></td>
	</tr>
</table>
</div>
		<div data-options="region:'center',title:'权限列表'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
        
        
         <div id="add" class="easyui-window" title="权限设置"  
       data-options="modal:true" minimizable="false"
        maximizable="false"  style=" padding:5px;background: #fafafa;" >  
     <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
              <TABLE width=60% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
		  <TR>
    <TD align=middle>
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" ><td width="26%">
		    
		    <tr bgcolor="#FFFFFF"><s:hidden id="oldid" name="oldid"/>
              <td align="right" height="28">父编号：</td>
		      <td width="74%"  align="left"> <s:textfield name="pid"  id="pid" cssClass="text"  size="20" /></td>
		     
		    </tr>
            <Tr> <td align="right" height="28">编 号：</td>
		      <td width="74%"  align="left"> <s:textfield name="id"  id="id" cssClass="text"  size="20" onBlur="checkFun(this.value)"/></td></Tr>
		    <tr bgcolor="#FFFFFF"> 
		      <td align="right" height="28">名 称：</td>
		      <td  align="left"> <s:textfield name="cnname"  cssClass="text" id="cnname" size="20" /></td>
		    </tr>
            <tr bgcolor="#FFFFFF"> 
		      <td align="right" height="28">图标：</td>
		      <td  align="left"> <s:textfield name="icon"  cssClass="text" id="icon" size="30" /></td>
		    </tr>
             <tr bgcolor="#FFFFFF"> 
		      <td align="right" height="28">地址：</td>
		      <td  align="left"> <s:textfield name="href"  cssClass="text" id="href" size="30" /></td>
		    </tr>
              <tr bgcolor="#FFFFFF"> 
		      <td align="right" height="28">代理标志：</td>
		      <td  align="left"> 		  <s:radio name="dlbz" list="#{'1':'代理','0':'不代理'}"  id="dlbz" />
</td>
		    </tr>
              <tr bgcolor="#FFFFFF"> 
		      <td align="right" height="28">管理标志：</td>
		      <td  align="left"> 		  <s:radio name="manager" list="#{'0':'全部','1':'管理','2':'普通'}"  id="manager" />
</td>
		    </tr>

           
		
		    <tr>
			  <td colspan="2" height="12"></td>
			</tr>
		  </table></TD></TR>
		  </table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
         </div>
               <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
              
                   <span id="save">  <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveFun()" >
                   保存 </a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('add')" >
                   取消 </a>
                </div>
                 </div>
          </div>  

	
</body>
</html>