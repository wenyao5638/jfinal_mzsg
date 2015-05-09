<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function tjbd(code){
	$("input[name=zt]").val(code);
	   $("input[type='checkbox']").attr("disabled",false);
		   var form = document.forms['qspb'];
		   $(form).form("submit", {onSubmit:function (param) {
		    var valResult=$(form).validate().form();
		    if (valResult) {
				//$("#token").val(false);
			}
			return valResult;
		}, success:function (result) {
	        
			var res = eval("(" + result + ")");
		     
			if (res.success) {
			  
				showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
				//closeDialog(winId);// data
				//$("#" + parentWinId).datagrid("reload"); // reload the user
				closeDialog('jDialogContainer');
				$('#dg').datagrid('reload');
			} else {
				//$("#token").val(true);
				showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
			}
		}
		});
	
	}
</script>
<form id="qspb" method="post" enctype="multipart/form-data"
	action="lysp_save.do">
	<s:hidden name="vo.id"/>
	<s:hidden name="vo.spid"/>
	<s:hidden name="vo.splx"/>
	<s:hidden name="zt" id="zt"/>
    <table align="center" class="hovertable" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td class="title">
				审批意见
			</td>
			<td>
				<s:textarea name="vo.qspyj" rows="3"></s:textarea>
			</td>
		</tr>
		<tr>
			<td class="title">
				审批人
			</td>
	        <td>
				<s:textfield name="vo.qspr"/>
			</td>
		</tr>
		<tr>
			<td class="title">
				审批日期
			</td>
	        <td>
				<s:textfield name="vo.qsprq"/>
			</td>
		</tr>
    </table>
    <div class="dialog-button">
		<a id="" class="l-btn" href="javascript:void(0)" onclick="tjbd('02')"
			onclick=" "> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">退回</span> </span> </a>
		<a id="" class="l-btn" href="javascript:void(0)" onclick="tjbd('03')"
			onclick=" "> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">批准</span> </span> </a>
		<a class="l-btn" href="javascript:void(0)"
			onclick="closeDialog('jDialogContainer');"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">取消</span> </span> </a>
	</div>
</form>

