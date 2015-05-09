<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/user/js/user.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
    
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>
<%String menuString1 = (String)request.getAttribute("areaString"); %>
<%String menuString2 = (String)request.getAttribute("roleString"); %>
<%String roleid = (String)request.getAttribute("roleid"); %> 
 <script>
var zNodesmenu1 =<%=menuString1%>;
var zNodesmenu2 =<%=menuString2%>;
var menusetting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick,
				onCheck: onCheck
			}
		};
	var roleid = "<%=roleid==null?"":roleid%>";
 
  var code="<s:property value='%{user.area}'/>";
 $(function(){
 	$("input[name=ssyzt][value=1]").attr("checked", true);
//地区
	$.fn.zTree.init($("#menutree1"), menusetting, zNodesmenu1);
	$.fn.zTree.init($("#menutree2"), menusetting, zNodesmenu1);
//角色	
	$.fn.zTree.init($("#menutree3"), menusetting, zNodesmenu2);
	$.fn.zTree.init($("#menutree4"), menusetting, zNodesmenu2);

	var zTree = $.fn.zTree.getZTreeObj("menutree1");
	node = zTree.getNodeByParam("id","<s:property value='#request.userarea'/>",null);
	zTree.selectNode(node);
	var cityObj = $("#menu1");
	cityObj.attr("value", node.name);
	
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
				url:'<%=contextPath%>/user/userList.do',
				sortName: 'username',
				sortOrder: 'desc',
				idField:'username',
				columns:[[
					{field:'opt',title:'操作',width:50,align:'center'},
				    {field:'username',title:'用户名',width:100},
			        {field:'cnname',title:'姓名',width:100},
					{field:'area',title:'所属区域',width:100},
					{field:'code',title:'所属编码',width:100},
					{field:'role',title:'角色',width:120},
					{field:'createuser',title:'添加人',width:80},
					{field:'createtime',title:'添加日期',width:120},
					{field:'lastlogintime',title:'最近登录时间',width:120},
					{field:'opt2',title:'初始化',width:50,align:'center'},
					{field:'opt3',title:'删除',width:50,align:'center'}
					]],
				toolbar:[{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						
						var cityObj = $("#menu2");
						cityObj.attr("value", "");
						add();
					}
				},'-',{
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
	var username = $('#susername').val();
	var cnname = $('#scnname').val();
	var area=$("#code1").val();
	var role=$('#code3').val();
	var syzt=$("[name=ssyzt]:checked").val();
	$('#tt2').datagrid({
		queryParams: {"search.username": username,"search.usercnname":cnname,"search.role":role
			,"search.area":area,"search.syzt":syzt}
	});
	displayMsg();  
}
</script>
</head>
<body class="easyui-layout" >
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<input type="hidden" name="code1" id="code1"/>
<input type="hidden" name="code2" id="code2"/>
<input type="hidden" name="code3" id="code3"/>
<input type="hidden" name="code4" id="code4"/>
<div data-options="region:'north'" style="overflow:hidden;">
	<table width="98%" cellpadding=0>
<tr>
	<td align="right" height="28">地区:</td>
	<td width="100"><input id="menu1" type="text" value="" style="width:130px;" onClick="showMenu(this);"/></td>
	<td align="right">用户名:</td>
	<td align="left"><s:textfield  name="susername" id="susername" size="8"/></td>
	<td align="right">姓名:</td>
	<td><s:textfield name="scnname" id="scnname" size="8"/></td>

</tr>
	<td align="right">角色:</td>
	<td width="100"><input id="menu3" type="text" readonly value="" style="width:130px;" onclick="showMenu(this);"/> </td>
	<td align="right">状态:</td>
	<td align="left"><s:radio name="ssyzt" list="#{'1':'启用','2':'注销'}"  id="ssyzt" /></td>
	<td width="102"><a id="btnEp" class="easyui-linkbutton"  href="javascript:search()" >查询</a></td>
<tr>

</tr>
                </table>
</div>
		<div data-options="region:'center',title:'用户列表'" style="background:#fafafa; padding:0px;overflow:hidden">
			<table id="tt2" bgcolor="#FFFFFF"></table>
		</div>
        
        
         <div id="add" class="easyui-window" title="用户设置"  
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
				  	<input id="menu2" type="text" value="" style="width:130px;" onClick="showMenu(this);"/>
				  </td>
                </tr>
             <tr>
                  <td align="right" height="28">角色：</td>
                  <td  align="left"><input id="menu4" type="text" readonly value="" style="width:130px;" onclick="showMenu(this);"/></td>
                </tr>
              <tr bgcolor="#FFFFFF"><s:hidden name="olduser" id="olduser"/> 
                  <td align="right" height="28">用户名：</td>
                <td width="74%" align="left"><s:textfield name="username"  id="username" cssClass="text"  size="20" onBlur="checkUser(this.value)"/></td>
              </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">姓 名：</td>
                  <td align="left" ><s:textfield name="cnname"  cssClass="text"  id="cnname" size="20" /></td>
                </tr>
               
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">手 机：</td>
                  <td align="left"><s:textfield name="phone"  cssClass="text"  id="phone" size="20" /></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">联系电话：</td>
                  <td align="left"><s:textfield name="lxdh"  cssClass="text"  id="lxdh" size="20" /></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right" height="28">状态：</td>
                  <td align="left"><s:radio name="syzt" list="#{'1':'启用','2':'注销'}" id="syzt"/></td>
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
               <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
               <span id="save"><a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveUser()" >
                   保存</a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('add')" >
                   取消 </a>
       </div>
           </div>
		<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
			<ul id="menutree2" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>    
		<div id="menuContent4" class="menuContent" style="display:none; position: absolute;">
			<ul id="menutree4" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		</div> 
</div>
            
<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
	<ul id="menutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>                  
<div id="menuContent3" class="menuContent" style="display:none; position: absolute;">
	<ul id="menutree3" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>   
 
	</body>
</html>