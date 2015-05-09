<%@ tag language="java" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--tag ���ԣ�attribute������  -->
<%@ attribute name="addJSLib"
	description="if true, refers to jquery lib and SigmaGrid's lib and util.js"%>
<%@ attribute name="gridId"
	description="grid's id; if null, default value is 'dg'"
	type="java.lang.String"%>
<%@ attribute name="loadUrl" description="grid's url; " required="true"
	type="java.lang.String"%>
<%@ attribute name="loadUrlIsFun" description="grid's urlFun; "
	required="false" type="java.lang.String"%>
<%@ attribute name="sortColum" description="grid's sorting colum"
	required="true" type="java.lang.String"%>
<%@ attribute name="sortOrder"
	description="grid's sortorder,if value is 'asc' or null sortorder 'asc',else sortorder is 'desc'"
	type="java.lang.String"%>
<%@ attribute name="height"
	description="grid's height ,if null ,default value is 380"
	type="java.lang.String"%>
<%@ attribute name="width"
	description="grid's height ,if null ,default value is 100%"
	type="java.lang.String"%>
<%@ attribute name="fitColumns"
	description="grid's fitColumns ,if null ,default value is 'true'"
	type="java.lang.Boolean"%>
<%@ attribute name="onLoadSuccessFun"
	description="grid's fitColumns ,if null ,default value is 'true'"
	type="java.lang.String"%>
<%@ attribute name="frozenColumsPropes" type="java.util.List" required="false"%>
<%@ attribute name="columsPropes" type="java.util.List" required="true"%>
<%@ attribute name="addUrl" type="java.lang.String"%>
<%@ attribute name="addTitle" type="java.lang.String"%>
<%@ attribute name="addWin" type="java.lang.String"%>
<%@ attribute name="newTitle" type="java.lang.String"%>
<%@ attribute name="addArg" type="java.lang.String"%>
<%@ attribute name="addButton" description="true|false"%>
<%@ attribute name="newaddButton" description="true|false"%>
<%@ attribute name="pdfButton" description="true|false"%>
<%@ attribute name="pdflookButton" description="true|false"%>
<%@ attribute name="verifyUrl" type="java.lang.String"%>
<%@ attribute name="verifyButton" description="true|false"%>
<%@ attribute name="toolbar" description="true|false"%>
<%@ attribute name="excelButton" description="false|true"%>
<%@ attribute name="printButton" description="false|true"%>
<%@ attribute name="singleSelect" description="true|false"%>
<%@ attribute name="checkbox" description="true|false"%>
<%@ attribute name="nowrap" description="true|false"%>
<%@ attribute name="winheight" type="java.lang.Integer"%>
<%@ attribute name="winwidth" type="java.lang.Integer"%>
<%@ attribute name="addButtonEven"%>
<%@ attribute name="excelButtonEven"%>
<%@ attribute name="printButtonEven"%>
<%@ attribute name="rowStylerFun"%>
<%@ attribute name="verifyButtonEven"%>
<%@ attribute name="queryCondits" type="java.util.List" required="false"
	description="if null and queryParamFunction att is null, exec defult"%>
<!-- ʵ�� -->
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
$(function(){
	 $('#<s:property value="#attr.gridId" default="dg"/>').datagrid({
		 url:<s:if test="(#attr.loadUrlIsFun == 'true')"><s:property value="#attr.loadUrl"/>()</s:if><s:elseif test="(#attr.loadUrl != null)">'<s:property value="#attr.loadUrl" escape="false" />'</s:elseif><s:else>getUrl(0)</s:else>,
		 sortName:'<s:property value="#attr.sortColum" />',
		 sortOrder:<s:if test="(#attr.sortOrder=='asc' || #attr.sortOrder == null)">'asc'</s:if><s:else>'desc'</s:else>,
		 width:'<s:property value="#attr.width" default="100%"/>',
		<s:if test='#attr.singleSelect !=null || #attr.singleSelect==false'>
		 	singleSelect : false,
		        frozenColumns:[[ 
                          <s:if test='#attr.checkbox !=null || #attr.checkbox==false'>
                                        {field:'test',checkbox:true}
</s:if>  <s:if test='%{(#attr.checkbox !=null || #attr.checkbox==false)&&#attr.frozenColumsPropes!=null}'>
                                       ,
</s:if>
  					<s:iterator value="#attr.frozenColumsPropes" var="item" status="status">
                                      
					<s:if test="#item.colspan != null">
						
						{ 
							title:'<s:property value="#item.title"/>',
						  	colspan:'<s:property value="#item.colspan"/>'
						}
						<s:if test="! #status.last">,</s:if>
					</s:if>
						{ field:'<s:property value="#item.field"/>',
						  title:'<s:property value="#item.title"/>'
						  <s:if test="#item.sortable != null">,sortable:'<s:property value="#item.sortable"/>'</s:if>
						  <s:if test="#item.checkbox != null">,checkbox:'<s:property value="#item.checkbox"/>'</s:if>
						  <s:if test="#item.width != null">,width:'<s:property value="#item.width" default="100"/>'</s:if>
						  <s:if test="#item.width != null">,align:'<s:property value="#item.align" default="left"/>'</s:if>
						  <s:if test="#item.hide != null">,hidden:'<s:property value="#item.hide" default="false"/>'</s:if>
						  <s:if test ="#item.formatterFun != null">
						  ,formatter:function(value,row,index){return <s:property value="#item.formatterFun"/>(value,row,index) ;}
						  </s:if>
							}
					<s:if test="! #status.last">,</s:if>
					</s:iterator>
					
		            ]] ,
		    
		 </s:if>
		 <s:else>
		 	singleSelect : true,
		 </s:else>
		 pagination:true,
		 rowStyler: function(index,row){
		               <s:if test ="#attr.rowStylerFun != null">
		              return <s:property value="#attr.rowStylerFun"/>(index,row) ;
		              </s:if>
	 		},
		 height:'<s:property value="#attr.height" default="380"/>',
		 collapsible:false,
		 <s:if test='#attr.nowrap !=null || #attr.nowrap==false'>
		 	nowrap : false,
		 </s:if>
		 <s:else>
		 	nowrap : true,
		 </s:else>
	  	 striped: true,
		 rownumbers:true,
		 iconCls:"icon-save",
		 fitColumns:<s:property value="#attr.fitColumns" default="false"/>,
		 <s:if  test='(#attr.onLoadSuccessFun !=null)'>
		 onLoadSuccess:function(data){<s:property value="#attr.onLoadSuccessFun"/>},
		 </s:if>
		  <s:if test="(#attr.toolbar=='true' || #attr.toolbar == null) ">
		   toolbar:[
		    <s:if test="(#attr.addButton=='true' || #attr.addButton == null) ">
		       {
					text:'���',
					iconCls:'icon-add'
					<s:if test="#attr.addButtonEven != null">
					,handler:function(){
						<s:property value="#attr.addButtonEven" escape="false"/>;	
					}
					</s:if>
					<s:else>
					,handler:function(){
					    url='<s:property value="#attr.addUrl" escape="false"/>';
                                            
					    var width='<s:property value="#attr.winwidth"/>';
					    var height='<s:property value="#attr.winheight"/>';
					    var win='<s:property value="#attr.addWin"/>';
					    var arg='<s:property value="#attr.addArg"  escape="false"/>';
                                            if(arg==null) arg="";
					    doAjaxOpen("dg",url,arg, "",width, height,win);
					}
					</s:else>
				}
			  </s:if>
				<s:if test="(#attr.newaddButton=='true'  &&  #attr.newaddButton != null) ">
                                 <s:if test="(#attr.addButton=='true' || #attr.addButton == null) ">
			          ,'-',
			          </s:if>
		                  {
					text:'<s:if test="(#attr.addTitle == null)">���</s:if><s:else><font color="red"><s:property value="#attr.addTitle" escape="false"/></font></s:else>',
					iconCls:'icon-add'
					<s:if test="#attr.addButtonEven != null">
					,handler:function(){
						<s:property value="#attr.addButtonEven" escape="false"/>;	
					}
					</s:if>
					<s:else>
					,handler:function(){
					    url='<s:property value="#attr.addUrl" escape="false"/>';
					    var win='<s:property value="#attr.addWin"/>';
					    var arg='<s:property value="#attr.addArg"  escape="false"/>';
					    var title='<s:property value="#attr.newTitle"/>';
                                            if(arg==null) arg="";
					    window.parent.addTab(title,url,"","");
					   
					}
					</s:else>
				}
			  </s:if>	
			  <s:if test="(#attr.excelButton=='true' && #attr.excelButton != null) ">	
			      <s:if test="(#attr.newaddButton=='true' || #attr.newaddButton == null||#attr.addButton=='true' || #attr.addButton == null) ">
			      ,'-',
			      </s:if>
				{
					text:'����Excel',
					iconCls:'icon-xls'
					<s:if test="#attr.excelButtonEven != null">
					,handler:function(){
						<s:property value="#attr.excelButtonEven" escape="false"/>;	
					}
					</s:if>
					<s:else>
					,handler:function(){
					 
					}
					</s:else>
				}
			  </s:if>
			  
			      <s:if test="(#attr.verifyButton=='true' && #attr.verifyButton != null) ">
			       <s:if test="(#attr.newaddButton=='true' || #attr.newaddButton == null||#attr.excelButton=='true' || #attr.excelButton != null||#attr.addButton=='true' || #attr.addButton == null) ">
			        ,'-',
			       </s:if>
			      
				{
					text:'���',
					iconCls:'icon-publish'
					<s:if test="#attr.excelButtonEven != null">
					,handler:function(){
						<s:property value="#attr.verifyButtonEven" escape="false"/>;	
					}
					</s:if>
					<s:else>
					,handler:function(){
					 
					}
					</s:else>
				}
			  </s:if>
                  

			   <s:if test="(#attr.printButton=='true' && #attr.printButton != null) ">	
			      <s:if test="(#attr.newaddButton=='true' || #attr.newaddButton == null||#attr.pdflookButton=='true' || #attr.pdflookButton == null || #attr.pdfButton=='true' || #attr.pdfButton == null||#attr.verifyButton=='true' || #attr.verifyButton == null||#attr.excelButton=='true' || #attr.excelButton != null||#attr.addButton=='true' || #attr.addButton == null) ">
			      ,'-',
			      </s:if>
				{
					text:'��ӡ',
					iconCls:'icon-print'
					<s:if test="#attr.printButtonEven  != null">
					,handler:function(){
						<s:property value="#attr.printButtonEven " escape="false"/>;	
					}
					</s:if>
					<s:else>
					,handler:function(){
					 
					}
					</s:else>
				}
			  </s:if>
				],
	     </s:if>
		 columns:[[
					<s:iterator value="#attr.columsPropes" var="item" status="status">
					<s:if test="#item.colspan != null">
                                        
						
						{ 
							title:'<s:property value="#item.title"/>',
						  	colspan:'<s:property value="#item.colspan"/>'
						}
						<s:if test="! #status.last">,</s:if>

                                            
					</s:if>
                                        
						{ field:'<s:property value="#item.field"/>',
						  title:'<s:property value="#item.title"/>'
						  <s:if test="#item.sortable != null">,sortable:'<s:property value="#item.sortable"/>'</s:if>
						  <s:if test="#item.checkbox != null">,checkbox:'<s:property value="#item.checkbox"/>'</s:if>
						  <s:if test="#item.width != null">,width:'<s:property value="#item.width" default="100"/>'</s:if>
						  <s:if test="#item.width != null">,align:'<s:property value="#item.align" default="left"/>'</s:if>
						  <s:if test="#item.hide != null">,hidden:'<s:property value="#item.hide" default="false"/>'</s:if>
						  <s:if test ="#item.formatterFun != null">
						  ,formatter:function(value,row,index){return <s:property value="#item.formatterFun"/>(value,row,index) ;}
						  </s:if>
                                                  <s:if test ="#item.styleFun != null">
						  ,styler:function(value,row,index){var name="<s:property value="#item.field"/>"; return <s:property value="#item.styleFun"/>(value,row,index,name) ;}
						  </s:if>
							}
					<s:if test="! #status.last">,</s:if>
					</s:iterator>
		            ]] 
		    
	 });
	 var page = $('#<s:property value="#attr.gridId" default="dg"/>').datagrid('getPager');
	 if (page){
		$(page).pagination({
			pageSize:10
		});
	}
});
//Grid��ӡ���ڸ�ʽyyyy-mm-dd
function rendererDate(value,row,index){
	var tmp = "";
	if (value == null){ 
	    return tmp;
	}
	tmp = value["year"] + 1900
	if (value["month"] < 9){
		tmp = tmp + "-0" + (value["month"]+1); 
	}else{
		tmp = tmp + "-" + (value["month"]+1);
	}
	if (value["date"]<10){
		tmp = tmp + "-0" + value["date"];
	}else{
		tmp = tmp + "-" + value["date"];
	}
	return tmp;
}
//Grid��ӡ��ӡʱ���ʽ��yyyy-mm-dd hh:mm:ss
function rendererDateTime(value,row,index){
	if (value == null) return "";
	var tmp = rendererDate(value,row,index);
	if (value["hours"]<10){
		tmp = tmp + " 0" + value["hours"];
	}else{
		tmp = tmp + " " + value["hours"];
	}
	if (value["minutes"]<10){
		tmp = tmp + ":0" + value["minutes"];
	}else{
		tmp = tmp + ":" + value["minutes"];
	}
	if (value["seconds"]<10){
		tmp = tmp + ":0" + value["seconds"];
	}else{
		tmp = tmp + ":" + value["seconds"];
	}
	return tmp;
}
//Grid��ӡ��ӡʱ���ʽ��yyyy-mm-dd hh:mm
function rendererDateTime2(value,row,index){
	if (value == null) return "";
	var tmp = rendererDate(value,row,index);
	if (value["hours"]<10){
		tmp = tmp + " 0" + value["hours"];
	}else{
		tmp = tmp + " " + value["hours"];
	}
	if (value["minutes"]<10){
		tmp = tmp + ":0" + value["minutes"];
	}else{
		tmp = tmp + ":" + value["minutes"];
	}
	return tmp;
}
//Grid��ӡע��״̬��true->������false->ע��
function rendererValiable(value,row,index){
	return (value == true || value != 0) ? '����':'<font color="red">ע��</font>';
}
//Grid��ӡBooleanֵ: true->�ǣ�false->��
function rendererYesNo(value,row,index){
	return ((value == true) || (value == 'true') || (value == 1))? '\u662f': '<font color="red">\u5426</font>';
}
//Grid��ӡע��״̬��true->���ã�false->ͣ��
function renderState(value,row,index){
	return value=='true'||value==true?'<font >����</font>':'<font color = "red">ͣ��</font>'
}
//Grid��ӡͨ�ò�����ť
function renderOperate(value,row,index){
	var html = "<a href='#' onclick='doAjaxOperate(\"dg\",\"\","+row.id+", 4,\"\",\"\", 400)'>�޸�</a> "
		     + "<a href='#' onclick='doAjaxOperate(\"dg\",\"\","+row.id+", 9)'>ɾ��</a> ";
	return html;
}
function _getQueryParam<s:property value="#attr.gridId" default="dg"/>() {
	var param="";
		<s:iterator value="#attr.queryCondits" var="item" status="status">
			param += '<s:property value="#item.field"/>,<s:property value="#item.logic" escape="false"/>,<s:property value="#item.type"/>,';
			param += $("#<s:property value='#item.value'/>").val() + "&";	
		</s:iterator>	
	return param;
}
</script>
