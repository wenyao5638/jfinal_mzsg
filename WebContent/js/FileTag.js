 //���ļ��ϴ�
function openFile(ywid, ywb) {
 
	atturl = "ywid=" + ywid;
	atturl += "&ywb=" + ywb;
    doAjaxOpen("dg", "uploadFile_open.do", "", atturl, 500, 220, "uploadFile");
} 
 //���ļ��ϴ�
function refreshDate(ywid, edit) {
	var url = "uploadFile_initDate.do?ywid=" + ywid;
	$.post(url, function (result) {
		if (result.success) {
			addFile(result.list, ywid, edit);
		}
	}, "json");
} 
//�����ļ�
function addFile(list, ywid, edit) {
	var array = list.split(",");
	var html = "";
	for (var i = 0; i < array.length; i++) {
		var zp = array[i].split("&");
		if (zp[0] != "") {
			html += "<div id='" + zp[0] + "'>";
			html += "<a href='downLoad_dowloadFile.do?filename=" + zp[2] + "' target='_blank' >" + zp[1] + "</a>";
			if (edit) {
				html += "<a href='#' onclick='deleteFile(\"" + zp[0] + "\",\"" + ywid + "\")'><img  class='FileTag' src='/paic/images/del.gif'  border='0' /></a>";
			}
			html += "</div>";
		}
	}
	$("#" + ywid).html(html);
}
//ɾ���ļ�
function deleteFile(id, ywid) {
    var url = "uploadFile_del.do?id=" + id;
    $.messager.confirm("\u63d0\u793a\u4fe1\u606f", "\u786e\u5b9a\u5220\u9664\u5417\uff1f", function (r) {
		if (r) {
			$.post(url, function (result) {
				if (result.success) {
					refreshDate(ywid, true);
			 	} else {
					showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
				}
			}, "json");
		}
	});
 
}
//�����ļ�
 function saveFile(form) {
	        $(form).form("submit", {onSubmit:function () {
			  	return true;
			}, success:function (result) {
		        var res = eval("(" + result + ")");
			    if (res.success) {
			        refreshDate($("#ywid").val(),true);
			        closeDialog('uploadFile'); 
			        $('#dg').datagrid('reload');
				} else {
					showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
				}
			}
			});
		}
//���Ӱ�ť
function addButton(ywid,ywb){
    var str="<input type='button' value='+' onclick='openFile(\""+ywid+"\",\""+ywb+"\")' />"
    str+="<div id='"+ywid+"'>";
    str+="</div>" 
    return str;
}






