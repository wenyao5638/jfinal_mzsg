<%@ page contentType="text/html;charset=GBK" language="java"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%String contextPath = request.getContextPath(); %>
<head>
<link href="../styles/Vertical Menu 13/style.css" rel=stylesheet type="text/css" />

<script language="javascript">
function onChange(xh){
	if(xh=="1"){
		document.getElementById("menu1").background = "<%=contextPath%>/images/xzbg.gif";
		document.getElementById("menu2").background = "<%=contextPath%>/images/wxbg.gif";
		document.getElementById("menu3").background = "<%=contextPath%>/images/wxbg.gif";
	}
	if(xh=="2"){
		document.getElementById("menu1").background = "<%=contextPath%>/images/wxbg.gif";
		document.getElementById("menu2").background = "<%=contextPath%>/images/xzbg.gif";
		document.getElementById("menu3").background = "<%=contextPath%>/images/wxbg.gif";
	}
	if(xh=="3"){
		document.getElementById("menu1").background = "<%=contextPath%>/images/wxbg.gif";
		document.getElementById("menu2").background = "<%=contextPath%>/images/wxbg.gif";
		document.getElementById("menu3").background = "<%=contextPath%>/images/xzbg.gif";
	}
}
</script>
        
</head>
<%String BT_CODE= (String)request.getParameter("BT_CODE");%>
<%String lx= (String)request.getParameter("lx");%>
<%String sqly= (String)request.getParameter("sqly");%>
<script language="JavaScript" src="js/basetable.js"></script>

<body scroll="no" bottommargin="0">
<table width="95%" border="0">
	<tr>
	<tr>
	<td width="160" height="34"><table width="156" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="39" valign="top" background="<%=contextPath%>/images/xzbg.gif" id="menu1"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" align="center"><span class="copy2"><a href="<%=contextPath%>/baseInfo/basetable_view.do?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>&sqly=<%=sqly%>" onClick="onChange('1')" target=blank2>妇女信息</a></span></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
    <td width="160"><table width="156" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="39" valign="top" background="<%=contextPath%>/images/wxbg.gif" id="menu2"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" align="center"><span class="copy2"><a href="<%=contextPath%>/baseInfo/husband_view.do?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>&sqly=<%=sqly%>" onClick="onChange('2')" target=blank2>丈夫信息</a></span></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
    <td width="160"><table width="156" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="39" valign="top" background="<%=contextPath%>/images/wxbg.gif" id="menu3"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" align="center"><span class="copy2"><a href="<%=contextPath%>/baseInfo/nursing_view.do?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>&sqly=<%=sqly%>" onClick="onChange('3')" target=blank2>生养信息</a></span></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
	<td></td>
<!--		<td width="10%"></td>
		<td width="30%"><a href="<%=contextPath%>/baseInfo/basetable_view.do?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>" target=blank2 >妇女信息</a></td>
		<td width="30%"><a href="<%=contextPath%>/baseInfo/husband_view.do?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>" target=blank2>丈夫信息</a></td>
		<td width="30%"><a href="<%=contextPath%>/baseInfo/nursing_view.do?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>" target=blank2>生养信息</a></td>
-->		
	</tr>
</table>
 
</body>
</html>