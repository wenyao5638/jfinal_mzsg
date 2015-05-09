<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Lomboz JSP</title>
</head>
<script>
alert("您登入的信息已经过期！请重新登入！");
parent.parent.location.href="<%=request.getContextPath()%>"; 
</script>
<body bgcolor="#FFFFFF">
</body>
</html>