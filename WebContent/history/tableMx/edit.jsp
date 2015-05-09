<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
$(document).ready(function(){
  
	$("#tableMx").validate({
		rules: {
			'vo.xtszTable.id':{
				required : true
			 
			},
			'vo.zdmc':{
				required : true
				 
			},
			'vo.zdzwm':{
				required : true
				 
			}
				
		}
	});							 	
});  
 
</script>
<form id="tableMx" method="post" action="tableMx_save.do">
	<s:hidden key="vo.id"></s:hidden>
    <input type="hidden" id="token" value="true" />

	<table align="center" class="hovertable" border="0" cellpadding="0"
		cellspacing="0">
         <tr>
			<td class="title">
				<font color="red">*</font>类名：
			</td>
			<td>
			    <s:if test="#request.vo.id!=null">
					 ${vo.xtszTable.lm}
					<s:hidden key="vo.xtszTable.id"></s:hidden>
				</s:if>
				<s:else>
					    <s:select key="vo.xtszTable.id" list="#request.tlist" listKey="id"
					listValue="lm" headerKey="" headerValue="==请选择==" />
				</s:else>
			</td>
		</tr>
		<tr>
			<td class="title">
				<font color="red">*</font>字段名称：
			</td>
			<td>
				<s:textfield key="vo.zdmc" cssStyle="width:70%"   />
			</td>
		</tr>
		<tr>
			<td class="title">
				<font color="red">*</font>中文名称：
			</td>
			<td>
				<s:textfield key="vo.zdzwm" cssStyle="width:70%"   />
			</td>
		</tr>
	 </table>
 	<div align="center" style="margin-top: 10px;">
		<input type="button" value="保存" onclick="save(this.form)" />
		<input type="button" value="取消"
			onclick="closeDialog('jDialogContainer');" />
	</div>
</form>