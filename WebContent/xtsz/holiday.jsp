<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>再生育管理系统-日期导入</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css">
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/xtsz/js/holiday.js"></script>
<script>

 $(function(){
   openCode();
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
				url:'<%=contextPath%>/holiday/holidayList.do?qx=<s:property value="qx"/>',
				idField:'area',
				columns:[[
				    {field:'rq',title:'日期',width:120},
					{field:'opt',title:'操作',width:150,align:'center'}
					]],
				toolbar:[<s:if test="%{qx==1 || qx==0}">{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						add();
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

function search(){
	var lx = $('#lx').val();
	$('#tt2').datagrid({
		queryParams: {"search.lx": area}
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
	<td width="99" align="right" height="28">类型:</td>
	<td>
		<s:select list="#{1:'工作日转节假日',2:'节假日转工作日'}" name="lx" listKey="key"></s:select>
	</td>
	<td>
		<a id="btnEp" class="easyui-linkbutton" icon="icon-search" href="javascript:search()">查询</a>
	</td>
	<td></td>
</tr>
</table>

</div>
 
<div data-options="region:'center',title:'日期'" style="background:#fafafa; padding:0px;overflow:hidden">
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
          <s:hidden  name="oldarea"  id="oldarea"/>
          <tr bgcolor="#FFFFFF" id="flb">
              <td align="right" height="28">类型：</td>
		      <td width="38%"  align="left">
		      	<s:select list="#{1:'工作日转节假日',2:'节假日转工作日'}" name="lx" listKey="key"></s:select>
		      </td>	    
		    </tr>
              <tr>
               <td width="16%" height="28" align="right">日期：</td>
		      <td width="31%"  align="left"> <s:textfield name="nr" id="nr" cssClass="text" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" size="12"/></td>
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