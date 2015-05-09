<%@ page contentType="text/html;charset=GBK" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%String contextpath = request.getContextPath(); %>
<HEAD>
<%String BT_CODE = request.getParameter("BT_CODE");
  String lx = request.getParameter("lx");
  String sqly = request.getParameter("sqly");
%>
<link href="css/default.css" rel=stylesheet>
</HEAD>
	
	<frameset rows="12%,*" cols="*" scrolling="no" frameBorder=0>
		<FRAME name="blank1" src="<%=contextpath%>/baseInfo/baseInfo_Framexx.jsp?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>&sqly=<%=sqly%>" border="0">
		<FRAME name="blank2" src="<%=contextpath%>/baseInfo/basetable_view.do?BT_CODE=<%=BT_CODE%>&lx=<%=lx%>&sqly=<%=sqly%>">		
	</FRAMESET>
	<noframes></noframes>

</HTML>
