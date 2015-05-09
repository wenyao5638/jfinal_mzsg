<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>涉案财物管理系统- 提醒时间设置</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<!--<script type="text/javascript" src="<%=contextPath%>/user/js/dept.js"></script>-->
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree_new.js"></script>  

<%String menuString = (String)request.getAttribute("areaString"); %>
<%String menuString2 = (String)request.getAttribute("lbString"); %>
 <script>;  
 $(function(){
	 $("input[name=enabled][value=1]").attr("checked", true);
	var contextPath = $('#contextPath').val();
	
	initTree('menu1','code1',${areaString},'${user.area}','body');
	initTree('menu4','code4',${lbString},'','body');//查询类别
	openDept();	
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
				url:'<%=contextPath%>/notification/notificationList.do?qx=<s:property value="qx"/>',
				sortName: 'id',
				sortOrder: 'desc',
				idField:'id',
				columns:[[
				    {field:'opt',title:'操作',width:100,align:'center'},
				    {field:'mc',title:'类别',width:150},
			        {field:'basj',title:'办案时间',width:80},
					{field:'dhtz',title:'电话通知',width:80},
					{field:'smtz',title:'书面通知',width:80},
					{field:'ggtz',title:'公告通知',width:80},
					{field:'ssdw',title:'所属单位',width:150}
					]],

					toolbar:[{
						text:'添加',
						iconCls:'icon-add',
						handler:function(){
							
							var cityObj = $("#menu2");
							cityObj.attr("value", "");
							initTree('menu2','code2',${areaString},'${user.area}','win');
							initTree('menu3','code3',${lbString},'','win');//查询类别
							add();
						}}
					,'-',{
						text:'刷新',
						iconCls:'icon-reload',
						handler:function(){
							 $('#tt2').datagrid('reload');
						}
					}
					],
					
<%--				toolbar:[<s:if test="%{qx==1 || qx==0}">{--%>
<%--					text:'添加',--%>
<%--					iconCls:'icon-add',--%>
<%--					handler:function(){--%>
<%--						add();--%>
<%--					}--%>
<%--				},'-',</s:if>{--%>
<%--					text:'刷新',--%>
<%--					iconCls:'icon-reload',--%>
<%--					handler:function(){--%>
<%--						 $('#tt2').datagrid('reload');--%>
<%--					}--%>
<%--				}--%>
<%--				],--%>
				rownumbers:true
			});
		    displayMsg();  
		});
		
function displayMsg() {  
				$('#tt2').datagrid('getPager').pagination({  
					 pageSize: 10,//每页显示的记录条数，默认为10   
					 pageList: [10,20,30,50],//可以设置每页记录条数的列表   
					 beforePageText: '第',//页数文本框前显示的汉字   
					 afterPageText: '页    共 {pages} 页',  
					 displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
 
		   });  
}
	   
function search(){
	//var mc = $('#menu1').val();
	var mc = $('#mc').val();
	var code1 = $('#code1').val();
	var lb=$('#code4').val();
	$('#tt2').datagrid({
		queryParams: {
			"search.ssdw":code1,"search.lb":lb
		}
	});
	//alert(mc);
	//alert(code1);
	displayMsg();  
}
//设置信息系统提示窗口
var flag=false;
function del(ids){
	     var contextPath = $('#contextPath').val();
		$.messager.confirm('编号删除', '你确认要删除已经选中的数据吗？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/notification/deleteNotification.do',   
						data : {   
							ids : ids   
						},   
						type : 'POST',   
						success : function() { 		
						     $('#tt2').datagrid('reload');	
							 $('#tt2').datagrid('clearSelections');
						}   
                }); 
				}
			});
			    
		}

function edit(id,qx){
  var contextPath = $('#contextPath').val();
	  $.ajax({   
                url : contextPath+'/notification/findNotification.do',  
					data:{"notification.id":id},
                 	type : 'POST',
					dataType : 'json',  
                success : function(data) {
			            var contextPath=$('#contextPath').val();
						flag=false;
						//$('#id').val(data.fybh);
						$('#oldcode').val(id);
						$('#tzmc').val(data.mc);
						$('#dhtz').val(data.dhtz);
						$('#smtz').val(data.smtz);
						$('#ggtz').val(data.ggtz);
						$('#basj1').val(data.basj);
						
						initTree('menu2','code2',${areaString},'${user.area}','win');
						initTree('menu3','code3',${lbString},data.lb,'win');//查询类别
						 if(qx==1){
						   $("#save").html("");
						 }
					    $('#jDialogContainer').window('open'); 
					 
					}
             });

		
}
  
	
function closes(win){
   $('#'+win).window('close');
}	
 function checkFee(id){
		//alert(id);
		
	   var contextPath = $('#contextPath').val();
	   var oldcode=$('#oldcode').val();
	   if(oldcode!=id && id!=''){
		  $.ajax({   
					   url : contextPath+'/fee/checkFee.do',  
						type : 'POST',
						data:{'id':id},
						dataType : 'json',  
						success : function(data) {
							flag=data;
							if(flag){
							   $.messager.alert('系统提示', '该费用编码已经存在，请输入其他编号！','warning'); 
							}
						}
					});
	   }
}
function openDept() {
	$('#jDialogContainer').window( {
		title : '通知信息',
		width : 600,
		modal : true,
		shadow : true,
		closed : true,
		height : 320,
		top:($(window).height() - 280) * 0.5,   
     left:($(window).width() - 600) * 0.5,

		resizable : false
	});
}
function add() {
	// $("input[name=status]").attr("checked","1");
	$('#menu2').val("");
	$('#menu3').val("");
	$('#tzmc').val("");
	$('#basj1').val("");
	$('#dhtz').val("");
	$('#smtz').val("");
	$('#ggtz').val("");

	$('#jDialogContainer').window('open'); 

}
function saveUnit() {
	var id = $('#oldcode').val();
	//var mc = $('#tzmc').val();
	var dhtz = $('#dhtz').val();
	var smtz = $('#smtz').val();
	var ggtz = $('#ggtz').val();
	var basj = $('#basj1').val();
	var ssdw = $('#code2').val();
	var lb = $('#code3').val();
	/*
	if(id==""){
	   $.messager.alert('系统提示', '编码不能为空','warning'); 
	}*/
	if(lb==""){
	    $.messager.alert('系统提示', '请悬着类别','warning'); 
	}else if(ssdw == ""){
		 $.messager.alert('系统提示', '所属单位不能为空','warning'); 
	}else{
  	save(id,dhtz,smtz,ggtz,basj,ssdw,lb);
	}
}
function save(id,dhtz,smtz,ggtz,basj,ssdw,lb) {
	//alert("123");
		var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/notification/updateNotification.do',
			data : {
				"notification.id" : id,
				//"notification.mc" : mc,
				"notification.dhtz" : dhtz,
				"notification.smtz" : smtz,
				"notification.ggtz" : ggtz,
				"notification.basj" : basj,
				"notification.ssdw" : ssdw,
				"notification.lb" : lb
				
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '信息添加出现错误输入','warning');
			},
			success : function(data) {
				   $('#tt2').datagrid('reload');
				   $('#jDialogContainer').window('close');
				}
			});
 }



</script>

</head>
<body class="easyui-layout" >
<input type="hidden" name="code1" id="code1"/>
<input type="hidden" name="code2" id="code2"/>
<input type="hidden" name="code3" id="code3"/>
<input type="hidden" name="code4" id="code4"/>
<s:hidden name="oldcode" id="oldcode"/>
<div data-options="region:'north'" style="overflow:hidden; padding:5px;">
<table cellpadding=0 class="querytable">
<tr>    
	<td class="querytitle">所属单位:</td>
	<td>
		<input id="menu1" type="text" value="" style="width:130px;" onClick="showMenu(this,'body');"/>
	</td>
    <td class="querytitle">类别:</td>
    <td>
    	<input id="menu4" type="text" value="" style="width:130px;" onClick="showMenu(this,'body');"/>
    </td>
    <td class="querybutton"><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()" >查询</a></td>
</tr>
</table>

</div>
		<div data-options="region:'center',title:'通知列表'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
        
        
         <div id="jDialogContainer" class="easyui-window" title="添加"     
     data-options="modal:true,iconCls:'icon-save'" minimizable="false"
        maximizable="false"  style="height:500px;padding:5px;background: #fafafa;" >  
     <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
              <TABLE width=80% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
	<TR>
    	<TD align=middle>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" ><td width="26%">
			
			<!-- 
			<tr bgcolor="#FFFFFF">
				<td align="right" height="28">编 号：</td>
				<td width="74%"  align="left"> <s:textfield name="fybh"  id="id" cssClass="text"  size="20" onBlur="checkFee(this.value)"/></td>
			</tr>
			 -->
			 
			 <tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">类别：</td>
				<td align="left">
					<input id="menu3" type="text" value="" style="width:130px;" onClick="showMenu(this,'win');"/>
				</td>
			</tr>
			 <tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">所属单位：</td>
				<td align="left">
					<input id="menu2" type="text" value="" style="width:130px;" onClick="showMenu(this,'win');"/>
				</td>
			</tr>
			
			<!-- 
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">名称：</td>
				<td  align="left"> <s:textfield name="mc"  cssClass="text" id="tzmc" size="20" /></td>
			</tr>
			 -->
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">办案时间：</td>
				<td  align="left"> <s:textfield name="basj"  cssClass="text" id="basj1" size="20" /></td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">电话通知：</td>
				<td  align="left"> <s:textfield name="dhtz"  cssClass="text" id="dhtz" size="20" /></td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">书面通知：</td>
				<td  align="left"> <s:textfield name="smtz"  cssClass="text" id="smtz" size="20" /></td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">公告通知：</td>
				<td  align="left"> <s:textfield name="ggtz"  cssClass="text" id="ggtz" size="20" /></td>
			</tr>
			
			<!-- 
			 <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">状态：</td>
                  <td align="left"><s:radio name="enable" list="#{'1':'启用','0':'注销'}" id="enable"/></td>
                </tr>
            -->
		    <tr>
		    
			  <td colspan="2" height="12"></td>
			</tr>
		  </table>
		</TD>
</TR>
		  </table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
         </div>
               <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <span id="save"><a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveUnit()" >
                   保存 </a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('jDialogContainer')" >
                   取消 </a>
               </div>
            </div>
			
			
			
          </div>  

			
</body>
</html>