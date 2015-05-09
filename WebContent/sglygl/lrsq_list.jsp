<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%String contextPath = request.getContextPath();%>	
<html>
	<head>
		<title>社工录用申请</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/gray/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/css/public.css" />
	    <link rel="stylesheet" type="text/css" href="${ctx}/css/demo.css" />
		<link rel="stylesheet" href="${ctx}/interface/css/zTreeStyle.css" type="text/css" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyUI.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
		<script type="text/javascript" src="${ctx}/js/menutree.js"></script>
		<script type="text/javascript" src="${ctx}/js/photoTag.js"></script>
		<script type="text/javascript" src="${ctx}/js/UUID.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.ztree.excheck-3.5.js"></script>
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
	<%
		String menuString1 = (String) request.getAttribute("areaString");
	%>
	<script type="text/javascript">

	$(function(){
		initTree('menu1','code1',${areaString},'${user.area}');
	});
	            //提交的操作
				  function tj(id) {
						var url ="ajxx_tj.do?id="+id;
					    $.messager.confirm("\u63d0\u793a\u4fe1\u606f", "确定提交吗？", function (r) {
							if (r) {
								$.post(url, function (result) {
									if (result.success) {
										refreshGrid('dg');
										showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
									} else {
										showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
									}
								}, "json");
							}
						});
					}
				  	//Grid打印通用操作按钮
				function operate(value,row,index){
					var qx = '${qx}';
					var cz = '${cz}';
				    var zt = row.zt
				    var html = "";
				    html += "<a href='#' onclick='chakan(\""+row.id+"\")'>查看</a> ";
				    if(zt == null){
				    	return "";
				    }else if(qx == "1"){//管理员
				    	
				    	if(zt == "00" && cz==0){//保存
				    		/**
				    		if(row.cbrUser.username == $("#code2").val()){
				    			
				    		}*/
				    		//html += "<a href='#' onclick='sb(\""+row.id+"\")'>上报</a> ";
				    		html += "<a href='#' onclick='edit(\""+row.id+"\")'>上报/修改</a> ";
				    		html += "<a href='#' onclick='doAjaxDel(\"dg\",\"lysq_del.do\",\""+row.id+"\")'>删除</a> ";
				    	}
				    	else if(zt == "01"&& cz==1){//已上报
				    		html += "<a href='#' onclick='sh(\""+row.id+"\")'>审核</a> ";
				    	}
				    	
				    	
				    }
				    
					return html;
				}
				
				//Grid打印注销状态：true->启用，false->停用
			   function renderZT(value,row,index){
			   			if(row.ztCode == null)
			            return "";
			            return  row.ztCode.name;
			   }
			   function renderRyly(value,row,index){
		   			if(row.rylyCode == null)
		            return "";
		            return  row.rylyCode.name;
		   		}
			   //显示地区
			   function renderArea(value,row,index){
			          if(row.szsqArea==null) 
			          return "";
			          return row.szsqArea.name;
			          }
			          
			   //显示活动类别
			   function operateHdlb(value,row,index){
			   
			   if(row.code == null){
			   		return "";
			   }else{
			   		 if(row.code.id==null){
			          	return "";
			          }
			         	return row.code.name;
			   }
			         
			   }
			   //显示用户
			   function renderUser(value,row,index){
			   
			   if(row.qspr == null){
			   		return "";
			   }else{
			        return row.qspr.usercnname;
			   }
			         
			   }
			   
			   
			   //增加
			   function addnew(){
				   
				   window.parent.closeTab("录用登记表");
				   window.parent.addTab("录用登记表","<%=contextPath%>/sglygl/lysq_open.do?flag=input");
					
				}
				function chakan(jbxxId){
					window.parent.closeTab("录用登记表");
					window.parent.addTab("录用登记表","<%=contextPath%>/sglygl/lysq_open.do?flag=view&id="+jbxxId);
				}
				function edit(jbxxId,hdlb){
					window.parent.closeTab("录用登记表");
					window.parent.addTab("录用登记表","<%=contextPath%>/sglygl/lysq_open.do?flag=update&id="+jbxxId);
						
				}
				
				function sb(jbxxId){//上报
					$.messager.confirm('上报', '确认要上报此条记录吗？', function(r){
						if (r){
							$.ajax({
								url :'<%=contextPath%>/sglygl/lysq_save.do',   
								data : {   
										id : jbxxId,
										zt : 'sb'
									},   
								type : 'POST',   
								success : function() {
								$.messager.alert('系统提示', '上报成功','warning');
								$('#dg').datagrid('reload');
									 
									}   
			                   }); 
							}
							});
					
				}
				function sh(jbxxId){//审核
					var url='<%=contextPath%>/sglygl/lysp_shview.do';
					doAjaxOpen('dg',url, jbxxId, '', 420, 340,'');
				}
		//PDF生成
		function scPdf(){
			
			var j = 0;
			var num = 0;
			var hdpdf = new Array(
			['zyhdgl_lb03','pdf_wdlb29'],
			['zyhdgl_lb04','pdf_wdlb30'],
			['zyhdgl_lb05','pdf_wdlb31'],
			['zyhdgl_lb06','pdf_wdlb36'],
			['zyhdgl_lb07','pdf_wdlb38']);
			
			var pdflb = $('#pdflb').val();
			var row = $('#dg').datagrid('getSelections');
			if(pdflb == ""){
				$.messager.alert('系统提示', '请选择PDF类别','warning');
			}else if(row.length==0){
				$.messager.alert('系统提示', '请选择一条或多条信息','warning'); 
						   
			}else if((pdflb == 'pdf_wdlb36' || pdflb =='pdf_wdlb38') && row.length >16){
				$.messager.alert('系统提示', '该PDF文件最多打印16条记录！','warning');
			}else{
							 //只能选择该PDF类别的记录
							var array = new Array();
							for(var i = 0; i< row.length;i++){
								
								while( j < 5){
									if((pdflb == hdpdf[j][1]) && (row[i].code.id == hdpdf[j][0])){
									 array.push(row[i].id);
									 num = num + 1;
									}
									
									j++;
								}
								j = 0;
								if( num == 0){
										$.messager.alert('系统提示', '选择类别错误,请选着对应的活动记录','warning');
										 return;
									}
								
								
							}
							$.ajax({
					            url:"pdf_generatePdf.do",
					            type:"POST",
					            dataType:'json',
					            data: {
					            array:array,
					            pdflb:pdflb
					            },
					            success:function(data){
					            	if (data.success == true){
										var reval=window.open(data.url,"","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=900,height=700, left=150,top=50");
						            }else if(data.success == false){
						            	$.messager.alert('系统提示', '生成PDF文件出错，请联系管理员！','warning');
						            }else if(data.success =='exception'){
						            	$.messager.alert('系统提示', '处理异常，请稍后重试！','warning');
						            }
						        },
						        error:function(){
						            	$.messager.alert('系统提示', '生成PDF失败','warning'); 
						            }    
					        });
						}
		}	
			 
  	</script>
	<body>
		<div class="easyui-layout"  style="width: 100%; height: 100%;"
			fit="true">
			<div region="north" border="false"class="demo-info">
				<div id="search" title="查询选项" icon="icon-search"
					style="overflow: hidden; height: 65px; padding: 5px; background: #fafafa;">
					<input type="hidden" id="menuId" value="${menuId}" />
				
					<form>
						<table width="95%" cellspacing="0" style="font-size: 12px;">
							<tr>
								<td align="right">所属社区:</td>
						    	<td><input id="menu1" type="text" readonly="readonly" value="" style="width:93px;" onClick="showMenu(this);"/></td>
                                <input type="hidden" name="code1" id="code1"/>
								<td align="right">姓名:</td>
								<td>
									<s:textfield name="xm" id ="xm" size="6"/>
								</td>
								<td align="right">证件号码:</td>
								<td>
									<s:textfield name="zjhm" id="zjhm" size="18"/>
								</td>
								<td align="right">上报时间:</td>	
								<td><s:textfield name="qsrq" cssStyle="Wdate" readonly="true"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8" />至
									<s:textfield name="jsrq" cssStyle="Wdate" readonly="true"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="8" />
								</td>
                            </tr>
                            <tr>
								<td align="right">人员来源:</td>
								<td>
									<s:select name = "ryly" id="ryly" list="#request.rylyList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
								<td align="right">签订劳动合同情况:</td>
								<td>
									<s:select name = "ldhtqdqk" id="ldhtqdqk" list="#request.ldhtqdqkList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
								<td align="right">文化程度:</td>
								<td>
									<s:select name = "whcd" id="whcd" list="#request.whcdList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="请选择" value="">
									</s:select>
								</td>
								<td align="right">状态:</td>
								<td>
									<s:select name = "zt" id="zt" list="#request.ztList"  label="abc" listKey="code" listValue="name"  headerKey="" headerValue="全部" value="%{#request.zt}"/>
								</td>
								<td align="left">
                            		<a id="btnEp" class="easyui-linkbutton"
										href="javascript:doQuery('dg')">查询</a>
								
                            	</td>
							</tr>
							
						</table>
					</form>
				</div>
			</div>
			<div region="center" class="gridback">
				<div id="dg" border=0  title="社工录用申请列表" pagination="true"
					toolbar="#toolbar" rownumbers="true" singleSelect="true" fit="true">
				</div>
			
			</div>
		</div>
		<div id="menuContent1"  
			style="display: none; position: absolute;">
			<ul id="menutree1" class="ztree"
				style="margin-top: 0; width: 300px; height: 300px;"></ul>
		</div>
		<s:set var="frozencolumslist"
			value="{
			    #{'field':'action','title':'操作','width':'120','align':'center','formatterFun':'operate'},
			    #{'field':'jd','title':'街道','sortable':'true','width':'60'},
			    #{'field':'sq','title':'社区','sortable':'true','width':'100'}
			    			   
 			}" />
		<s:set var="columslist"
			value="{
			 #{'field':'xm','title':'姓名','sortable':'true','width':'80'},
			     #{'field':'zjhm','title':'证件号','sortable':'true','width':'140'} ,
			    #{'field':'ryly','title':'人员来源','sortable':'true','width':'100'},  
			    #{'field':'zw','title':'职务','sortable':'true','width':'150'},  
			    #{'field':'jsqsj','title':'上岗日期','sortable':'true','width':'80'},  
			    #{'field':'sjhm','title':'联系电话','sortable':'true','width':'80'},  
			    #{'field':'tjrq','title':'上报日期','sortable':'true','width':'80'},  
			    #{'field':'qspr','title':'审批人','sortable':'true','width':'80'},  
			    #{'field':'qsprq','title':'审批日期','sortable':'true','width':'80'},  
			    #{'field':'spzt','title':'状态','sortable':'true','width':'60'}
 			}" />
		<s:set var="queryCondits"
			value="{
			    #{'field':'szsq', 'type':'string', 'logic':'like', 'value':'code1'},
			    #{'field':'xm', 'type':'string', 'logic':'like', 'value':'xm'},
				#{'field':'zjhm', 'type':'string', 'logic':'like', 'value':'zjhm'},
				#{'field':'czrq', 'type':'string', 'logic':'>=', 'value':'qsrq'},
				#{'field':'czrq', 'type':'string', 'logic':'<=', 'value':'jsrq'},
				#{'field':'ryly', 'type':'string', 'logic':'=', 'value':'ryly'},
				#{'field':'ldhtqdqk', 'type':'string', 'logic':'=', 'value':'ldhtqdqk'},
				#{'field':'whcd', 'type':'string', 'logic':'=', 'value':'whcd'},
				#{'field':'zt', 'type':'string', 'logic':'=', 'value':'zt'}
				}" />
<s:if test='%{cz==0 && qx==1}'>
		<tags:gridTag gridId="dg" loadUrl="lysq_list.do?zt=${zt}&cz=${cz}" addUrl="${ctx}/sglygl/lysq_open.do?flag=input&cz=${cz}" addArg="" addTitle="申请录用" addWin="add" newTitle="申请录用"  newaddButton="true"   addButton="false"  toolbar="true"  singleSelect="true"
		 winheight="350" winwidth="700" frozenColumsPropes="${frozencolumslist}" columsPropes="${columslist}"  
			queryCondits="${queryCondits}" sortColum="czrq" sortOrder="desc" width="99%"/>
			
			</s:if>
			<s:else>
			<tags:gridTag gridId="dg" loadUrl="lysq_list.do?zt=${zt}&cz=${cz}"  newaddButton="false"   addButton="false"  toolbar="false"  singleSelect="false"
		 winheight="350" winwidth="700" frozenColumsPropes="${frozencolumslist}" columsPropes="${columslist}" 
			queryCondits="${queryCondits}" sortColum="czrq" sortOrder="desc" width="99%"/>
			
			</s:else>
		
	</body>
</html>