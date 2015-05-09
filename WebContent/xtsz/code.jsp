<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
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
        <script type="text/javascript" src="<%=contextPath%>/xtsz/js/code.js"></script>

 <script>
 $(function(){
   openCode();
   bm();
	 var contextPath = $('#contextPath').val();
			$('#tt2').treegrid({
				iconCls:'icon-save',
				width:200,
				height:200,
				nowrap: false,
				rownumbers: false,
				animate:true,
				collapsible:true,
				pagination:true,
				loadMsg : '数据装载中......', 
				fit: true,
				url:'<%=contextPath%>/code/typecodeList.do?qx=<s:property value="qx"/>',
				sortName: 'code',
				sortOrder: 'desc',
				idField:'code',
				treeField:'code',	
				columns:[[
				    {field:'code',title:'编码',width:180},
					{field:'name',title:'名称',width:300},
					{field:'opt',title:'操作',width:100,align:'center'}
					]],
			   toolbar:[<s:if test="%{qx==1 || qx==0}">{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						add(1);
					}
				},'-',</s:if>{
					text:'刷新',
					iconCls:'icon-reload',
					handler:function(){
						 $('#tt2').datagrid('reload');
					}
				}
				]
				
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
	   
	
	   function bm(){
		   $('#sfbh').combobox({
					url:'<%=contextPath%>/code/findTypecodes.do',
					valueField:'code',
					textField:'name',
	
					 onHidePanel:function(){
					   search('');
					 }
				});
	   }
	 
	
 </script>
</head>
<body class="easyui-layout" >
<div data-options="region:'north'" style="overflow:hidden;">
	<table width="98%" cellpadding=0>
<tr>
      <td width="20%" align="right" height="28">代码类型:</td>
      <td width="30%" align="center"><select id="sfbh" name="sfbh" class="easyui-combobox"  style="width:220px" ><option value="">==代码类型==</option></select></td>
      <td width="20%"><a id="btnEp" class="easyui-linkbutton" icon="icon-add" href="javascript:add(0)" >新增大类</a></td>
</tr>
                </table>
</div>

		<div data-options="region:'center',title:'基础信息管理'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
        
    
	 <div id="add" class="easyui-window" title="添加"  
       data-options="iconCls:'icon-search',modal:true" minimizable="false"
        maximizable="false" style=" padding:5px;background: #fafafa;">  
     <div class="easyui-layout" fit="true">
      
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
              <TABLE width=90% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
		  <TR>
    <TD align=middle>
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
          <s:hidden  name="lb"  id="lb"/>
          <s:hidden  name="oldbh"  id="oldbh"/>
          <tr bgcolor="#FFFFFF" id="flb">
              <td align="right" height="28">父编码：</td>
		      <td width="38%"  align="left"><select id="fbh" name="fbh"></select></td>		     
		    </tr>
              		<tr bgcolor="#FFFFFF">
              <td align="right" height="28">编码：</td>
		      <td width="38%"  align="left"> <s:textfield name="bh"  id="bh" cssClass="text"  size="20" onBlur="checkCode(this.value)"/></td>		     
		    </tr>
              <tr>
               <td width="16%" height="28" align="right">名称：</td>
		      <td width="31%"  align="left"> <s:textfield name="mc"  id="mc" cssClass="text"  size="30"/></td>
              </tr>
             <tr>
			  <td colspan="2" height="8"></td>
			</tr>
		  </table></TD></TR>
		  </table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
       </div>
                 <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
               <span id="save"><a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveCode()" >
                   保存</a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('add')" >
                   取消 </a>
       </div>
           </div>    
</div>
</body>
</html>