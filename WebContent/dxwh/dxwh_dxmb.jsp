<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<% String area=(String)request.getAttribute("area"); %> 
<% String areaCode=(String)request.getAttribute("areaCode"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>再生育管理系统>>短信维护>>短信模板</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css">
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/dxwh/js/dxwh_dxmb.js"></script>
<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/date/WdatePicker.js"></script>
<style>
textarea
{
width:60%;
height:100%;
}
</style>
<script>

 $(function(){
   openCode();
	 var contextPath = $('#contextPath').val();
			$('#tt2').datagrid({
				iconCls:'icon-save',
				width:200,
				height:200,
				singleSelect:true,
				nowrap: false,
				striped: true,
				pagination:true,
				loadMsg : '数据装载中......', 
				fit: true,
				url:'<%=contextPath%>/dxwh/dxmbList.do?qx=<s:property value="qx"/>',
				idField:'area',
				columns:[[
					{field:'opt',title:'操作',width:60,align:'center'},
					{field:'area',title:'地区',width:120},
				    {field:'clzt',title:'处理状态',width:120},
			        {field:'sftjhfs',title:'是否提交后发送',width:100},
			        {field:'jsdx',title:'接收对象',width:100},
			        {field:'fsnr',title:'发送内容',width:300},
				    {field:'fssj',title:'发送时间',width:120},
				    {field:'fspl',title:'发送频率',width:70},
				    {field:'zt',title:'启用/停用',width:70},
					{field:'opt2',title:'删除',width:60,align:'center'}
					]],
				toolbar:[<s:if test="%{qx==1 || qx==0}">{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						add();
					}
				},'-',</s:if>{
					text:'刷新',
					iconCls:'icon-reload',
					handler:function(){
						 $('#tt2').datagrid('reload');
					}
				}
				],
				rownumbers:true
			});
		    displayMsg();  
		});
		
function displayMsg() {  
	$('#tt2').datagrid('getPager').pagination({  
		pageSize: 18,//每页显示的记录条数，默认为10   
		pageList: [18,20,30,50],//可以设置每页记录条数的列表   
		beforePageText: '第',//页数文本框前显示的汉字   
		afterPageText: '页    共 {pages} 页',  
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
	});  
}

function showFssj(){
	var sftjhfs = $('#sftjhfs').val();
	if(sftjhfs=="0"){
		$('#show1').css("display","");
		$('#show2').css("display","");
	}else{
		$('#show1').css("display","none");
		$('#show2').css("display","none");
	}
}

function search(){
	var clzt = $('#sclzt').val();
	var sftjhfs = $('#ssftjhfs').val();
	var jsdx = $('#sjsdx').val();
	var zt=$("[name=szt]:checked").val();
	$('#tt2').datagrid({
		queryParams: {"search_dxmb.clzt": clzt,"search_dxmb.sftjhfs": sftjhfs,"search_dxmb.jsdx":jsdx,"search_dxmb.zt":zt}
	});
	displayMsg();  
}
 </script>
</head>
<body class="easyui-layout" >
<div data-options="region:'north'" style="overflow:hidden;">
<input type="hidden" value="<%=contextPath%>" name="contextPath" id="contextPath"/>
<table width="98%" cellpadding=0>
<tr>
	<td align="right" height="28">处理状态:</td>
	<td>
		<s:select name="sclzt" id="sclzt" list="#request.clztList" listKey="code" listValue="name" headerKey="" headerValue="==处理状态=="></s:select>
	</td>
	<td align="right" height="28">发送状态:</td>
	<td>
		<s:select name="ssftjhfs" id="ssftjhfs" list="#request.fsztList" listKey="code" listValue="name" headerKey="" headerValue="=发送状态="></s:select>
	</td>
	<td align="right" height="28">接收对象:</td>
	<td>
		<s:select name="sjsdx" id="sjsdx" list="#request.jsdxList" listKey="code" listValue="name" headerKey="" headerValue="==接收对象=="></s:select>
	</td>
</tr>
<tr>
	<td align="right">是否启用:</td>
	<td colspan="3"> <s:radio name="szt" list="#{'':'全部','1':'是','2':'否'}"  id="szt" /></td> 
	<td>
		<a id="btnEp" class="easyui-linkbutton"  href="javascript:search()">查询</a>
	</td>
</tr>
</table>

</div>
 
<div data-options="region:'center',title:'短信模板'" style="background:#fafafa; padding:0px;overflow:hidden">
	<table id="tt2" bgcolor="#FFFFFF"></table>
</div>
        
    
	 <div id="add" class="easyui-window" title="添加"  
       data-options="iconCls:'icon-search',modal:true" minimizable="false"
        maximizable="false" style=" padding:5px;background: #fafafa;">  
     <div class="easyui-layout" fit="true">
      
     <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
          <s:hidden  name="oldclzt"  id="oldclzt"/>
          <s:hidden  name="oldsftjhfs"  id="oldsftjhfs"/>
          <s:hidden  name="oldjsdx"  id="oldjsdx"/>
		 <tr bgcolor="#FFFFFF">
              <td align="right" height="28">地区：</td>
		      <td width="38%"  align="left">
		      	<input size="10"  type ="text"  name="area" id="area" value="<%= area%>" readonly="true"></input>	 
		      
		      	<input type ="text"  name="areaCode" id="areaCode" value="<%= areaCode%>"  style="visibility:hidden"></input>	 
		      </td>	    
		    </tr>
          <tr bgcolor="#FFFFFF">
              <td align="right" height="28">处理状态：</td>
		      <td width="38%"  align="left">
		      	<s:select name="clzt" id="clzt" list="#request.clztList" listKey="code" listValue="name" headerKey="" headerValue="==处理状态=="></s:select>	 
		      </td>	    
		    </tr>
          <tr bgcolor="#FFFFFF">
              <td align="right" height="28">发送状态：</td>
		      <td width="38%"  align="left">
		      	<s:select name="sftjhfs" id="sftjhfs" list="#request.fsztList" listKey="code" listValue="name" headerKey="" headerValue="=发送状态=" onchange="showFssj()"></s:select>	 
		      </td>	    
		    </tr>
          <tr bgcolor="#FFFFFF">
              <td align="right" height="28">接收对象：</td>
		      <td width="38%"  align="left">
		      	<s:select name="jsdx" id="jsdx" list="#request.jsdxList" listKey="code" listValue="name" headerKey="" headerValue="==接收对象=="></s:select>	 
		      </td>	    
		    </tr>
              <tr>
               <td width="16%" align="right">发送内容：</td>
		      <td align="left"> <s:textarea name="fsnr" id="fsnr" style="height:120px"></s:textarea></td>
              </tr>
              
          <tr bgcolor="#FFFFFF" id="show1" style="display:none">
              <td align="right" height="28">发送时间：</td>
		      <td width="38%"  align="left">
		      	<s:select name="fssj" id="fssj" list="#request.fssjList" listKey="code" listValue="name" headerKey="" headerValue="==发送时间=="></s:select>	
		      	+<s:textfield name="fssj_days"  id="fssj_days" cssClass="text"  size="3"/>天<s:textfield style="display:none" name="fssj_hour"  id="fssj_hour" cssClass="text"  size="3" onclick="WdatePicker({dateFmt:'HH'})"/>
		      </td>	    
		    </tr>
              
          <tr bgcolor="#FFFFFF" id="show2" style="display:none">
              <td align="right" height="28">发送频率：</td>
		      <td width="38%"  align="left">
		      	<s:textfield name="fspl" id="fspl" cssClass="text"  size="5"/>天
		      </td>	    
		    </tr>
		  <tr>
             <td align="right" height="28">是否启用：</td>
		      <td  align="left"> <s:radio name="zt" list="#{'1':'是','2':'否'}" id="zt"/></td>
		  </tr>  
          <tr bgcolor="#FFFFFF">
              <td align="right" height="28">内容替换规则：</td>
		      <td width="38%"  align="left">
			      	申请人->@申请人@<br/>申请日期->@申请日期@<br/>街道受理日期->@街道受理日期@<br/>社区核实日期—>@社区核实日期@<br/>
			      	街道提交至局审批日期—>@街道提交至局审批日期@<br/>承办人审批日期—>@承办人审批日期@<br/>负责人审批日期—>@负责人审批日期@<br/>
			      	公示结束日期->@公示结束日期@<br/>镇街道->@镇街道@<br/>社区->@社区@<br/>
			    </td>
		    </tr>
		    
		  </table>
       </div>
                 <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
               <span id="save"><a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveCode()" >
                   保存</a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('add')" >
                   取消 </a>
       </div>
           </div>    
</div>
</body>
</html>