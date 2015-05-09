<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<%String contextPath = request.getContextPath(); %>
<head>
<meta charset="UTF-8">
<title>角色管理</title>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css">
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:380px;overflow-y:scroll;overflow-x:auto;}
</style>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">

<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree_new.js"></script>

</head>
<%String adtreeString = (String)request.getAttribute("adtreeString"); %>
<%String menuString = (String)request.getAttribute("menuString"); %>
<%String roleid = (String)request.getAttribute("roleid"); %>



<script type="text/javascript">

	var treesetting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		var zNodes1 =[<%=adtreeString%>];//权限
		
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
	
		
 $(function(){
	initTree('role','roleid',${menuString},'','body');
	$.fn.zTree.init($("#tree1"), treesetting, zNodes1);//初始化权限联

	/*$.fn.zTree.init($("#menutree"), menusetting, zNodesmenu);//初始化角色联
	zTree_Menu = $.fn.zTree.getZTreeObj("menutree");
	curMenu = zTree_Menu;
	zTree_Menu.expandAll(curMenu);
	if(roleid!=null&&roleid!=""){
		var zTree = $.fn.zTree.getZTreeObj("menutree"),
		nodes = zTree.getNodeByParam("id",roleid,null);
		if(nodes!=null){
			var cityObj = $("#role");
			cityObj.attr("value", nodes.name);
			$('#roleid').val(roleid);
		}
	}*/
	
	$('#add').window('close');
});

	
function onClick(e, treeId, treeNode) {
	/*var zTree = $.fn.zTree.getZTreeObj("menutree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	if(treeNode.id.indexOf("a")!=-1){
		$.messager.alert('提示', '该节点不是角色!'); 
		return;
	}
	$('#roleid').val(treeNode.id);
	showrole();
	return false;*/
}

function onCheck(e, treeId, treeNode) {
	/*var zTree = $.fn.zTree.getZTreeObj("menutree"),
	nodes = zTree.getCheckedNodes(true),
	v = "";
	s = "";
	for (var i=0, l=nodes.length; i<l; i++) {
		if(nodes[i].id.indexOf("a")!=-1){
			return;
		}
		v += nodes[i].name;
		s += nodes[i].id;
	}
	var cityObj = $("#role");
	cityObj.attr("value", v);
	$('#roleid').val(s);*/
	
}


function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "role" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
		hideMenu();
	}
}
		
		
function showrole(){
	var roleid=$('#roleid').val();
	$.ajax({
				url: '<%=contextPath%>/role/showrole.do',
				data : {"role.roleid"  : roleid },
				type : "POST",
				success: function(data){	
				 // alert(data);			
					 $.fn.zTree.init($("#tree1"), treesetting, data);//初始化权限联
				},
                error: function(){
					$.messager.alert('提示', '系统繁忙，请稍后再试!'); 
				}
		});
		
	
}
		
function fpgn(){
	var ids1="",ids2="";
	var treeObj1 = $.fn.zTree.getZTreeObj("tree1");
	var nodes1=treeObj1.getCheckedNodes(true);
	for(var i=0;i<nodes1.length;i++){
		if(i>0){
			ids1+=",";
		}
    	ids1+="\""+nodes1[i].id+"\"";
   	}
   	if(ids1 ==null || ids1==""){
   		$.messager.alert('提示', '请先选择权限!');
   	}
	//alert(ids1);
	var treeObj2 = $.fn.zTree.getZTreeObj("roletree");
	var nodes2=treeObj2.getCheckedNodes(true);
	for(var i=0;i<nodes2.length;i++){
		if(i>0){
			ids2+=",";
		}
    	ids2+="\""+nodes2[i].id+"\"";
   	}
   	
   	/*
	alert(ids2);
	*/
	//alert(roleid);
	//alert( $('#roleid').val());
	$.ajax({
				url: '<%=contextPath%>/role/roleList_save.do',
				data : { ids1  : ids1,
						 ids2  : ids2,
						 roleid : $('#roleid').val()
				},
				type : "POST",
				success: function(){
					$.messager.alert('提示', '分配完成!'); 
				},
                error: function(){
					$.messager.alert('提示', '系统繁忙，请稍后再试!'); 
				}
		});
}
function findjlxx(){
      $.ajax({
				url: '<%=contextPath%>/role/findJlxx.do',
				type : "POST",
				success: function(data){				
					alert(data);
					$("#jlxx").html(data);
				},
                error: function(){
					$.messager.alert('提示', '系统繁忙，请稍后再试!'); 
				}
		});
		

}
function add() {
	$('#rolename').val("");
	$('#level').val("");
	$('#add').window('open');

}

function saveRole(){
	var rolename=$('#rolename').val();
	$.ajax({
				url: '<%=contextPath%>/role/role_save.do',
				data : { rolename  : rolename
				},
				type : "POST",
				success: function(data){
					　　　
					   $.ajax({
							url: '<%=contextPath%>/role/getRoleList.do',
							type : "POST",
							success: function(tree){	
							　　			
								initTree('role','roleid',tree,'','body');
								//alert(data.roleid);
								// $('#roleid').val(data.roleid);	
								// $('#role').val(data.rolename);	
								$.messager.alert('提示', '新增完成!'); 
					           $('#add').window('close');
							},
							error: function(){
								$.messager.alert('提示', '系统繁忙，请稍后再试!'); 
							}
						});
					 
					 
					
				},
                error: function(){
					$.messager.alert('提示', '系统繁忙，请稍后再试!'); 
				}
		});
}

function deleterole(){
	var roleid=$('#roleid').val()
  //alert($('#roleid').val());
	if(roleid==""){
		$.messager.alert('提示', '请先选择角色!'); 
	}else{
		$.messager.confirm('删除角色', '您确认删除此角色？', function(r){
			if(r){
			$.ajax({
				url: '<%=contextPath%>/role/role_delete.do',
				data : { "role.roleid"  : roleid
				},
				type : "POST",
				success: function(data){
				    
					
					   $.ajax({
							url: '<%=contextPath%>/role/getRoleList.do',
							type : "POST",
							success: function(tree){
							    $('#roleid').val("");	
								 $('#role').val("");					
								initTree('role','roleid',tree,'','body');
								$.fn.zTree.init($("#tree1"), treesetting, zNodes1);//初始化权限联
                               
								$.messager.alert('提示', '删除成功!'); 
					          
							},
							error: function(){
								$.messager.alert('提示', '系统繁忙，请稍后再试!'); 
							}
						});
					 
				},
                error: function(){
					$.messager.alert('提示', '系统繁忙，请稍后再试!'); 
				}
		});
			}
		})
	}
}

function closes(win){
	$('#'+win).window('close');
}

</script>

<body>
	
<form name="roleForm" method="post">

	<table width=100% height="400" border="1">
	  <tr>
	  	<td width="20%" rowspan="2" valign="top">
			<div style="margin:10px 0;">
				<a href="javascript:void(0)" class="easyui-linkbutton" onClick="add()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onClick="deleterole()">删除</a>
			</div>
			<input id="role" type="text" readonly value="" style="width:130px;" onClick="showMenu(this,'body');"/>
			

	  	</td>
	  	<td width="40%"  align="center">功能树</td>
      <tr>
        <td valign="top">
			<div class="content_wrap">
				<div class="zTreeDemoBackground left">
					<ul id="tree1" class="ztree"></ul>
				</div>
			</div>
		</td>
        
      </tr>
      <input type="hidden" name="role.roleid" id="roleid"/>
    </table>
    
    <div style="margin:10px 0;">
		<a href="javascript:void(0)" class="easyui-linkbutton" onClick="fpgn()">分配功能</a>
	</div>
	
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="menutree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
	</div>
	
	<div id="add" class="easyui-window" title="角色新增" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:500px;height:200px;padding:10px;">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" ><td width="26%">
		  
		    <tr bgcolor="#FFFFFF">
		      <td align="right" height="28">角色名称：</td>
		      <td width="74%"> <s:textfield name="rolename" id="rolename" cssClass="text"  size="20" /></td>
		    </tr>
             
		</table>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:saveRole()">保存</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:closes('add')">取消</a>
		</div> 
	</div>
	
	
</form>
</body>
</html>
