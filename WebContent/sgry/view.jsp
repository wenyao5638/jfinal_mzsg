<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="vo.Img"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/WEB-INF/photo"%>
<%String contextPath = request.getContextPath();%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%String hdlb = (String)request.getAttribute("hdlb");%>
<%String id = (String)request.getAttribute("id"); %>	
<head>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css" />
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

</head>
<style type="text/css">
	ul.ztree {
		margin-top: 10px;
		border: 1px solid #617775;
		background: #FFFFFF;
		width: 98%;
		height: 400px;
		overflow-y: scroll;
		overflow-x: auto;
	}
</style>
	<%
		String menuString1 = (String) request.getAttribute("areaString");
	%>
	<script type="text/javascript">
	  $("#sgry").validate({
		rules: {
			'vo.xm':{
				required : true
			},
			'vo.xb':{
				valueNotEquals: "-1"
			},
			'vo.mz':{
				valueNotEquals: "0"
			},
			'vo.zjlx':{
				valueNotEquals: "0"
			},
			'vo.csny':{
				required : true
			},
			'vo.whcd':{
				valueNotEquals: "0"
			},
			'vo.zzmm':{
				valueNotEquals: "0"
			},
			'vo.hyzk':{
				valueNotEquals: "0"
			},
			'vo.ryly':{
				valueNotEquals: "0"
			},
			'vo.hkxx':{
				valueNotEquals: "0"
			},
			'vo.hyzk':{
				valueNotEquals: "0"
			},
			'vo.ldhtqdqk':{
				valueNotEquals: "0"
			},
			'vo.zgzs':{
				valueNotEquals: "0"
			},
			
			
			'vo.zjhm':{
				required : true,
				isIdCardNo : true 
			},
			'vo.jsqsj':{
				required : true
			},
			'menu1':{
				required : true
			},'vo.cjgzsj':{
				required : true
			},'vo.zw':{
				required : true
			}
		},
		highlight: function(element, errorClass) {
	        $(element).removeClass(errorClass);
	    }
	  });
	var m;
var fname="社工信息";

 for(var i=0;i<parent.arrayObj.length;i++){
			var a=parent.arrayObj[i];

			if(a[0].id==fname){
			   m=i;
			   break;
			}
			
		}
				
		 $(function(){
			 var isvisible = '<s:property value="cz"/>';
			  var szsq = '<s:property value="vo.szsq"/>';
			//  alert(isvisible);
			   if(isvisible == "0" ){
			   	$("input").attr("disabled",true);
			   	$("select").attr("disabled",true);
			   	$("textarea").attr("disabled",true);
			   }
			 
			     if(szsq==""){
					initTree('menu1','code1',${areaString},'${user.area}');
					}else{
					 initTree('menu1','code1',${areaString},'<s:property value="vo.szsq"/>');
					}
			 
			 	//$("#code1").attr("value","${user.username}");
		 });

				
	
		 function closeWi(){
		  window.parent.closeTab(fname);
		 }
 function saveSgry(zt) {
	   
	/**
	 * 防止重复提交校验
	 */
	  var flag = $("#token").val();
	 // alert(flag);
	if (flag == false || flag == "false") {
		$.messager.alert("\u63d0\u793a\u4fe1\u606f", "\u8bf7\u52ff\u91cd\u590d\u63d0\u4ea4\uff01", "error");
		return;
	}

	
	
 
			 $("#sgry").form("submit", {onSubmit:function () {
				   var valResult=$("#sgry").validate().form();
					if (!valResult) {
   					//	$("#token").val(false);
		    			$.messager.alert('系统提示', '请完善录入信息','warning'); 
			        }else{
					    $.messager.progress(); 
					}	
					
					return valResult;
				}, success:function (result) {
					
					 parent.reshT($("#name").val());
				//alert(result);
					var res = eval("(" + result + ")");
					 
					if (res.success) {
					     //parent.reshT("社工工资变动申请");
						showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
					   //window.parent.addTab("社工工资变动申请","${ctx}/gzbd/gzbd.do","","");
					 //  parent.reshg();
					
					   window.parent.closeTab(fname);
					} else {
						$("#token").val(true);
						  $.messager.progress('close'); 
						showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
					}
				}
				});
	  

} 
function gzdd(lb){
 var dj="";
 var name="";
 var je="";
  if(lb=='01'){
     name="zygzdj";
     je="zydjgz";
	 dj=$("#"+name).val();
	  $("#gwdj").val(dj);
	  $("#dqjtdj").val(dj);
	   $("#zyzgjtdj").val(dj);
  }else if(lb=='02'){
     name="gwdj";
    je="gwgz";
		dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	  //$("#xdqjtdj").val(dj);
	  // $("#xzyzgjtdj").val(dj);
  }else if(lb=='03'){
     name="dqjtdj";
     je="dqjt";
	 dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	 // $("#xgwdj").val(dj);
	 //  $("#xzyzgjtdj").val(dj);
  }else if(lb=='04'){
     name="zyzgjtdj";
     je="zyzgjt";
	  dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	 // $("#xgwdj").val(dj);
	  // $("#xdqjtdj").val(dj);
  }
 sz("01",$("#zygzdj").val(),"zydjgz");
 sz("02",$("#gwdj").val(),"gwgz");
 sz("03",$("#dqjtdj").val(),"dqjt");
 sz("04",$("#zyzgjtdj").val(),"zyzgjt");
 

}
function sz(lb,dj,je){
	var path=$("#path").val();
  $.ajax({
	     	type:'POST',
		 	url: "<%=contextPath%>/djgz/findDjgz.do",
			data:{"lb":lb,"dj":dj},
		 	error: function(){
		       		$("#info").val("服务器繁忙，请稍后重试...");
     		},
     		success: function(data){
			  if(data!=null){
				 $("#"+je+"").val(data.je); 
			  }
			 
		    }
		 });
 
}
	</script>



<body>
<center><h2>宁波市鄞州区社区专职工作者录用登记表</h2></center>
<form id="sgry" method="post" action="<%=contextPath%>/sgry/sgry_save.do">
	<s:hidden name ="vo.id" id = "id"></s:hidden>
	 <input type="hidden" id="path" value="<%=contextPath%>" />
	<s:hidden name = "vo.zt" id="zt" value="%{vo.zt}"/>
	<s:hidden name = "flag" id="flag" value="%{#request.flag}"/>
<s:hidden id="name" name="name"  value="社工信息修改"/>

	<s:hidden name = "vo.szsq" id="code1"/>
	<s:hidden name = "vo.yzze" id="yzze"/>
	<s:hidden name = "zt" id="ztm"/>
		<s:hidden name = "vo.lzsj" id="lzsj"/>
		<s:hidden name = "vo.lzly" id="lzly"/>
          <s:hidden name = "vo.jrly" id="jrly"/>
		<table align="center" class="hovertable" border="0" cellpadding="0"cellspacing="0">
	
		<tr class="title" height="29px">
			<td colspan="4">
				街道（镇）  （盖章）:
			</td>
			<td colspan="3" align="center">
				申请日期：<s:property value="%{vo.czrq}"/>
			</td>
		</tr>
		<tr>
		 	<td class="title">
				<div style="width: 70px;"><font color="red">*</font>姓  名:</div>
			</td>
			<td>
				<s:textfield name="vo.xm" size="8"/>
			</td>	
		 	<td class="title">
				<div style="width: 70px;"><font color="red">*</font>性别:</div>
			</td>
			<td width="60%">
			<s:select name ="vo.xb" id="xb" list="#request.xbList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.xb}"  cssStyle="width:60px"/>
			</td>
		 	<td class="title">
				<div style="width: 60px;"><font color="red">*</font>民族:</div>
			</td>
			<td>
				<s:select name ="vo.mz" id="mz" list="#request.mzList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.mz}" cssStyle="width:100%;"/>
			</td>
		 	<td class="title" width="25%" rowspan="5">
				<input type="hidden" name="id" id="id" value='<%=id%>'/> 
				<div align="left">
					<p:image ywId="<%=id%>" ywb="IMS_SGRYLYXX" edit="true" showimg="true" lb="01"/>
				</div>
			</td>
		</tr>
		<tr>
		 	<td class="title" width="20%" >
				<font color="red">*</font>证件类型:
			</td>
			<td width="20%">
				<s:select name ="vo.zjlx" id="zjlx" list="#request.zjlxList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zjlx}"/>
			</td>
		 	<td class="title" width="20%" >
				<font color="red">*</font>证件号码:
			</td>
			<td width="60%" colspan="1">
				<s:textfield name="vo.zjhm" maxlength="18" cssStyle="width: 80%;" readonly="false" />
			</td>
			<td class="title" width="20%">
				<font color="red">*</font>参加工作时间:
			</td>
			<td width="20%">
				<s:textfield name="vo.cjgzsj" id="cjgzsj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="6" ></s:textfield>
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" >
				<font color="red">*</font>出生年月:
			</td>
			<td width="20%">
				<s:textfield name="vo.csny" id="csny" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"></s:textfield>
			</td>
			<td class="title" width="20%" >
				<font color="red">*</font>文化程度:
			</td>
			<td width="20%">
				<s:select name ="vo.whcd" id="whcd" list="#request.whcdList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.whcd}"/>
			</td>
			<td class="title" width="20%" >
				<font color="red">*</font>政治面貌:
			</td>
			<td width="20%">
				<s:select name ="vo.zzmm" id="zzmm" list="#request.zzmmList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zzmm}"/>
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" >
				<font color="red">*</font>婚姻状况:
			</td>
			<td width="20%">
				<s:select name ="vo.hyzk" id="jtzk" list="#request.hyzkList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.hyzk}"/>
			</td>
			<td class="title" width="20%" >
				家庭状况:
			</td>
			<td width="20%">
				<s:select name ="vo.jtzk" id="jtzk" list="#request.jtzkList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.jtzk}"/>
			</td>
			<td class="title" width="20%" >
				医疗保障:
			</td>
			<td width="20%">
				<s:textfield name="vo.yybz" id="yybz" size="10"/>
			</td>
		</tr>
		<tr>
		 	<td class="title">
				电话号码:
			</td>
			<td>
				<s:textfield name="vo.dhhm" cssStyle="width: 50%;" />
		 	<td class="title">
				手机号码:
			</td>
			<td>
				<s:textfield name="vo.sjhm" size="12" />
			</td>
		 	<td class="title">
				人员来源:
			</td>
			<td>
				<s:select name ="vo.ryly" id="ryly" list="#request.rylyList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.ryly}"/>
			</td>
		</tr>
		<tr>
			<td class="title">
				籍贯:
			</td>
			<td>
				<s:textfield name ="vo.jg" id="jg" size="8"/>
			</td>
		 	<td class="title">

				<font color="red">*</font>户口性质:
			</td>
			<td>
				<s:select name ="vo.hkxx" id="hkxx" list="#request.hkxzList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.hkxx}"/>
			</td>
		 	<td class="title">

				户口所在地:
			</td>
			<td colspan="2">
				<s:textfield name="vo.hkszd" cssStyle="width: 80%;" />
			</td>
		</tr>
		<tr>
		 	<td class="title" width="20%">
				<font color="red">*</font>家庭地址:
			</td>
			<td width="60%" colspan="6">
				<s:textfield name="vo.jtdz" cssStyle="width: 90%;" />
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">
				<font color="red">*</font>劳动合同<br/>签订情况:
			</td>
			<td width="60%">
				<s:select name ="vo.ldhtqdqk" id="hkxx" list="#request.ldhtList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.ldhtqdqk}"/>
			</td>
			<td class="title" width="20%" >
				<font color="red">*</font>社会工作资格证书获得情况:
			</td>
			<td width="60%">
				<s:select name ="vo.zgzs" id="hkxx" list="#request.zgzsqkList"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zgzs}"/>
			</td>
			<td class="title" width="20%">
				授予时间:
			</td>
			<td width="20%" colspan="2">
				<s:textfield name="vo.zgzssysj" id="zgzssysj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="6" ></s:textfield>
			</td>
		</tr>
		
		<tr>
			<td class="title" width="20%">
				<font color="red">*</font>所属社区:
			</td>
			 
			<td width="20%">
			 	<input id="menu1" name='menu1' type="text"  value="" style="width:120px;" onClick="showMenu(this);"/>
			</td>
			
			<td class="title" width="20%">
				<font color="red">*</font>上岗时间:
			</td>
			<td width="20%">
				<s:textfield name="vo.jsqsj" id="cjgzsj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8"></s:textfield>
			</td>
			<td><font color="red">*</font>职务：</td>
			<td width="60%" colspan="2">
				<s:iterator value="%{#request.zwList}" id="Code">
			  <input type="checkbox" name="zw" id="zw" value="${code}" <s:iterator value="%{#request.zws}" id="zwname"><s:if test="%{#zwname==code}"> checked="checked" </s:if></s:iterator>>${name}&nbsp;&nbsp;&nbsp;
			</s:iterator>
			</td>
			
		</tr>
		<tr>
			<td class="title" width="20%" rowspan="5">
				<font color="red">*</font>工资情况
			</td>
			<td class="title" width="20%" colspan="2">
			 	栏目
			</td>
			 
			<td class="title" width="20%">
				<font color="red">*</font>等级:
			</td>
			<td class="title" width="20%">
				工资额
			</td>
			<td class="title2" align="center" width="60%" colspan="2">
				执行起始时间
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	职务等级工资
			</td>
			 
			<td class="title" width="20%">
				<s:select name ="vo.zygzdj" id="zygzdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zygzdj}" onchange="gzdd('01')"/>
			</td>
			<td class="title" width="20%">
				<s:textfield name="vo.zydjgz" id="zydjgz" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			<td width="60%" colspan="2">
				<s:textfield name="vo.zxqssj" cssStyle="Wdate" readonly="true" 
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	岗位工资
			</td>
			<td class="title" width="20%">
				<s:select name ="vo.gwdj" id="gwdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.gwdj}" onchange="gzdd('02')"/>
			</td>
			<td class="title" width="20%">
			
				<s:textfield name="vo.gwgz" id="gwgz" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			<td width="60%" colspan="2">
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	地区津贴
			</td>
			<td class="title" width="20%">
				<s:select name ="vo.dqjtdj" id="dqjtdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.dqjtdj}" onchange="gzdd('03')"/>
			</td>
			<td class="title" width="20%">
				
				<s:textfield name="vo.dqjt" id="dqjt" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			<td width="60%" colspan="2">
			</td>
		</tr>
		<tr>
			<td class="title" width="20%" colspan="2">
			 	职业资格津贴
			</td>
			<td class="title" width="20%">
				<s:select name ="vo.zyzgjtdj" id="zyzgjtdj" list="#request.djs"  label="abc" listKey="code" listValue="name"  headerKey="0" headerValue="请选择" value="%{vo.zyzgjtdj}" onchange="gzdd('04')"/>
			</td>
			<td class="title" width="20%">
			
				<s:textfield name="vo.zyzgjt" id="zyzgjt" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			</td>
			<td width="60%" colspan="2">
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">奖励或处分情况</td>
			<td colspan="6" align="left">
				<s:textarea  name="vo.ylqk" rows="7" cols="90" />
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">简历</td>
			<td colspan="6" align="left">
				<s:textarea  name="vo.jlxx" rows="7" cols="90" />
			</td>
		</tr>
		<tr>
			<td class="title" width="20%">家庭成员信息</td>
			<td colspan="6">
				<s:textarea  name="vo.jtcyxx" rows="7" cols="90" />
			</td>
		</tr>
		
		<s:iterator value="#request.imgList" id = "emt" status="0">
			<s:if test="%{#emt.code != '01'}">
			<s:set value="%{#emt.code}" var="lbcode"/>
			<tr>
				<td class="title" width="20%"> <s:property value="#emt.name" /></td>
				<td colspan="6">
					<p:image ywId="<%=id%>" ywb="IMS_SGRY" edit="true" lb="${lbcode}" showimg="false"/>
				</td>
			</tr>
			</s:if>
			<s:elseif test="%{#emt.code = '01'}">
				<s:set value="%{#emt.code}" var="headlb"/>
			</s:elseif>
		</s:iterator>
		</table>
	
		
<div region="south" border="false" class="demo-info"> 
    <div align="center" style="padding:20px">
	
		
		 		<a class="l-btn" href="javascript:void(0)" onClick="closeWi();"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">关闭</span> </span> </a>
		
		 
		 <s:if test="%{cz==1}">
		 		<a class="l-btn" href="javascript:void(0)"
			onclick="saveSgry('00')"> <span
			class="l-btn-left"> <span class="icon-add"
				style="padding-left: 20px;">保存</span> </span>  </a>&nbsp;&nbsp;
				
				
		 </s:if> 
		 
		
		</div>
		</div>
		
       </div>
		
    
	   <div id="menuContent1"  
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
	</div>


</form>
</body>
</html>
