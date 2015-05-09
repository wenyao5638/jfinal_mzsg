<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<html>
<head>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/user/js/user.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree_new.js"></script>

    
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>
<%String menuString1 = (String)request.getAttribute("areaString"); %>
<%String menuString2 = (String)request.getAttribute("roleString"); %>
<%String roleid = (String)request.getAttribute("roleid"); %> 
 <script>

 $(function(){
 	$("input[name=enabled][value=1]").attr("checked", true);

	initTree('menu1','code1',${areaString},'${user.area}','body');
	initTree('menu3','code3',${roleString},'','body');

	 var contextPath = $('#contextPath').val();

	openUser();	
	
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
				url:'<%=contextPath%>/user/userList',
				sortName: 'username',
				sortOrder: 'desc',
				idField:'username',
				columns:[[
					{field:'opt',title:'操作',width:120,align:'center'},
				    {field:'username',title:'用户名',width:60},
			        {field:'usercnname',title:'姓名',width:60},
					{field:'areaname',title:'所属部门',width:150},
					{field:'bmmc',title:'部门名称',width:120},
					{field:'phone',title:'联系电话',width:100},
					{field:'rolename',title:'角色',width:120},
					{field:'createuser',title:'添加人',width:80},
					{field:'createtime',title:'添加日期',width:120},
					{field:'lastlogintime',title:'最近登录时间',width:120}
					]],
				toolbar:[{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						var cityObj = $("#menu2");
						cityObj.attr("value", "");
						initTree('menu2','code2',${areaString},'','win');
	                    initTree('menu4','code4',${roleString},'','win');
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
	var username = $('#susername').val();
	var usercnname = $('#scnname').val();
	var area=$("#code1").val();
	var roleid=$('#code3').val();
	var enable=$("[name=enabled]:checked").val();
	//alert('123');
	//alert(username);
	//alert(usercnname);
	$('#tt2').datagrid({
		queryParams: {"search.username": username,"search.usercnname":usercnname,"search.role":roleid
			,"search.area":area,"search.syzt":enable}
	});
	//alert(username+","+usercnname+","+area+","+role+","+enable);
	displayMsg();  
}

 function edit(username,qx){
     var contextPath = $('#contextPath').val();
    
	  $.ajax({   
                   url : contextPath+'/user/findUser',  
					data:{"u.username":username},
                    type : 'POST',
					dataType : 'json',  
                    success : function(data) {
						// alert(data.lid);
					  //$('#area').val(data.area);
						$('#code2').val(data.area);
	                    $('#code4').val(data.roleid);
						$('#roleid').val(data.roleid);
						$('#username').val(data.username);
						$('#olduser').val(data.username);
						$('#menu2').val(data.area);
						
					  //$('#password').val(data.password);
						$('#phone').val(data.phone);
						$('#usercnname').val(data.usercnname);
					  //$('#lxdh').val(data.lxdh);
						$('#createtime').val(data.createtime);
   						$('#createuser').val(data.createuser);
   						
   					  //$('#lastlogintime').val(data.lastlogintime);
	                    $('#username').attr('readonly',true);
						$("input[name=xb][value="+data.xb+"]").attr("checked", true);
						$("input[name=enable][value="+data.enable+"]").attr("checked", true);
						initTree("menu2","code2",${areaString},'', 'win');
	                    initTree("menu4","code4",${roleString},'' ,'win');
						
	                    $('#menu2').val(data.areaname);
	                    $('#menu4').val(data.rolename);
						 flag=false;
						 if(qx==1){
						    $("#save").html("");
						}
					    $('#jDialogContainer').window('open'); 
					}
                });
   }
</script>
</head>
<body class="easyui-layout" >
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<input type="hidden" name="code1" id="code1"/>
<input type="hidden" name="code2" id="code2"/>
<input type="hidden" name="code3" id="code3"/>
<input type="hidden" name="code4" id="code4"/>
<div data-options="region:'north'" style="overflow:hidden; padding:5px;">
	<table width="90%" cellpadding=0>
<tr>
	<td align="right">地区:</td>
	<td><input id="menu1" type="text" value="" size="8" onClick="showMenu(this,'body');"/></td>
	<td align="right">用户名:</td>
	<td><input type="text"  name="susername" id="susername" size="8"/></td>
	<td align="right">姓名:</td>
	<td><input type="text" name="scnname" id="scnname" size="8"/></td>
</tr>
<tr>
	<td align="right">角色:</td>
	<td><input id="menu3" type="text" readonly value="" size="8" onclick="showMenu(this,'body');"/></td>
	<td align="right">状态:</td>
	<td>
		<input type="radio" name="enabled" value="1" id="enabled"/>启用
		<input type="radio" name="enabled" value="0" id="disenabled"/>注销
	</td>
	<td></td>
	<td><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()" >查询</a></td>
<tr>

</tr>
                </table>
</div>
		<div data-options="region:'center',title:'用户列表'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
        
        
         <div id="jDialogContainer" class="easyui-window" title="用户设置"  
     data-options="modal:true" minimizable="false"
        maximizable="false"  style=" padding:5px;background: #fafafa;" >  
     <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
              <TABLE width=80% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
		  <TR>
    <TD align=middle><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" ><tr bgcolor="#FFFFFF"><td width="74%" align="left"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
      <td width="26%"><s:hidden  name='createuser' id="createuser"/>
            <s:hidden  name='createtime' id="createtime"/>
            <s:hidden  name='lastlogintime' id="lastlogintime"/>
            <s:hidden  name='password' id="password"/>
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">所属地区：</td>
                  <td align="left">
				  	<input id="menu2" type="text" value="" style="width:130px;" onClick="showMenu(this,'win');"/>
				  </td>
                </tr>
             	<tr>
                  <td align="right" height="28">角色：</td>
                  <td  align="left"><input id="menu4" type="text" readonly value="" style="width:130px; " onclick="showMenu(this,'win');"/></td>
                </tr>
                <!--<tr bgcolor="#FFFFFF">
                  <td align="right" height="28">部门名称：</td>
                  <td align="left" ><s:textfield id="bmmc" name="bmmc"  cssClass="text" size="20" /></td>
                </tr>-->
              <tr bgcolor="#FFFFFF"><s:hidden name="olduser" id="olduser"/> 
                  <td align="right" height="28">用户名：</td>
                <td width="74%" align="left"><input type="text" name="username"  id="username" cssClass="text"  size="20" onBlur="checkUser(this.value)"/></td>
              </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">姓 名：</td>
                  <td align="left" ><input type="text" name="usercnname"  cssClass="text"  id="usercnname" size="20" /></td>
                </tr>
               
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">联系电话：</td>
                  <td align="left"><input type="text" name="phone"  cssClass="text"  id="phone" size="20" /></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">状态：</td>
                  <td align="left">
                  	<input type="radio" name="syzt" value="1" id="enabled"/>启用
					<input type="radio" name="syzt" value="0" id="disenabled"/>注销
                  </td>
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
               <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
               <span id="save"><a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveUser()">
                   保存</a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('jDialogContainer')" >
                   取消 </a>
       </div>
           </div>
</div>
            
 
	</body>
</html>