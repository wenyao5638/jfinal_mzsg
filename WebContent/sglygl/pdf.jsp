<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<HTML>
<%String path = request.getContextPath();%>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</HEAD>
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<%String url=(String)request.getAttribute("url"); 

%>

<script language="javascript">
$(function(){
	window.location.href="<%=url%>";
})
</script>

<BODY>
</BODY>
</HTML>
