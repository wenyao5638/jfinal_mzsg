<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%String menuString1 = (String)request.getAttribute("areaString"); %>
<html>
	<head>
		<title>社区管理</title>
		<link rel="stylesheet" href="${ctx}/interface/css/zTreeStyle.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/gray/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/css/public.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/css/demo.css" />		
		<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyUI.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyui-lang-zh_CN.js"></script>
			<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
		<script type="text/javascript" src="${ctx}/js/menutree.js"></script>
		<script type="text/javascript"
			src="${ctx}/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript"
			src="${ctx}/js/jquery.ztree.excheck-3.5.js"></script>
			<script type="text/javascript" src="${ctx}/js/JqueryTree.js"></script>

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
	
	<script type="text/javascript"> 
		function operate(value,row,index){
				   var html = "";
				 //  html += "<a href='#' onclick='doAjaxTitleOpen(\"dg\",\"${ctx}/xssxd/xssxd_open.do\",\""+row.id+"\", \"\",800,400,\"add\",\"等级工资设置\")'>修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/xssxd/xssxd_del.do\",\""+row.id+"\", \"\")'>删除</a>";  
				 var area="<s:property value='#session.user.area'/>";
				 if(row.sssq.indexOf(area)>-1){
				   html += "<a href='#' onclick='edit(\""+row.id+"\",\"look\")'>查看</a>　<a href='#' onclick='edit(\""+row.id+"\",\"edit\")'>修改</a>   <a href='#' onclick='doAjaxDel(\"dg\",\"${ctx}/sq/sq_del.do\",\""+row.id+"\", \"\")'>删除</a>";  
				   }else{
				      html += "<a href='#' onclick='edit(\""+row.id+"\",\"look\")'>查看</a>";
				   }
				    return html;
				}
				function styleChange(value,row,index,name){
				   if(name=='dzd'){
				      
				       	  if(row.dzdbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='dzn'){
				       	  if(row.dznbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='dzx'){
				       	  if(row.dzxbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='dzb'){
				       	  if(row.dzbbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='qymj'){
				       	  if(row.qymjbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='jzmj'){
				       	  if(row.jzmjbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='zhs'){
				       	  if(row.zhsbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='xrzhs'){
				       	  if(row.xrzhsbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='zrks'){
				       	  if(row.zrksbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='czrks'){
				       	  if(row.czrksbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='fwzxmj'){
				       	  if(row.fwzxmjbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }else if(name=='fwzxwz'){
				       	  if(row.fwzxwzbh==1){
				   				return 'background-color:red;color:white';
				   		  }else{
				                return 'background-color:white;color:black';
				  		}
				   }
			
				}
	function edit(id,bz){
	 window.parent.addTab("社区信息表","${ctx}/sq/sq_open.do?id="+id+"&bz="+bz,"","");
	}
	function search(){
	var sssq=$("#code1").val();
	var sqlx = $('#sqlx').val();
	var xqmc = $('#xqmc').val();
	var clsjq = $('#clsjq').val();
	var clsjz = $('#clsjz').val();
	var xzhsq = $('#xzhsq').val();
	var xzhsz = $('#xzhsz').val();
	$('#dg').datagrid({
		queryParams: {"sssq":sssq,"sqlx":sqlx,"xqmc":xqmc,"clsjq":clsjq,"clsjz":clsjz,"xzhsq":xzhsq,"xzhsz":xzhsz}
	});
	displayMsg();  
}

  	</script>
	<body>
		<div class="easyui-layout" style="width: 100%; height: 100%;"
			fit="true">
		 	<div region="north" border="false" class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 65px; padding: 5px; background: #fafafa;">
				
						<form method="post">
					<input type="hidden" id="m" name="m"/>
					<input type="hidden" name="code1" id="code1"/>
						<table width="90%" cellspacing="0" style="font-size: 12px;">
							<tr>
							<td width="8%" align="right">所属地区：</td>
		<td width="26%" ><input id="menu1" type="text" value=""  size="15" onClick="showMenu(this);" readonly="readonly"/>
		</td>	<td width="8%" align="right">小区名称：</td>
			<td width="22%" ><input id="xqmc" type="text" value=""  size="12"/>
		</td><td width="8%" align="right">社区类型：</td>
			<td width="23%" colspan="2" ><s:select name = "sqlx" id="sqlx" list="#request.sqlx"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="社区类型" value="">
									</s:select>
		</td></tr>
		<tr>
		<td align="right">成立时间：</td>
		<td> <s:textfield name="clsjq" id="clsjq" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/>至<s:textfield name="clsjz" id="clsjz" cssClass="text" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/></td>
		<td align="right">现住户数：</td>
		<td> <s:textfield name="xzhsq" id="xzhsq" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>至<s:textfield name="xzhsz" id="xzhsz" cssClass="text" size="10" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
	
		<td width="9%" colspan="3">
									
									<a id="btnEp" class="easyui-linkbutton"
										href="javascript:search()">查询</a>
								</td>
							</tr>
						

	</table>
					</form>
				</div>
			</div>
			<div region="center" class="gridback">
				<div id="dg" border=0 title="社区管理" pagination="true"
					toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
				</div>
			</div>
		</div>
	
 <div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
			<ul id="menutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>  
	 <form id="dcform"><input type="hidden" name="queryCondits" id="queryCondits"/></form>

	</body>
</html>
<script language="javascript">
$(function(){
	 initTree('menu1','code1',${areaString},'${user.area}');
	 $('#dg').datagrid({
		 url:'/mzsg/sq/sq_list.do',
		 sortName:'clsj',
		 sortOrder:'desc',
		 width:'99%',
		
		 	singleSelect : false,
		        frozenColumns:[[ 
                                     
					
						{ field:'action',
						  title:'操作'
						  
						  
						  ,width:'100'
						  ,align:'center'
						  
						  
						  ,rowspan:2,formatter:function(value,row,index){return operate(value,row,index) ;}
						  
							}
					,
					
                                        
					
						{ field:'jd',
						  title:'街道'
						  ,sortable:'true'
						  
						  ,width:'60'
						  ,align:'left',rowspan:2
						  
						  
							}
					,
					
                                        
					
						{ field:'sq',
						  title:'所属社区'
						  ,sortable:'true'
						  
						  ,width:'60'
						  ,align:'left',rowspan:2
						  
						  
							}
					,
					
                                        
					
						{ field:'sqmc',
						  title:'小区名称'
						  ,sortable:'true'
						  
						  ,width:'140'
						  ,align:'left',rowspan:2
						  
						  
							}
					
					
					
		            ]] ,
		    
		 
		 
		 pagination:true,
		 rowStyler: function(index,row){
		               
	 		},
		 height:'380',
		 collapsible:false,
		 
		 
		 	nowrap : true,
		 
	  	 striped: true,
		 rownumbers:true,
		 iconCls:"icon-save",
		 fitColumns:false,
		 
		  
		   toolbar:[
		    
				
                                 
		                  {
					text:'<font color="red">新增社区</font>',
					iconCls:'icon-add'
					
					
					,handler:function(){
					    url='/mzsg/sq/sq_open.do?bz=edit';
					    var win='add';
					    var arg='';
					    var title='社区信息表';
                                            if(arg==null) arg="";
					    window.parent.addTab(title,url,"","");
					   
					} }, {
					text:'导出Excel',
					iconCls:'icon-xls'
					
					,handler:function(){
						to_excel();	
					}
					
					}
				],
	     
		 columns:[[
					
					
                                        
					
					
					
                                        
						{ field:'clsj',
						  title:'成立时间'
						  ,sortable:'true'
						  
						  ,width:'100'
						  ,align:'left'
						  
						  ,rowspan:2,colspan:1
                                                  
							}
					,
					{title:'社区四址',colspan:4}, 
					{ field:'qymj',
						  title:'区域面积'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left' ,rowspan:2,colspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="qymj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'jzmj',
						  title:'建筑面积'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left' ,rowspan:2,colspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="jzmj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					{title:'社区规模',colspan:4},
					{title:'社区服务中心',colspan:2},
					{ field:'sqlx',
						  title:'社区类型'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:2
						  ,colspan:1
						  
                                                  
						  ,styler:function(value,row,index){var name="sqlx"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'bz',
						  title:'备注'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:2,colspan:1
						  
						  
                                                  
							}
					
					],
                                        
					[{ field:'dzd',
						  title:'地址东'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzd"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzn',
						  title:'地址南'
						  ,sortable:'true'
						  
						  ,width:'120'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzn"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzx',
						  title:'地址西'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzx"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzb',
						  title:'地址北'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzb"; return styleChange(value,row,index,name) ;}
						  


							}
					,
					
					
                                        
						
					
					
                                        
						{ field:'zhs',
						  title:'总户数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="zhs"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'xrzhs',
						  title:'现入住户数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="xrzhs"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'zrks',
						  title:'总人口数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="zrks"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'czrks',
						  title:'常住人口数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="czrks"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'fwzxwz',
						  title:'服务中心位置'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="fwzxwz"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'fwzxmj',
						  title:'服务中心面积'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left',rowspan:1
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="fwzxmj"; return styleChange(value,row,index,name) ;}
						  
							}
				
					
					
                                        
						
					
		            ]] 
		    
	 });
	displayMsg();
});
function displayMsg() {  
				$('#dg').datagrid('getPager').pagination({  
					 pageSize: 10,//每页显示的记录条数，默认为10   
					 pageList: [10,20,30,50],//可以设置每页记录条数的列表   
					 beforePageText: '第',//页数文本框前显示的汉字   
					 afterPageText: '页    共 {pages} 页',  
					 displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录' 
		   });  
	   }
	
function to_excel(){
 var gridId="dg";
	var contextPath = $('#contextPath').val();
	var url='${ctx}/sq/to_excel.do';
	  $("form[id=dcform]").attr("action",url);
				  $("form[id=dcform]").submit();
} 

</script>