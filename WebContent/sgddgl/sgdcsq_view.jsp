<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	<c:set var="ctx" value="${pageContext.request.contextPath}" />

<head>
<%String contextPath = request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Border Layout on Panel - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/easyUI.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/photoTag.js"></script>
<script type="text/javascript" src="<%=contextPath%>/sglygl/js/sglygl.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/JqueryTree.js"></script>

<%String qxid = (String) request.getAttribute("qxid");%>
<%Map sgddMap = (Map) request.getAttribute("sgddMap");%>
<%String tjr = (String) request.getAttribute("tjr");%>
<%String tjrq = (String) request.getAttribute("tjrq");%>
	<%
		String menuString1 = (String) request.getAttribute("areaString");
	%>
<script>
var m;
var fname="社工调动申请清单";
 for(var i=0;i<parent.arrayObj.length;i++){
			var a=parent.arrayObj[i];

			if(a[0].id==fname){
			   m=i;
			   break;
			}
			
		}
$(document).ready(function(){
	$("#sgdcsp").validate({
		rules: {
			'search.xm':{
				required : true
			},
			'menu1':{
				required : true
			 
			},
			'search.xzw':{
				required : true
			},
			'search.sgrq':{
				required : true
			}
		}
	});							 	
});  


function updateSgdcsq(zt){
  $("#zt").val(zt);
	/**
	 * 防止重复提交校验
	 */
	var flag = $("#token").val();
	 // alert(flag);
	if (flag == false || flag == "false") {
		$.messager.alert("\u63d0\u793a\u4fe1\u606f", "\u8bf7\u52ff\u91cd\u590d\u63d0\u4ea4\uff01", "error");
		return;
	}
		$("#sgdcsp").form("submit", {onSubmit:function () {
			var valResult=$("#sgdcsp").validate().form();
			if (!valResult) {
		    	$.messager.alert('系统提示', '请完善录入信息','warning'); 
			}else{
				$.messager.progress(); 
			}	
					
				return valResult;
			}, success:function (result) {
					
			parent.reshT($("#name").val());
			//  alert(result);
			var res = eval("(" + result + ")");
					 
			if (res.success) {
				//parent.reshT("社工工资变动申请");
				showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
				//window.parent.addTab("社工工资变动申请","${ctx}/gzbd/gzbd.do","","");
				//  parent.reshg();
				 window.parent.closeTab(fname);
			} else {
				$("#token").val(true);
					showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
			}
			}
		});
}



				
		 $(function(){
		 	var isvisible = '<s:property value="#request.flag"/>';
			var szsq = '<s:property value="search.xsq"/>';
			if(isvisible == "view" || isvisible == "sb"){
				$("input").attr("disabled",true);
			   	$("select").attr("disabled",true);
			   	$("textarea").attr("disabled",true);
		 }
		 	
			   if(szsq==""){
				  initTree('menu1','code1',${areaString},'${user.area}');
			   }else{
				  initTree('menu1','code1',${areaString},'<s:property value="search.xsq"/>');
			   }
			 	//$("#code1").attr("value","${user.username}");
		 });
		 
function closeW(){
	window.parent.closeTab(fname);
}


//打开选择界面
 function dialog2(){
 	doAjaxOpen("dg","<%=contextPath%>/sgry/sgry_dialog.do","", "&m="+m,800,400,"jDialogContainer");
 }

 function data(data){
	  $("#xm").val(data.xm);
	  $("#jg").val(data.jg);
	  $("#xhkszd").val(data.hkszd);
	  $("#mz").val(data.mz);
	  $("#csny").val(data.csny);
	  $("#cjgzsj").val(data.cjgzsj);
	  $("#ysqname").val(data.sq);//ysq
	  $("#ysq").val(data.szsq);//ysq
	  $("#yzw").val(data.zw);
	 //$("#sysj").val(data.jsqsj);
	  $("#gzjl").val(data.jlxx);//gzjl
	  $("#jlcf").val(data.ylqk);
	  $("#ryid").val(data.id); 
	  $("#jszg").val(data.zgzs); 
	  $("#sysj").val(data.zgzssysj); 
	  $("#ryid").val(data.id); 
	  	var szsq = '<s:property value="search.xsq"/>';
	   if(szsq==""){
				  initTree('menu1','code1',${areaString},'${user.area}');
			   }else{
				  initTree('menu1','code1',${areaString},'<s:property value="search.xsq"/>');
			   }
	  //alert("id:"+data.id);
	 //var ryid = document.getElementById("ryid").value;
	 }
function closeWin(name){
	//alert(name);
  window.parent.closeTab(name);
 }
</script> 
</head> 
<body>
<center><h2>鄞州区社区专职工作人员调动审批表</h2></center>
<form id="sgdcsp" method="post"  name="sgdcsp"
	action="<%=contextPath%>/sgdcsq/updateSgdcsq.do">
 <input type="hidden" id="path" value="<%=contextPath%>" />
 <input type="hidden" id="token" value="true" />
 <input type="hidden" id="qxid" name="qxid" value="<s:property value='%{#request.qxid}'/>"/>
 <s:hidden name = "search.xsq" id="code1"/>
 <input type="hidden" id="ryid" name="search.ryid"/>
 <input type="hidden" id="zt" name="search.zt"/>
 <input type="hidden" id="ysq" name="search.ysq"/>

<s:hidden id="name" name="name" />

    <input type="hidden" name="id" id="id" value="<%=sgddMap.get("id")%>" />
	<table align="center" class="hovertable" border="0" cellpadding="0"cellspacing="0">		
	<tr>
		<td class="title">姓名</td>
		<td colspan="2"><s:textfield name="search.xm" id="xm" size="10" readOnly="true" /><input type="button" name="dialog" value="选择" onClick="dialog2()"></td>
		<td class="title" colspan="1">籍贯</td>
		<td colspan="1"><s:textfield name="search.jg" id="jg" size="10" readOnly="true" /></td>
		<td class="title" colspan="1">民族</td>
		<td colspan="1"><s:textfield name="search.mz" id="mz" size="10" readOnly="true" /></td>
		<td class="title" colspan="1">现户口所在地</td>
		<td colspan="2"><s:textfield name="search.xhkszd" id="xhkszd" size="20" readOnly="true" /></td>
	</tr>
	<tr>
	 	<td class="title" >出生<br>年月</td>
		<td colspan="2"><s:textfield name="search.csny" id="csny" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10" readOnly="true" /></td>
	 	<td class="title" colspan="1">入党、团时间</td>
		<td colspan="1"><s:textfield name="search.rdtsj" id="rdtsj" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10"  /></td>
	 	<td class="title" >参加工作时间</td>
		<td colspan="4"><s:textfield name="search.cjgzsj" id="cjgzsj" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10" readOnly="true" /></td>
	</tr>
	<tr>
		<td class="title"  rowspan="2">何时毕业何院校何专业</td>
		<td class="title" colspan="1">全日制教育</td>
		<td colspan="3"><s:textfield name="search.qrzjy" id="qrzjy" size="35"  /></td>
		<td class="title" >学位</td>
		<td colspan="4"><s:textfield name="search.qrzjyxw" id="qrzjyxw" size="20"  /></td>
	</tr>
	<tr>
		<td class="title" colspan="1">在职教育</td>
		<td colspan="3"><s:textfield name="search.zcjy" id="zcjy" size="35" /></td>
		<td class="title" >学位</td>
		<td colspan="4"><s:textfield name="search.zcjyxw" id="zcjyxw" size="20"  /></td>
	</tr>
		
	<tr>
		<td class="title" >原工作<br>单位</td>
		<td colspan="2"><s:textfield name="search.ysqname" id="ysqname" size="15" readOnly="true" /></td>
		<td class="title">原职务(岗位)</td>
		<td><s:textfield name="search.yzw" id="yzw" size="10" readOnly="true" /></td>
		<td class="title">技术资格</td>
		<td><s:textfield name="search.jszg" id="jszg" size="10" readOnly="true" /></td>
		<td class="title">授予时间</td>
		<td colspan="2"><s:textfield name="search.sysj" id="sysj" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10" readOnly="true" /></td>
	</tr>
	<tr>
		<td class="title">拟安排单位</td>
		<td colspan="2">
			<input id="menu1"  name="menu1" type="text" readonly="readonly" value="" style="width:120px;" onClick="showMenu(this);"/>
		</td>
		<td class="title" colspan="1">拟任职务岗位</td>
		<td colspan="3"><s:iterator value="%{#request.zwList}" id="Code">
			  <input type="checkbox" name="zw" id="zw" value="${code}" <s:iterator value="%{#request.zws}" id="zwname"><s:if test="%{#zwname==code}"> checked="checked" </s:if></s:iterator>>${name}&nbsp;&nbsp;&nbsp;
			</s:iterator></td>
<%--		<td colspan="4"><s:textfield name="search.xsq" id="xsq" size="35" readOnly="true" /></td>--%>
	<td class="title" colspan="1">上岗时间</td>
		<td colspan="2"><s:textfield name="search.sgrq" id="sgrq" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10" readOnly="true" /></td>
		
	
	</tr>
	<tr>
		<td class="title" colspan="1">工作<br>经历</td>
		<td colspan="9"><s:textarea name="search.gzjl" id="gzjl"  rows="7" cols="90"  /></td>
	</tr>
	<tr>
		<td class="title" colspan="1">何时何地<br>因何原因<br>受过奖励<br>或处分</td>
		<td colspan="9"><s:textarea name="search.jlcf" id="jlcf" rows="7" cols="90"  /></td>
	</tr>
	<tr>
		<td class="title" colspan="1">调动<br>原因</td>
		<td colspan="9"><s:textarea name="search.ddyy" id="ddyy" rows="3" cols="90"  /></td>
	</tr>
	<tr>
		<td class="title" colspan="1" rowspan="2">调出单位意见</td>
		<td colspan="4"><s:textarea name="search.tjyj" id="tjyj" rows="5" cols="35" /></td>
		<td class="title" colspan="1" rowspan="2">调入单位意见</td>
		<td colspan="4"><s:textarea name="search.jddrshyj" id="jddrshyj" rows="5" cols="35" readOnly="true"/></td>
	</tr>
	<tr>
		<td class="title" colspan="4">申请人：
		<input name="search.tjr" id="tjr" size="10" value="<%=tjr%>" readOnly="true"/>
			申请日期：
		<input name="search.tjrq" id="tjrq" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10" value="<%=tjrq%>" readOnly="true"/></td>
		<td class="title" colspan="4">审核人：
		<s:textfield name="search.jddrshr" id="jddrshr" size="10" readOnly="true" />
			审核日期：<s:textfield name="search.jddrshrq" id="jddrshrq" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10" readOnly="true" /></td>
	</tr>
	<tr>
		<td class="title" colspan="1" rowspan="2">区主管部门<br>意见</td>
		<td colspan="9"><s:textarea name="search.qspyj" id="qspyj" rows="6" cols="90" readOnly="true" /></td>
	</tr>
	<tr>
		<td class="title" colspan="9">审批人：<s:textfield name="search.qspr" id="qspr" size="10" readOnly="true" />
			审批日期：<s:textfield name="search.qsprq" id="qsprq" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="10" readOnly="true" /></td>
	</tr>
	</table>
    <br>
			
     
       <div region="south" border="false" style="text-align: center; height: 30px; line-height: 30px;">
   
        <s:if test="%{bz=='look'}">
	   <a id="" class="l-btn" href="javascript:void(0)" onClick="closeWin('社工调动申请清单');"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">关闭</span> </span>  </a>
	 
	 </s:if>
	 <s:elseif test="%{cz==0 &&(bz=='edit'|| bz=='sq')}">
		<a id="" class="l-btn" href="javascript:void(0)" onClick="updateSgdcsq('00')"> <span
			class="l-btn-left"> <span class="icon-add"
				style="padding-left: 20px;">保存</span> </span>  </a>&nbsp;&nbsp;
		<a class="l-btn" href="javascript:void(0)"
			onclick="updateSgdcsq('01')"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">上报</span> </span>  </a>
				</s:elseif>
				  <s:else>
	   <a id="" class="l-btn" href="javascript:void(0)" onClick="closeWin('社工调动申请清单');"> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">关闭</span> </span>  </a>
	 
	 </s:else>
       </div>
	   
	 
   </form>
     <div id="menuContent1"  
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
				<ul id='menu1tree' class='ztree' style='margin-top: 0; width: 200px; height: 200px;'></ul>s
	</div>


</body>
</html>