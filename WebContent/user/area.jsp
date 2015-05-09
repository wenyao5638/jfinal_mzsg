<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>再生育管理系统- 区域管理</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/user/js/area.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree_new.js"></script> 
    
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>
<%String menuString = (String)request.getAttribute("areaString"); %>
 <script>;  
 var menuString='<%=menuString%>';

 $(function(){
 getCodes();
	var contextPath = $('#contextPath').val();
	
	//$.fn.zTree.init($("#menutree1"), menusetting, zNodesmenu);
	//$.fn.zTree.init($("#menutree2"), menusetting, zNodesmenu);
	initTree('menu1','code1',${areaString},'','body');

	openArea();	
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
				url:'<%=contextPath%>/area/areaList.do?qx=<s:property value="qx"/>',
				sortName: 'code',
				sortOrder: 'desc',
				idField:'code',
				columns:[[
				    {field:'code',title:'编号',width:200},
			        {field:'name',title:'名称',width:200},
					{field:'superior',title:'上级编号',width:200},
{field:'level',title:'级别',width:100},
					{field:'opt',title:'操作',width:100,align:'center'}
					]],
				toolbar:[<s:if test="%{qx!=null && qx==1}">{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
					    var cityObj = $("#menu2");
						cityObj.attr("value", "");
						initTree('menu2','code2',${areaString},'','win');
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
function add() {
	// $("input[name=status]").attr("checked","1");
	$('#name').val("");
	$('#code').val("");
	$('#superior').val("");
	$('#oldcode').val("");
 $('input:radio:last').attr('checked', 'checked');
 	$('#code').attr('readonly',false);
	flag=false;
initTree('menu2','code2',${areaString},'','jDialogContainer');
	$('#jDialogContainer').window('open'); 

}
	   
function search(){
	var name = $('#sname').val();
	var code1 = $('#code1').val();
	$('#tt2').datagrid({
		queryParams: {
			"search.name": name,"search.superior":code1
		}
	});
	displayMsg();  
}
 function edit(code,qx){
     var contextPath = $('#contextPath').val();
	  $.ajax({   
                   url : contextPath+'/area/findArea.do',  
					data:{"area.code":code},
                    type : 'POST',
					dataType : 'json',  
                    success : function(data) {
			            var contextPath=$('#contextPath').val();
						flag=false;
						$('#code').val(data.code);
						$('#oldcode').val(data.code);
						$('#name').val(data.name);
						$('#code').attr('readonly',true);					
						
						if(data.scbz=="0"){
						 $('input:radio[name=scbz]:nth(0)').attr('checked',true);

						}else if(data.scbz=="1"){
						$('input:radio[name=scbz]:nth(1)').attr('checked',true);
						}

						$('#level').val(data.level);
						if(qx==1){
						   $("#save").html("");
						 }
						 
					    $('#jDialogContainer').window('open'); 
						initTree('menu2','code2',${areaString},data.superior,'jDialogContainer');

					 
					}
                });
  
		
   }
   function getCodes(){

      $.ajax({
	     	type:'POST',
		 	url: "<%=contextPath%>/area/findCode.do",
			data:{"code":"dqjb"},
		 	error: function(){
		       		$("#info").val("服务器繁忙，请稍后重试...");
     		},
     		success: function(date){
			  var level=document.getElementById('level');
			  for (i=0;i< date.length;i++){ 
			    level.options.add(new Option(date[i].name,date[i].code)); 
				
				
			 }
			  	 
		    }
		 });
   }
</script>

</head>
<body class="easyui-layout" >
<input type="hidden" name="code1" id="code1"/>
<input type="hidden" name="code2" id="code2"/>
<s:hidden name="oldcode" id="oldcode"/>
<div data-options="region:'north'" style="overflow:hidden;">
<table width="98%" cellpadding=0>
<tr>    
	<td align="right" height="28">地区:</td>
	<td>
		<input id="menu1" type="text" value="" style="width:130px;" onClick="showMenu(this);"/>
	</td>
      <td align="right">名称:</td>
      <td><s:textfield  name="sname" id="sname" size="15"/></td>
      <td><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()" >查询</a></td>
</tr>
</table>

</div>
		<div data-options="region:'center',title:'区域列表'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
        
        
       <div id="jDialogContainer" class="easyui-window" title="区域设置"     
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
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">所属地区：</td>
				<td align="left">
					<input id="menu2" type="text" value="" style="width:130px;" onClick="showMenu(this,'win');"/>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td align="right" height="28">编 号：</td>
				<td width="74%"  align="left"> <s:textfield name="code"  id="code" cssClass="text"  size="20" onBlur="checkArea(this.value)"/></td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">名 称：</td>
				<td  align="left"> <s:textfield name="name"  cssClass="text" id="name" size="20" /></td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">级　别：</td>
				<td  align="left"> <select  name="level" id='level' ></select></td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
				<td align="right" height="28">是否有效：</td>
				<td  align="left"><s:radio name="scbz" id="scbz" list="#{'0':'停','1':'用'}"/> </td>
			</tr>
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
                <span id="save"><a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveArea()" >
                   保存 </a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('jDialogContainer')" >
                   取消 </a>
                </div>
                 </div>
			<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
				<ul id="menutree2" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
          </div>  

                
<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
	<ul id="menutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
	
</body>
</html>