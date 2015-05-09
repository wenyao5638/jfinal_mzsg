<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<head> 
<%String contextPath = request.getContextPath();%>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>再生育审批-PDF重新生成</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/themes/icon.css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js"></script>

<script>

function reZsyspPdf(blx){
	$('#blx').val(blx);
	var xzxh = $('#xzxh').val();
	if(xzxh==null||xzxh==""){
		$.messager.alert('系统提示', '请输入乡镇受理序号!','warning');
		return;
	}
	//防止操作两次，先禁用按钮
	var v = document.getElementsByTagName("a");
	for(i=0;i<v.length;i++){
		v[i].disabled=1;
	}
	var data = $("#repdfForm").serializeArray();
	$.messager.confirm('提交',"确认重新生成PDF文件",function(r){
		if(r){
			$.ajax({
				url: "<%=contextPath%>/pdf/reZsyspPdf.do",
				data: data,
				type: "post",
				dataType: "json",
				error : function() {
					var v = document.getElementsByTagName("a");
					for(i=0;i<v.length;i++){
						v[i].disabled=0;
					}
					$.messager.alert('系统提示', '系统出现错误，请稍后重试或者联系管理员!','warning');
					return;
				},
				success: function(data){
					var v = document.getElementsByTagName("a");
					for(i=0;i<v.length;i++){
						v[i].disabled=0;
					}
					$.messager.confirm('提示',data);
				}
			});
		}else{
			var v = document.getElementsByTagName("a");
			for(i=0;i<v.length;i++){
				v[i].disabled=0;
			}
		}
	})
}

</script>

</head>
<body>
<form id="repdfForm" method="post" enctype="multipart/form-data">
<s:hidden name="blx" id="blx"></s:hidden>
<div data-options="region:'north'" style="overflow:hidden;">
	<table width="98%" cellpadding=0>
		<tr>
			<td align="right" height=30 class=box_td>乡镇受理序号:</td>
			<td align="left" class=box_td>
				<s:textfield name="zsysp_base.xzxh"  cssClass="text"  id="xzxh" size="20" />
			</td>
			<td width="50%"></td>
		</tr>
	</table>
	<table width="70%" align="center" cellpadding=0>
		<tr>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('sqb')">申请表</a>
			</td>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('fjqd')">附件清单</a>
			</td>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('sltzs')">受理通知书</a>
			</td>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('gsb')">公示表</a>
			</td>
		</tr>
		<tr>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('spb')">审批表</a>
			</td>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('fjjlb')">附件记录表</a>
			</td>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('jds')">决定书</a>
			</td>
			<td align="left" class=box_td>
				<a id="btnEp" class="easyui-linkbutton" icon="icon-save" href="javascript:reZsyspPdf('zwd')">总文档</a>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>