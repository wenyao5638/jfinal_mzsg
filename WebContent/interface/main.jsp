<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="keywords" content=''/>
<meta name="description" content=""/> 
<title>鄞州区社区专职工作者信息管理系统</title>
    <%
			String contextPath = request.getContextPath(); 
			String tree=(String)session.getAttribute("tree");
			String info=(String)request.getAttribute("info");
		%>		
<script src="<%=contextPath%>/interface/js/jquery.js" type="text/javascript"></script>
<script src="<%=contextPath%>/interface/js/init.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/interface/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/interface/js/common.js"></script>
            <!--[if IE 6]>
<script src="<%=contextPath%>/interface/js/DD_belatedPNG_0.0.8a.js" mce_src="<%=contextPath%>/interface/js/DD_belatedPNG_0.0.8a.js"></script>
<script type="text/javascript">
   DD_belatedPNG.fix('background-image ,  .png_bg'); 
</script>
<![endif]-->
<!--[if lte IE 6]>
       <style type="text/css">
       body { behavior:url("css/csshover.htc"); }
       </style>
<![endif]-->

   	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/common.css"/>

    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
    <script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
     <script type="text/javascript" src="<%=contextPath%>/js/outlook2.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min_main.js"></script>
   <script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>

<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>

    <script>     
	$(function() {
		openfkyj();
	});
		
		function tcxt(){
		
		     $.messager.confirm('退出系统', '您确定退出系统？', function(r){
					if(r){
					    					
					 $.ajax( {
								url :   '<%=contextPath%>/user/logout.do',
								type : 'POST',
								dataType : 'json',
								error:function() {
									 top.location.href='<%=contextPath%>/login.jsp';
								 },
								success : function() {
									 top.location.href='<%=contextPath%>/login.jsp';
								 }
						});	
					}
				});
	
		}

<%String str = (String)request.getAttribute("treeString");
//System.out.println("str20141027:"+str);
 %>
 
	//	<!--
		var curMenu = null, zTree_Menu = null;
		var setting = {
			view: {
				showLine: true,
				selectedMulti: false,
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onNodeCreated: this.onNodeCreated,
				beforeClick: this.beforeClick,
				onClick: this.onClick
			}
		};

		var zNodes =[<%=str%>];
		//alert(zNodes);

		function beforeClick(treeId, node) {
			if (node.isParent) {
				if (node.level === 0) {
					var pNode = curMenu;
					while (pNode && pNode.level !==0) {
						pNode = pNode.getParentNode();
					}
					if (pNode !== node) {
						var a = $("#" + pNode.tId + "_a");
						a.removeClass("cur");
						zTree_Menu.expandNode(pNode, false);
					}
					a = $("#" + node.tId + "_a");
					a.addClass("cur");

					var isOpen = false;
					for (var i=0,l=node.children.length; i<l; i++) {
						if(node.children[i].open) {
							isOpen = true;
							break;
						}
					}
					if (isOpen) {
						zTree_Menu.expandNode(node, true);
						curMenu = node;
					} else {
						zTree_Menu.expandNode(node.isParent?node:node, true);
						curMenu = node;
					}
				} else {
					zTree_Menu.expandNode(node);
				}
			}
			return !node.isParent;
		}
		function onClick(e, treeId, node) {
			var name = node.name;
			if(node.id=="9999"){
				parent.location.href="login.jsp"; 
			}
			if(node.href.indexOf("#")<0){
				
				addTab(name,node.href,node.icons,node.id);
			}else{
				alert("该菜单下没有子菜单！！");
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			zTree_Menu = $.fn.zTree.getZTreeObj("treeDemo");
		//	zTree_Menu.expandAll(true);
//			curMenu = zTree_Menu.getNodes()[0];
//			zTree_Menu.expandNode(curMenu);
			var a = $("#" + zTree_Menu.getNodes()[0].tId + "_a");
		//	add
			a.addClass("cur");
			//提示(用于密码为123456时提示用户修改密码)
//			var info = "<%=info%>";
//			if(info!="null"&&info!=""){
//				 $.messager.alert('系统提示', info, 'warning'); 
//			}
		});
		//-->
		
function openXgmm(){
	window.open('<%=contextPath%>/xgmm.jsp', '修改密码',
 	'toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=yes,resizable=no,copyhistory=no,width=400,height=200, left=300,top=300');
}
function serverLogin(){
     var  txtNewPass=$("#txtNewPass").val();
	 var txtRepass=$("#txtRePass").val();
	 if(txtNewPass==""){
		 msgShow('系统提示', '请输入新密码', 'warning'); 
	 }else if (txtNewPass.length<6) {
	  msgShow('系统提示', '新密码有误,长度必须大于6位','warning'); 
	 }else if(txtNewPass!=txtRepass){
	  msgShow('系统提示', '新密码跟确认密码不一致,请核对','warning');  
	 }else{
	    	$.ajax( {
			url :   '<%=contextPath%>/user/updateXgmm.do',
			data : {
				"password" : txtNewPass
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('提示', '密码修改出现错误');
			},
			success : function(data) {
			      msgShow('系统提示', '密码修改成功！','warning'); 
				  closes('w');  
				  
				}
			});
	 }
}
function changeCurrentTabTitle(newtitle,url){ 
	closeTab(newtitle);
	var currTab = $('#tabs').tabs('getSelected'); //这个也可以 
	$('#tabs').tabs('update',{tab:currTab,options:{title:newtitle,content:createFrame(url)}}); 
} 
function openfkyj() {
	$('#fkyj').window( {
		title : '用户意见反馈单',
		width : 600,
		modal : true,
		shadow : true,
		closed : true,
		height : 360,
		top:($(window).height() - 360) * 0.5,   
        left:($(window).width() - 600) * 0.5,
		resizable : false
	});
}
function fkyj() {
	 $('#fkyj').window('open');
	 
	 var dateStr = getdate();
	//alert(dateStr);
	$('#fkyjStr').val("");
	 document.getElementById("fksj").value = dateStr;
}
function getdate(){
	var now=new Date()
	y=now.getFullYear()
	m=now.getMonth()+1
	d=now.getDate()
	m=m<10?"0"+m:m
	d=d<10?"0"+d:d
	return y+"-"+m+"-"+d
} 
//取消
function closes(win){
    $('#'+win).window('close');
    
 }

function saveFkyjck() {
	//var mc=$('#menu2').val();
	var id=$('#id').val();
	var jbdw=$('#jbdw').val();
	var fkr=$('#fkr').val();
	var fksj=$('#fksj').val();
	var fkyj=document.getElementById("fkyjStr").value;
	//alert(fkyj);
  	save(id,jbdw,fkr,fksj,fkyj);
}
function save(id,jbdw,fkr,fksj,fkyj) {
	//alert("123");
		var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/fkyjck/updateFkyjck.do',
			data : {
				"fkyjck.id" : id,
				"fkyjck.jbdw" : jbdw,
				"fkyjck.fkr" : fkr,
				"fkyjck.fksj" : fksj,
				"fkyjck.fkyj" : fkyj
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '保存失败!','warning');
			},
			success : function(data) {
				  
				   $('#fkyj').window('close');
				   $.messager.alert('系统提示', '意见反馈保存成功!','warning');
				}
			});
 }

	</script>     
<%--	<style type="text/css">--%>
<%--.ztree li a.level0 {width:190px;height: 20px; text-align: center; display:block; background-color: #3E89C3; border:1px silver solid;}--%>
<%--.ztree li a.level0.cur {background-color: #50B3FE; }--%>
<%--.ztree li a.level0 span {display: block; color: white; padding-top:3px; font-size:12px; font-weight: bold;word-spacing: 2px;}--%>
<%--.ztree li a.level0 span.button {	float:right; margin-left: 10px; visibility: visible;display:none;}--%>
<%--.ztree li span.button.switch.level0 {display:none;}--%>
<%--	</style>--%>

</head>
<body class="easyui-layout" >
  <input type="hidden" value="<%=contextPath%>"   name="contextPath" id="contextPath"/>

<!--<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>-->
    <div region="north" split="true" border="false" style="background-image:url(<%=contextPath%>/images/bgd.png);overflow: hidden; height: 122px;  line-height: 40px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
    <div class="header" style="left::left">
  <div class="logo" style="left:left"><img src="images/logo.png"/></div>  
  
</div>
<div class="maxnav">
     	<div class="maxnavleft png_bg">系统公告：您好，欢迎你<s:property value='%{#session.user.usercnname}'/>&nbsp&nbsp<s:property value='%{#session.user.bmmc}'/></div>
        <div class="nav">
          	<a href="javascript:tcxt()" class="libg6 png_bg" >退出</a>
            <a href="javascript:openXgmm()" class="libg4 png_bg" >密码修改</a>
            <a href="javascript:reshT('欢迎使用')" class="libg1 png_bg" >首 页</a>          
        </div>
	</div>
    
    </div> 
    


  
    <div region="west" split="true" title="菜单导航" style="width:220px;"  id="west">
        <div id="tree">
		  <div class="content_wrap" id="test">
			  <div class="zTreeDemoBackground left">
			  	<ul id="treeDemo" class="ztree" style="width:180px;  overflow-x:hidden;overflow-y:hidden"></ul>
			  </div>
		  </div>		
		</div>
    </div>
    
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false">
			<div title="欢迎使用" icon="icon-home" style="padding:1px;overflow:hidden; color:red;"  >
				<iframe src="<%=contextPath%>/interface/first.jsp" scrolling="no" height="100%" width="100%"  frameborder="0"></iframe> 
			</div>
           
		</div>
    </div>
   
     <div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
	</div>

</body>
</html>

