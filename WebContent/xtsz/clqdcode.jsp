<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags"%><head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>再生育管理系统- 权限管理</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css">
	<link rel="stylesheet" href="<%=contextPath%>/interface/css/zTreeStyle.css" type="text/css"/>
<%	String menuString = (String)request.getAttribute("areaString"); 
	String sessionArea = (String)request.getAttribute("sessionArea");
%>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/xtsz/js/clqdcode.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/js/menutree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.ztree.excheck-3.5.js"></script>  
<style type="text/css">
	ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #FFFFFF;width:98%;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>

<script>
 var zNodesmenu=<%=menuString%>;
 var sessionArea = "<%=sessionArea%>";
var menusetting = {
	check: {
		enable: true,
		chkStyle: "radio",
		radioType: "all"
	},
	view: {
		dblClickExpand: false
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		onClick: onClick,
		onCheck: onCheck
	}
};
 $(function(){
   openCode();
    	$.fn.zTree.init($("#clmenutree1"), menusetting, zNodesmenu);
     	$.fn.zTree.init($("#clmenutree2"), menusetting, zNodesmenu);
     	var zTree = $.fn.zTree.getZTreeObj("clmenutree1"),
    	node = zTree.getNodeByParam("id","<%=sessionArea%>",null);
    	zTree.selectNode(node);
    	var cityObj = $("#clmenu1");
    	cityObj.attr("value", node.name);
    	$("#clcode1").val("<%=sessionArea%>");

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
				url:'<%=contextPath%>/clqdcode/clqdCodeList.do?qx=<s:property value="qx"/>',
				idField:'lx',
				columns:[[
					{field:'opt',title:'操作',width:50,align:'center'},
					{field:'aname',title:'所属区域',width:80},
				    {field:'lx',title:'类型',width:80},
			        {field:'sqly',title:'申请理由',width:120},
					{field:'xh',title:'序号',width:30},
					{field:'nameshort',title:'简称',width:150},
					{field:'name',title:'全称',width:200},
					{field:'isneed',title:'是否必须',width:60}<s:if test="%{qx==1 || qx==0}">,
					{field:'opt2',title:'删除',width:50,align:'center'}</s:if>
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

function search(){
	var lx = $('#slx').val();
	var sqly = $('#ssqly').val();
	var name=$("#sname").val();
	var area=$("#clcode1").val();
	$('#tt2').datagrid({
		queryParams: {"search.lx": lx,"search.sqly":sqly,"search.name":name,"search.area":area}
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
<td width="99" align="right" height="28">所属地区:</td>
	<td>
		<input id="clmenu1" type="text" value="" style="width:130px;" onClick="showMenu(this);" />
			  <input type="hidden" name="clcode1" id="clcode1"/>
	</td>
	<td width="99" align="right" height="28">类型:</td>
	<td>
		<s:select name="slx" id="slx" list="#request.lxList" listKey="code" listValue="name" headerKey="" headerValue="==类型==" onChange="changeSqly_search()"></s:select>
	</td>
	
	<td width="99" align="right" height="28">申请理由:</td>
	<td>
		<select name="ssqly" id="ssqly">
			<option value="">==申请理由==</option>
		</select>
	</td>
	<td>
		<a id="btnEp" class="easyui-linkbutton"  href="javascript:search('')">查询</a>
	</td>
	<td></td>
</tr>
</table>

</div>
 
<div data-options="region:'center',title:'材料清单信息'" style="background:#fafafa; padding:0px;overflow:hidden">
	<table id="tt2" bgcolor="#FFFFFF"></table>
</div>
        
    
	 <div id="add" class="easyui-window" title="添加"  
       data-options="iconCls:'icon-search',modal:true" minimizable="false"
        maximizable="false" style=" padding:5px;background: #fafafa;">  
     <div class="easyui-layout" fit="true">
      
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
              <TABLE width=90% align=center>
				<TBODY>
					<TR>
						<TD align=middle>
							 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
		  <TR>
    <TD align=middle>
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
          <s:hidden  name="oldlx"  id="oldlx"/>
          <s:hidden  name="oldsqly"  id="oldsqly"/>
          <s:hidden  name="oldxh"  id="oldxh"/>
		  	<tr bgcolor="#FFFFFF">
              <td align="right" height="28">所属地区：</td>
		      <td width="38%"  align="left">
			<input id="clmenu2" type="text" value="" style="width:130px;" onClick="showMenu(this);"/>
			  <input type="hidden" name="clcode2" id="clcode2"/>
		      </td>		     
		    </tr>
          <tr bgcolor="#FFFFFF" id="flb">
              <td align="right" height="28">类型：</td>
		      <td width="38%"  align="left">
		      	<s:select name="lx" id="lx" list="#request.lxList" listKey="code" listValue="name" headerKey="" headerValue="==类型==" onChange="changeSqly()"></s:select>	 
		      </td>	    
		    </tr>
              		<tr bgcolor="#FFFFFF">
              <td align="right" height="28">申请理由：</td>
		      <td width="38%"  align="left">
				<select name="sqly" id="sqly">
					<option value="">==申请理由==</option>
				</select>
		      </td>		     
		    </tr>
              <tr>
               <td width="16%" height="28" align="right">序号：</td>
		      <td width="31%"  align="left"> <s:textfield name="xh"  id="xh" cssClass="text"  size="20"/></td>
              </tr>
              <tr>
               <td width="16%" height="28" align="right">简称：</td>
		      <td width="31%"  align="left"> <s:textfield name="nameshort"  id="nameshort" cssClass="text"  size="30"/></td>
              </tr>
              <tr>
               <td width="16%" height="28" align="right">全称：</td>
		      <td width="31%"  align="left"> <s:textfield name="name"  id="name" cssClass="text"  size="40"/></td>
              </tr>
             <tr>
             <td align="right" height="28">是否必须：</td>
		      <td  align="left"> <s:radio name="isneed" list="#{'1':'是','2':'否'}"  id="isneed" /></td>
             </tr> 
             <tr>
			  <td colspan="2" height="8"></td>
			</tr>
		  </table></TD></TR>
		  </table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
       </div>
                 <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
               <span id="save"><a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:saveCode()" >
                   保存</a></span>&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closes('add')" >
                   取消 </a>
       </div>
	   <div id="clmenuContent2" class="menuContent" style="display:none; position: absolute;">
	<ul id="clmenutree2" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
           </div>    
</div>
<div id="clmenuContent1" class="menuContent" style="display:none; position: absolute;">
	<ul id="clmenutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
</body>
</html>