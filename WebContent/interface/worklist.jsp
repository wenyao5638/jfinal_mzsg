<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<%String contextPath=request.getContextPath(); %>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>再生育审批管理平台</title>
        
<!-- The stylesheet -->
<link href="<%=contextPath%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/css/ziti.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<%String dbstr=(String)request.getAttribute("dbstr"); %>
<%String tjstr=(String)request.getAttribute("tjstr"); %>


<script type="text/javascript">
function selectSearch(swlx,lx,swxh,zsysp_base_swxh){
	parent.addTab(swlx,"<%=contextPath%>/zsysp/zsysp_base.do?lx="+lx+"&swxh="+swxh+"&zsysp_base_swxh="+zsysp_base_swxh);
}
</script>
</head>

<body>
	
<form name="worklistForm" method="post">
	
	<table width=100% height="100%" border="1">
	  <tr>
	  	<td width="50%" height="30" align="center">待办工作</td>
	  	<td width="50%" height="30" align="center">统计</td>
      <tr>
        <td valign="top">
        	<br/>
        	<%=dbstr%>
		</td>
        <td valign="top">
        	<br/>
        	<%=tjstr%>
		</td>
      </tr>
    </table>
	
	
</form>
</body>
</html>
