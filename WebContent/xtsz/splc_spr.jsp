<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<%String contextPath = request.getContextPath(); %>
<head>
<meta charset="UTF-8">
<title>审批人员管理</title>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css">
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:350px;overflow-y:scroll;overflow-x:auto;}
</style>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">

<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
</head>
<%String yxrytree = (String)request.getAttribute("yxrytree"); %>
<%String kxrytree = (String)request.getAttribute("kxrytree"); %>
<%String spmc = (String)request.getAttribute("spmc"); %>
<%String id = (String)request.getAttribute("id"); %>



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
		var zNodes1 =[<%=yxrytree%>];
		var zNodes2 =<%=kxrytree%>;
	
		
$(document).ready(function(){
	$.fn.zTree.init($("#tree1"), treesetting, zNodes1);
	$.fn.zTree.init($("#tree2"), treesetting, zNodes2);
});

function scry(){
	var id = "<%=id%>";
	var ids="";
	var treeObj = $.fn.zTree.getZTreeObj("tree1");
	var nodes=treeObj.getCheckedNodes(true);
	if(nodes.length==0){
		alert("请选择要删除的人员！");
		return false;
	}
	for(var i=0;i<nodes.length;i++){
		if(i>0){
			ids+=",";
		}
    	ids+="\""+nodes[i].id+"\"";
   	}
	form.action="<%=contextPath%>/code/scry.do?id="+id+"&ids="+ids;
	form.submit();	
}

function tjry(){
	var id = "<%=id%>";
	var ids="";
	var treeObj = $.fn.zTree.getZTreeObj("tree2");
	var nodes=treeObj.getCheckedNodes(true);
	if(nodes.length==0){
		alert("请选择要添加的人员！");
		return false;
	}
	for(var i=0;i<nodes.length;i++){
		if(i>0){
			ids+=",";
		}
    	ids+="\""+nodes[i].id+"\"";
   	}
	form.action="<%=contextPath%>/code/tjry.do?id="+id+"&ids="+ids;
	form.submit();	
}

</script>

<body>
	
<form name="form" method="post">
	<table width=100% height="400" border="1">
	<tr>
	<td colspan="2" align="center"><%=spmc %></td>
	</tr>
	  <tr>
	  	<td width="50%"  align="center">已选人员</td>
	  	<td width="50%"  align="center">可选人员</td>
	 </tr>
      <tr>
        <td valign="top">
			<div class="content_wrap">
				<div class="zTreeDemoBackground left">
					<ul id="tree1" class="ztree"></ul>
				</div>
			</div>
		</td>
		<td valign="top">
			<div class="content_wrap">
				<div class="zTreeDemoBackground left">
					<ul id="tree2" class="ztree"></ul>
				</div>
			</div>
		</td>
        
     </tr>
     <tr><td colspan="2" align="center">
     <a href="#" class="easyui-linkbutton" onClick="tjry()">添加</a>
		<a href="#" class="easyui-linkbutton" onClick="scry()">删除</a>
     </td></tr>
    </table>	
</form>
</body>
</html>
