<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();%>  
<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<%
		String menuString1 = (String) request.getAttribute("tree");
	%>

<html>
	<head>
		<title>社区管理</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/interface/css/zTreeStyle.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyUI.js"></script>
<script type="text/javascript" src="<%=path%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=path%>/js/photoTag.js"></script>
<script type="text/javascript" src="<%=path%>/sglygl/js/sglygl.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.ztree.excheck-3.5.js"></script>
<script language="javascript">
$(document).ready(function(){
  
	$("#sq").validate({
		rules: {
			
				
		}
	});							 	
});  
 function saveSq(form, winId, parentWinId) {
	/**
	 * 防止重复提交校验
	 */
	  var flag = $("#token").val();
	if (flag == false || flag == "false") {
		$.messager.alert("\u63d0\u793a\u4fe1\u606f", "\u8bf7\u52ff\u91cd\u590d\u63d0\u4ea4\uff01", "error");
		return;
	}
	if (winId && winId != "") {
	} else {
		winId = "jDialogContainer";
	}
	if (parentWinId && parentWinId != "") {
	} else {
		parentWinId = "dg";
	}
	//alert($("#code3").val());
	
	//alert($("#id").val());
	//alert($("#pid").val());
	//$("#lb").val("b18");
 $("#sq").form("submit", {onSubmit:function () {
	    var valResult=$("#sq").validate().form();
		
	    if (valResult) {
			$("#token").val(false);
		}
		
		return valResult;
	}, success:function (result) {
	   
		var res = eval("(" + result + ")");
	     
		if (res.success) {
		  
			showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
		//	closeDialog(winId);// data
			//window.parent.frames[--m].yerefresh(parentWinId);
			//var blbName ="学生思想动态研判工作记录";
		 window.parent.addTab("社区管理","${ctx}/sq/sq.do","","");
		  window.parent.closeTab("社区添加／修改");
		} else {
			$("#token").val(true);
		     
			showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
		}
	}
	});

} 

 
  $(function(){
	  <!--$.fn.zTree.init($("#menutree3"), menusetting, zNodesmenu1);
					<!--  var zTree = $.fn.zTree.getZTreeObj("menutree3");	
					<!--if("<s:property value='vo.pid'/>"!=""){			 
						<!--node = zTree.getNodeByParam("id","<s:property value='vo.pid'/>",null);
						<!--zTree.selectNode(node);
					
						<!--$("#menu3").attr("value", node.name);
						<!--$("#code3").attr("value", node.id);
					<!--}-->
	 });   
	



 
</script>
	</head>
<body>
<center><h2>社区信息表</h2></center>
<form id="sq" method="post"  name="sq"
	action="<%=path%>/sq/sq_save.do">
 <input type="hidden" id="token" value="true" />
<s:hidden id="id" name="vo.id" />
		<table align="center" class="hovertable" border="0" cellpadding="0"cellspacing="0">

		<tr class="title">
			<td colspan="4">
				<strong>社区信息</strong>
			</td>
		</tr>
	
		<tr>
			<td class="title">
				社区名称:
			</td>
			<td>
			     <s:textfield id="sqmc" name='vo.sqmc' size="30"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				社区类型:
			</td>
			<td>
			    <s:select list="#request.codes" listKey="code" listValue="name" name="vo.sqlx" id="sqlx"   headerKey="0" headerValue="--社区类型--" cssStyle="width:200px" ></s:select>
			</td>
			
		</tr>
		<tr>
			<td class="title">
				所属社区:
			</td>
			<td>
			     <s:select list="#request.areas" listKey="code" listValue="name" name="vo.sssq" id="sssq"   headerKey="0" headerValue="--所属社区--" cssStyle="width:200px" ></s:select>
			</td>
			<td class="title">
				成立时间:
			</td>
			<td>
			     <s:textfield id="clsj" name='vo.clsj' size="15" cssStyle="Wdate" readonly="true"
					onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日'})"   cssClass="search_inputl"/>
			</td>
			
		</tr>
			　<tr>
			<td class="title">
				区域面积（平方米）:
			</td>
			<td>
			     <s:textfield id="qymj" name='vo.qymj' size="15"   cssClass="search_inputl"/>
			</td>
			<td class="title">
				建筑面积（平方米）:
			</td>
			<td>
			     <s:textfield id="jzmj" name='vo.jzmj' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr class="title">
			<td colspan="4">
				<strong>社区四址</strong>
			</td>
		</tr>
		　<tr>
			<td class="title">
				东:
			</td>
			<td>
			     <s:textfield id="dzd" name='vo.dzd' size="40"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				南:
			</td>
			<td>
			     <s:textfield id="dzn" name='vo.dzn' size="40"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr>
			<td class="title">
				西:
			</td>
			<td>
			     <s:textfield id="dzx" name='vo.dzx' size="40"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				北:
			</td>
			<td>
			     <s:textfield id="dzb" name='vo.dzb' size="40"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr class="title">
			<td colspan="4">
				<strong>社区规模</strong>
			</td>
		</tr>
		　<tr>
			<td class="title">
				总户数:
			</td>
			<td>
			     <s:textfield id="zhs" name='vo.zhs' size="15"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				现入住户数:
			</td>
			<td>
			     <s:textfield id="xrzhs" name='vo.xrzhs' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr>
			<td class="title">
				总人口数:
			</td>
			<td>
			     <s:textfield id="zrks" name='vo.zrks' size="15"   cssClass="search_inputl"/>
			</td>
			<td class="title">
				常住人口数:
			</td>
			<td>
			     <s:textfield id="czrks" name='vo.czrks' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
		<tr class="title">
			<td colspan="4">
				<strong>社区服务中心</strong>
			</td>
		</tr>
		　<tr>
			<td class="title">
				位置:
			</td>
			<td>
			     <s:textfield id="fwzxwz" name='vo.fwzxwz' size="40"  cssClass="search_inputl"/>
			</td>
			<td class="title">
				面积（平方米）:
			</td>
			<td>
			     <s:textfield id="fwzxmj" name='vo.fwzxmj' size="10"  cssClass="search_inputl"/>
			</td>
			
		</tr>
	
		 
	</table>
    <div class="dialog-button">
		<a id="" class="l-btn" href="#" onclick="saveSq(this.form,'add')"
			onclick=" "> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">确认</span> </span> </a>
		
	</div></form>
	 <div id="menuContent3" class="menuContent"
			style="display: none; position: absolute;">
			<ul id="menutree3" class="ztree"
				style="margin-top: 0; width: 300px; height: 220px;"></ul>
		</div>

</body></html>