<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

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
			<script type="text/javascript" src="${ctx}/sq/js/sq.js"></script>
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
				   }else if(name=='xrzh'){
				       	  if(row.xrzhbh==1){
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

  	</script>
	<body>
		<div class="easyui-layout" style="width: 100%; height: 100%;"
			fit="true">
		 	<div region="north" border="false" class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 60px; padding: 5px; background: #fafafa;">
				
					<form method="post">
					<input type="hidden" id="m" name="m"/>
						<table cellspacing="0" style="font-size: 12px;">
							<tr>	
								<td>
									
									<a id="btnEp" class="easyui-linkbutton"
										href="javascript:doQuery('dg')">查询</a>
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
	<s:set var="frozencolumslist"
			value="{
			     #{'field':'action','title':'操作','width':'100','align':'center','formatterFun':'operate'},		  
				#{'field':'jd','title':'街道','sortable':'true','width':'60' },
				 #{'field':'sq','title':'所属社区','sortable':'true','width':'60'},
				 	#{'field':'sqmc','title':'小区名称','sortable':'true','width':'140'}
 			}" />
	<s:set var="columslist"
			value="{
				 #{'field':'id','title':'id','sortable':'true', 'hide':'true'},
			    
			
				#{'field':'clsj','title':'成立时间','sortable':'true','width':'100'},
				#{'field':'dzd','title':'地址东','sortable':'true','width':'80','styleFun':'styleChange'},	
				#{'field':'dzn','title':'地址南','sortable':'true','width':'120','styleFun':'styleChange'},
				#{'field':'dzx','title':'地址西','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'dzb','title':'地址北','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'qymj','title':'区域面积','sortable':'true','width':'80' ,'styleFun':'styleChange'},
				#{'field':'jzmj','title':'建筑面积','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'zhs','title':'总户数','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'xrzhs','title':'现入住户数','sortable':'true','width':'80' ,'styleFun':'styleChange'},
				#{'field':'zrks','title':'总人口数','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'czrks','title':'常住人口数','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'fwzxwz','title':'服务中心位置','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'fwzxmj','title':'服务中心面积','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'sqlx','title':'社区类型','sortable':'true','width':'80','styleFun':'styleChange'},
				#{'field':'bz','title':'备注','sortable':'true','width':'80'}
			
				}" />
	

		<tags:gridTag gridId="dg" loadUrl="${ctx}/sq/sq_list.do" addUrl="${ctx}/sq/sq_open.do?bz=edit" addArg=""  addWin="add" newTitle="社区信息表" columsPropes="${columslist}" frozenColumsPropes="${frozencolumslist}"  newaddButton="true"   addButton="false" sortColum="clsj"  sortOrder="desc" width="99%"  singleSelect="true"  />
 <div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
			<ul id="menutree1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>  

	</body>
</html>