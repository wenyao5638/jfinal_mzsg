<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
$(document).ready(function(){
  
	$("#table").validate({
		rules: {
			'vo.lm':{
				required : true
			 
			},
			'vo.zjm':{
				required : true
				 
			},
			'vo.zwmc':{
				required : true
				 
			}
				
		}
	});							 	
});  
 
</script>
<form id="table" method="post" action="table_save.do">
	<s:hidden key="vo.id"></s:hidden>
    <input type="hidden" id="token" value="true" />

	<table align="center" class="hovertable" border="0" cellpadding="0"
		cellspacing="0">
         <tr>
			<td class="title">
				<font color="red">*</font>类名：
			</td>
			<td>
				<s:textfield key="vo.lm"  />
			</td>
		</tr>
		<tr>
			<td class="title">
				<font color="red">*</font>主键名称：
			</td>
			<td>
				<s:textfield key="vo.zjm" cssStyle="width:70%"   />
			</td>
		</tr>
		<tr>
			<td class="title">
				<font color="red">*</font>表中文名：
			</td>
			<td>
				<s:textfield key="vo.zwmc" cssStyle="width:70%"   />
			</td>
		</tr>
	 </table>
 	<div align="center" style="margin-top: 10px;">
		<input type="button" value="保存" onclick="save(this.form)" />
		<input type="button" value="取消"
			onclick="closeDialog('jDialogContainer');" />
	</div>
</form>