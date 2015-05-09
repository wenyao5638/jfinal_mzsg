 //����Ƭ�ϴ�
function openPhoto(ywid, ywb,showimg,lb) {
 
	atturl = "ywid=" + ywid;
	atturl += "&ywb=" + ywb;
	atturl += "&showimg=" +showimg;
	atturl += "&lb=" +lb;
    doAjaxOpen("dg", "uploadImg_open.do", "", atturl, 500, 220, "uploadImg");
} 
 //����Ƭ�ϴ�
function refreshDate(ywid, edit,show,lb) {
	var url = "uploadImg_initDate.do?ywid=" + ywid+"&lb="+lb+"&showimg="+show;
	$.post(url, function (result) {
		if (result.success) {
			addZp(result.list, ywid, edit,show,lb);
		}
	}, "json");
} 

function refreshDateZp(ywid, edit,show,lb) {
	var url = "uploadImg_initDateshow.do?ywid=" + ywid+"&lb="+lb+"&showimg="+show;
	$.post(url, function (result) {
		if (result.success) {
			showZp(result.url, ywid, edit,show,lb);
		}
	}, "json");
} 
//������Ƭ
function addZp(list, ywid, edit,show,lb) {
	var array = list.split(",");
	var html = "";
	for (var i = 0; i < array.length; i++) {
		var zp = array[i].split("&");
		if (zp[0] != "") {
			html += "<div id='" + zp[0] + "'>";
			html += "<a href='downLoad_dowload.do?filename=" + encodeURI(zp[2]) + "' target='_blank'>" + zp[1] + "</a>";
			if (edit) {
				html += "<a href='javascript:void(0)' onclick='deleteZp(\"" + zp[0] + "\",\"" + ywid + "\",\""+show+"\",\""+lb+"\")'><img  class='PhotoTag' src='/mzsg/images/del.gif'  border='0' /></a>";
			}
			html += "</div>";
		}
	}
	//alert(html);
	$("#" + lb).html(html);
}
function showZp(url, ywid, edit,show,lb) {
//	var array = list.split(",");
	var html = "";
//	for (var i = 0; i < array.length; i++) {
//		var zp = array[i].split("&");
		if (url != "" && url != null) {
			var link = url.substring(0,url.indexOf(","));
			var id = url.substring(url.indexOf(",")+1)
//			alert(link);
			html += "<div id='" + id+ "'>";
			html += "<img src="+link+" width='178px' height='180px'>";
			if (edit) {
				html += "<a href='#' onclick='deleteZp(\"" + id + "\",\"" + ywid + "\",\""+show+"\",\""+lb+"\")'><img  class='PhotoTag' src='/mzsg/images/del.gif'  border='0' /></a>";
			}
			html += "</div>";
		}
//	}
	$("#" + lb).html(html);
}
//ɾ����Ƭ
function deleteZp(id, ywid,show,lb) {
	//alert(show);
    var url = "uploadImg_del.do?id=" + id+"&showimg="+show+"&lb="+lb;
    $.messager.confirm("\u63d0\u793a\u4fe1\u606f", "\u786e\u5b9a\u5220\u9664\u5417\uff1f", function (r) {
		if (r) {
			$.post(url, function (result) {
				if (result.success) {
					if(result.show){
						refreshDateZp(ywid, edit, result.show,lb);
					}else
						refreshDate(ywid, true,show,lb);
			 	} else {
					showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
				}
			}, "json");
		}
	});
 
}
//������Ƭ
 function saveZP(form) {
	        $(form).form("submit", {onSubmit:function () {
			  	return true;
			}, success:function (result) {
		        var res = eval("(" + result + ")");
			    if (res.success) {
			    	if(res.show){
						refreshDateZp($("#ywid").val(), true, true,res.lb);
					}else{
						refreshDate($("#ywid").val(),true,false,res.lb);
					}
			        
			        closeDialog('uploadImg'); 
				} else {
					showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
				}
			}
			});
		}
//���Ӱ�ť
function addButton(ywid,ywb,show){
    var str="<input type='button' value='+' onclick='openPhoto(\""+ywid+"\",\""+ywb+"\",\""+show+"\")' />"
    str+="<div id='"+ywid+"'>";
    str+="</div>" 
    return str;
}






