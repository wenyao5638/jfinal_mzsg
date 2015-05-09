<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<%String contextPath=request.getContextPath(); %>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>高速交警涉案财物管理系统</title>
        
<!-- The stylesheet -->
<script src="<%=contextPath%>/interface/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min_main.js"></script>
	    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
	     <script type="text/javascript" src="<%=contextPath%>/js/outlook2.js"></script>



<%String dbstr=(String)request.getAttribute("dbstr"); %>
<%String tjstr=(String)request.getAttribute("tjstr"); %>


<script type="text/javascript">
$(function(){
	findDbtxTj();
	setInterval(findDbtxTj,600000);

		function findDbtxTj(){
				$.ajax({
					url: '<%=contextPath%>/findSl.do',
					type: "POST",
					dataType: "json",
					cache: false,
					beforeSend: function(result) {
					},
					success: function(result) {
					 
					  var m=result.length;
					  if(m>0){
							result="<span align=left>"+result+"</span>";
						 //  document.getElementById("qname").innerHTML=result;
							$.messager.show({
								align:'left',
								title:'工作任务提醒',
								msg:result,
								timeout:10000,
								height:300,
								width:250,
								showType:'show'
								
							});
						}
					}
				});
				
		}
		
  	});

function selectSearch(swlx,lx,swxh,zsysp_base_swxh){
	parent.addTab(swlx,"<%=contextPath%>/zsysp/zsysp_base.do?lx="+lx+"&swxh="+swxh+"&zsysp_base_swxh="+zsysp_base_swxh);
}

</script>
</head>

<body bgcolor="f1f1f1">
<img src="<%=contextPath%>/images/tx.png">
</body>
</html>
