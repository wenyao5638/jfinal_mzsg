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
<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
	            <script type="text/javascript" src="<%=contextPath%>/user/js/gndl.js"></script>

 <script>
 $(function(){
 openSearch();
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
				url:'<%=contextPath%>/gndl/gndlList.do?qx=<s:property value="qx"/>',
				sortName: 'id',
				sortOrder: 'desc',
				idField:'id',
				/*frozenColumns:[[
	             {field:'nid',checkbox:true}
				]],*/
				columns:[[
				     {field:'dlrs',title:'代理人',width:100},
			        {field:'dlsjq',title:'代理时间起',width:100},
					 {field:'dlsjz',title:'代理时间止',width:100},
					{field:'moduleid',title:'代理的功能',width:120},
					{field:'szsj',title:'设置时间',width:120},
					{field:'opt',title:'操作',width:100,align:'center'}
					]],
				toolbar:[{
					text:'查询',
					iconCls:'icon-search',
					handler:function(){
					  openS();
					}
				}/*,'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function(){
							var row = $('#tt2').datagrid('getSelections');
							if(row.length==0){
							    $.messager.alert('系统提示', '请选择要删除的数据'); 
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
				}*/,'-',{
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
	function openUsers(jgdm){
	        $('#userlist').dialog({
				buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						addUser();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						closeUsers();
					}
				}],
				title:"代理人选择"
			});
			var url="<%=contextPath%>/user/dialog.do";
	 		//$('#dialog_modal_edit')[0].src=url;        
			//var href = "dialog_modal.location.href='" + url + "'";
			$("#users").attr("src",url);
			$('#userlist').dialog('open');
		}
		function closeUsers(){
			$('#userlist').dialog('close');
		}

        function addUser(){
		   
		    var array=window.frames["users"].$('#tt2').datagrid('getSelections');
			var str="";
			if(array.length==0){
				$.messager.alert('系统提示', '请选择要代理人','warning'); 
			}else if(array.length>1){
			    $.messager.alert('系统提示', '只能选择一个代理人','warning'); 
			}else{
				 var ids="";
				for(var i=0;i<array.length;i++){
					ids+=array[i].uid;	
					} 
				   var a=ids.split(":");
					
				$("#dlr").val(a[0]);				
				$("#dlrs").val(a[1]);
				closeUsers();			
			}
		
			
		}

	 </script>

</head>
<body class="easyui-layout" >
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<s:if test="%{qx==1 || qx==0}">
<div data-options="region:'north',title:'代理设置'" style="overflow:hidden;height:150px;">

<TABLE width=69% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
		  <TR>
    <TD align=middle>
		  <table width="82%" border="0" align="center" cellpadding="0" cellspacing="0" ><td width="26%">
		    
		    <tr bgcolor="#FFFFFF"><s:hidden id="id" name="id"/><s:hidden id="roleid" name="roleid"/><s:hidden id="szsj" name="szsj"/>
              <td align="right" height="28">代理人：</td>
		      <td width="74%"  align="left"><s:hidden id="dlr" name="dlr"/><s:textfield name="dlrs"  id="dlrs" cssClass="text"  size="20"  onClick="openUsers()"  readOnly="true"/></td>
		     
		    </tr>
            <Tr> <td align="right" height="28">代理时间：</td>
		      <td width="74%"  align="left"> <input type="text" name="kssj"  id="kssj" cssClass="text"  size="8" onClick="WdatePicker()"  readonly="readonly"/> 至 <input type="text" name="jssj"  id="jssj" cssClass="text"  size="8" onClick="WdatePicker()"  readonly="readonly"/></td></Tr>
		    <tr bgcolor="#FFFFFF"> 
		      <td align="right" height="28">代理功能：</td>
		      <td  align="left"> <s:select name="moduleid" list="#request.funs" listKey="id" listValue="cnname" id="moduleid" headerKey="" headerValue="==代理功能==" ></s:select></td>
		    </tr>
		   
		  </table></TD></TR>
		  </table>
						</TD>
					</TR>
				</TBODY>
  </TABLE>
  <div region="south" border="false" style="text-align: center; height: 20px; line-height: 22px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveGndl()" >
                   设置 </a>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:add()" >
                   清除 </a>
  </div>
                          

</div>
</s:if>
<div data-options="region:'center',title:'代理列表'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
        
 <div id="userlist"   closed="true" modal="true" style="padding:5px;width:800px;height:500px;">
        <iframe scrolling="auto" id='users' name="users" frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
 </div>		
  
    <div id="search" class="easyui-window" title="查询"  
       data-options="iconCls:'icon-search',modal:true" minimizable="false"
        maximizable="false" style=" padding:5px;background: #fafafa;">  
     <div class="easyui-layout" fit="true">
      
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
              <TABLE width=80% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
		  <TR>
    <TD align=middle><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" ><tr bgcolor="#FFFFFF"><td width="74%" align="left"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
      <td width="26%">       </td>
             <tr>
                  <td align="right" height="28">代理功能：</td>
		      <td  align="left"> <s:select name="smoduleid" list="#request.funs" listKey="id" listValue="cnname" id="smoduleid" headerKey="" headerValue="==代理功能==" ></s:select></td>
                </tr>
              <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">代理时间起：</td>
                <td width="74%" align="left"><s:textfield name="qstime"  id="qstime" cssClass="text"  size="12" onClick="WdatePicker()"  readOnly="true"/>&nbsp;&nbsp;至&nbsp;&nbsp;<s:textfield name="qetime"  id="qetime" cssClass="text"  size="12" onClick="WdatePicker()"  readOnly="true"/></td>
              </tr>
               <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">代理时间止：</td>
                <td width="74%" align="left"><s:textfield name="zstime"  id="zstime" cssClass="text"  size="12" onClick="WdatePicker()"  readOnly="true"/>&nbsp;&nbsp;至&nbsp;&nbsp;<s:textfield name="zetime"  id="zetime" cssClass="text"  size="12" onClick="WdatePicker()"  readOnly="true"/></td>
              </tr>
              
                <tr>
                  <td colspan="2" height="12"></td>
                </tr>
    </table>
    </td>
		    </tr>
    </table></TD></TR>
		  </table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
       </div>
               <div region="south" border="false" style="text-align: right; height: 30px; padding:2px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:search()" >
                   查询 </a>
       </div>
           </div>    
</div>
	
</body>
</html>