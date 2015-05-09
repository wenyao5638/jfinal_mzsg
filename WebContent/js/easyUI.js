
/**
 * 
 * @param action 指定需要生成url的action
 * @param addition 指定生成后，还需要附加的额外条件
 * @return
 */
function getUrl(oper, id, action, addition, ajaxSubmit) {
   
	var tmp;
	if (action && action != "") {
		tmp = action;
	} else {
		tmp = window.location.href;
		var ipos = tmp.indexOf("?");
		if (ipos > 0) {
			tmp = tmp.substring(0, ipos);
		}
	}

	tmp += "?act=" + oper;
	if (id && id != "") {
		tmp += "&id=" + id;
	}
	if (addition && addition != "") {
		tmp += "&" + addition;
	}
	
	tmp += "&time=" + new Date().getTime();
	if (ajaxSubmit) {
		tmp += "&ajaxSubmit=true";
	}	
	return tmp;
}
function newAdd(url, winId, width, height) {
	if (url.indexOf("?") < 0) {
		$("#" + winId).load(url + "?&time=" + new Date().getTime(), function () {
			$("#" + winId).window({width:width, height:height, modal:true});
		});
	} else {
		$("#" + winId).load(url + "&time=" + new Date().getTime(), function () {
			$("#" + winId).window({width:width, height:height, modal:true});
		});
	}
}
function edit(url, gridId, winId, index, width, height) {
	var row = $("#" + gridId).datagrid("getSelected");
	if (index > -1) {
		row = $("#" + gridId).datagrid("getRows")[index];
	}
	if (row) {
		if (url.indexOf("?") < 0) {
			$("#" + winId).load(url + "?act=4&ajaxSubmit=true&menuId=" + $("#menuId").val() + "&vo.id=" + row.id + "&time=" + new Date().getTime(), function () {
				$("#" + winId).window({width:width, height:height, modal:true});
			});
		} else {
			$("#" + winId).load(url + "&act=4&ajaxSubmit=true&menuId=" + $("#menuId").val() + "&vo.id=" + row.id + "&time=" + new Date().getTime(), function () {
				$("#" + winId).window({width:width, height:height, modal:true});
			});
		}
	} else {
		$.messager.show({title:"\u63d0\u793a\u4fe1\u606f", msg:"\u8bf7\u9009\u62e9\u4e00\u884c\u8bb0\u5f55\u518d\u8fdb\u884c\u4fee\u6539"});
	}
}
function doOperate(oper, id, action, addition) {
	if (oper == 9) {
		if (!window.confirm("\u786e\u5b9a\u5220\u9664\u5417?")) {
			return;
		}
	}
	if (oper == 64) {
		if (window.goSearch) {
			return goSearch(-1);
		}
	}
	window.location.href = getUrl(oper, id, action, addition);
}
/**
 * 对ajax的异步操作
 * 	如果是删除，则异步删除后，刷新表格数据
 *  如果是新增或者删除，则通过jquery.jdialog.js弹出修改对话框。
 * @param oper
 * @param gridId
 * @param action
 * @param addition
 * @return
 */
function doAjaxOperate(gridId, action, id, oper, addition, winId, divWidth, divHeight) {
	var hasPopedom = false;
	var url = "commonReq!checkPopedom.action?menuId=" + $("#menuId").val() + "&act=" + oper;
	$.getJSON(url, function (data) {
		if (data != null) {
			hasPopedom = eval(data.result);
			if (hasPopedom) {
				var url = getUrl(oper, id, action, addition, true);
				if (winId && winId != "") {
				} else {
					winId = "jDialogContainer";
				}
				if (oper & 1 == 1) {
					if (oper == 9) {
						$.messager.confirm("\u63d0\u793a\u4fe1\u606f", "\u786e\u5b9a\u5220\u9664\u5417\uff1f", function (r) {
							if (r) {
								$.post(url, function (result) {
									if (result.success) {
										refreshGrid(gridId);
										showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
									} else {
										showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
									}
								}, "json");
							}
						});
					} else {
						$.post(url, function (result) {
							if (result.success) {
								showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
								refreshGrid(gridId);
							} else {
								showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
							}
						}, "json");
					}
				} else {
					closeDialog(winId);
					$("#" + gridId).prepend("<div id=\"" + winId + "\" iconCls=\"icon-save\" title=\"\u4fe1\u606f\u7f16\u8f91\"></div>");
					$("#" + winId).load(url, function () {
						if (divHeight) {
							$("#" + winId).window({width:divWidth, height:divHeight, modal:true, minimizable:false, maximizable:false, collapsible:false, resizable:false, onClose:function () {
								$("#" + winId).remove();
								$("#" + winId).html("");
								$("select").show();
							}});
						} else {
							$("#" + winId).window({width:divWidth, modal:true, minimizable:false, maximizable:false, collapsible:false, resizable:false, onClose:function () {
								$("#" + winId).remove();
								$("#" + winId).html("");
								$("select").show();
							}});
						}
					});
				}
			} else {
				showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + "\u60a8\u6ca1\u6709\u64cd\u4f5c\u6743\u9650\uff01\u8bf7\u8054\u7cfb\u7cfb\u7edf\u7ba1\u7406\u5458" + "</font>");
			}
		}
	});
}
/**
* 关闭弹出窗口
*/
function closeDialog(dialogId) {
	$("#" + dialogId).window("close");
}
/**
*提示消息
*/
function showMessage(_title, _message) {
	$.messager.show({title:_title, msg:_message, showType:"show", timeout:4000});
}
/**
*列表刷新操作
*/
function refreshGrid(gridId) {
	$("#" + gridId).datagrid("reload");
}
function remove(gridId, url, index) {
	var row = $("#" + gridId).datagrid("getSelected");
	if (index > -1) {
		row = $("#" + gridId).datagrid("getRows")[index];
	}
	if (row) {
		$.messager.confirm("\u63d0\u793a\u4fe1\u606f", "\u786e\u5b9a\u5220\u9664\u5417\uff1f", function (r) {
			if (r) {
				$.post(url + "?act=9&ajaxSubmit=true&menuId=" + $("#menuId").val() + "&vo.id=" + row.id, function (result) {
					if (result.success) {
						showMessage("\u63d0\u793a\u4fe1\u606f", "\u5220\u9664\u6210\u529f");
						$("#" + gridId).datagrid("reload"); // reload
					} else {
						showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
					}
				}, "json");
			}
		});
	}
}
function doQuery(gridId, querConditsId) {
	$("#" + gridId).datagrid("getPager").pagination({pageNumber:1});
	$("#" + gridId).datagrid("options").pageNumber = 1;
	if (querConditsId) {
	 	$("#" + gridId).datagrid("options").queryParams.queryCondits = _getQueryParam(querConditsId);
	} else {
		
    	$("#" + gridId).datagrid("options").queryParams.queryCondits = eval("_getQueryParam" + gridId + "()");
	}
	$("#" + gridId).datagrid("reload");
}
function _getQueryParam(querConditsId) {
	
	var array = $("#queryCondits").val();
	array = eval(array);
	if (querConditsId != null) {
		array = $("#" + querConditsId).val();
	}
	var str = "";
	for (var i = 0; i < array.length; i++) {
		str += array[i].field + ",";
		str += array[i].logic + ",";
		str += array[i].type + ",";
		str += $("#" + array[i].value).val() + "&";
	}
	return str;
}
function save(form, winId, parentWinId) {
	/**
	 * 防止重复提交校验
	 */
	
    var flag = $("#token").val();
	if (flag == false || flag == "false") {
		$.messager.alert("\u63d0\u793a\u4fe1\u606f", "\u8bf7\u52ff\u91cd\u590d\u63d0\u4ea4\uff01", "error");
		return;
	}
	if (winId && winId != "") {
	} else {
		winId = "jDialogContainer";
	}
	if (parentWinId && parentWinId != "") {
	} else {
		parentWinId = "dg";
	}
	$(form).form("submit", {onSubmit:function () {
	    var valResult=$(form).validate().form();
	    if (valResult) {
			$("#token").val(false);
		}
		return valResult;
	}, success:function (result) {
        
		var res = eval("(" + result + ")");
	     
		if (res.success) {
		  
			showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
			closeDialog(winId);// data
			$("#" + parentWinId).datagrid("reload"); // reload the user
		} else {
			$("#token").val(true);
		     
			showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
		}
	}
	});
}
//弹出部门选择窗口
function openDepart(depName, depId, winId, evt, callBackFun) {
	closeDialog(winId);
	$(".demo-info").prepend("<div class=\"easyui-window\" id=\"" + winId + "\" title=\"\u90e8\u95e8\u9009\u62e9\"></div>");
	var url = "exam/common/departmentTree.jsp";
	url += "?depName=" + depName;
	url += "&depId=" + depId;
	url += "&winId=" + winId;
	url += "&menuId=" + $("#menuId").val();
	var e = evt ? evt : window.event;
	var locX = e.pageX ? e.pageX : (e.clientX ? (e.clientX + document.body.scrollLeft) : 0);
	var locY = e.pageY ? e.pageY : (e.clientY ? (e.clientY + document.body.scrollTop) : 0);
	$("#" + winId).window({top:locY - 30, left:locX - 30, width:300, height:300, modal:true, minimizable:false, maximizable:false, collapsible:false, resizable:false, onClose:function () {
		$("#" + winId).remove();
		$("#" + winId).html("");
		$("select").show();
		if (callBackFun && callBackFun != "") {
			eval(callBackFun + "()");
		}
	}});
	$("#" + winId).load(url, function () {
		$("#" + winId).window("open");
	});
}
//弹出知识点选择窗口 
function openPoint(pointName, pointId, parentDiv, winDiv, evt) {
	closeDialog(winDiv);
	$("#" + parentDiv).prepend("<div class=\"easyui-window\" id=\"" + winDiv + "\" title=\"\u77e5\u8bc6\u70b9\u9009\u62e9\"></div>");
	var url = "exam/common/pointTree.jsp";
	url += "?pointName=" + pointName;
	url += "&pointId=" + pointId;
	url += "&winId=" + winDiv;
	url += "&menuId=" + $("#menuId").val();
	var e = evt ? evt : window.event;
	var locX = e.pageX ? e.pageX : (e.clientX ? (e.clientX + document.body.scrollLeft) : 0);
	var locY = e.pageY ? e.pageY : (e.clientY ? (e.clientY + document.body.scrollTop) : 0);
	$("#" + winDiv).window({top:locY - 30, left:locX - 30, width:300, height:300, modal:true, minimizable:false, maximizable:false, collapsible:false, resizable:false, onClose:function () {
		$("#" + winDiv).remove();
		$("#" + winDiv).html("");
		$("select").show();
	}});
	$("#" + winDiv).load(url, function () {
		$("#" + winDiv).window("open");
	});
}
function setAct(act) {
	$("#act").val(act);
}
function userchoice(winId, userName, userId, evt, funcName, callBackFun) {
	closeDialog(winId);
	$(".demo-info").prepend("<div class=\"easyui-window\" id=\"" + winId + "\" title=\"\u7528\u6237\u9009\u62e9\"></div>");
	var url = "exam/common/userChoice.jsp";
	url += "?winId=" + winId;
	url += "&userName=" + userName;
	url += "&userId=" + userId;
	url += "&funcName=" + funcName;
	var e = evt ? evt : window.event;
	$("#" + winId).window({top:100, left:150, modal:true, width:600, height:450, minimizable:false, maximizable:false, collapsible:false, resizable:false, onClose:function () {
		$("#" + winId).remove();
		$("#" + winId).html("");
		if (callBackFun && callBackFun != "") {
			eval(callBackFun + "()");
		}
	}});
	$("#" + winId).load(url, function () {
		$("#" + winId).window("open");
	});
}
function changeState(entity, id, scope) {
	$.getJSON("changeState.action", {entityName:entity, id:id, scope:scope}, function (result) {
		showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
		$("#dg").datagrid("reload"); // reload
	});
}
//删除的操作
function doAjaxDel(gridId, action, id, addition) {
	var url = getUrl("del", id, action, addition, true);
 
	$.messager.confirm("\u63d0\u793a\u4fe1\u606f", "\u786e\u5b9a\u5220\u9664\u5417\uff1f", function (r) {
		if (r) {
			$.post(url, function (result) {
				if (result.success) {
					refreshGrid(gridId);
					showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
				} else {
					showMessage("\u63d0\u793a\u4fe1\u606f", result.msg);
				}
			}, "json");
		}
	});
}
//打开窗口操作
function doAjaxOpen(gridId,action, id, addition, divWidth, divHeight,winId) {
   $("select").hide();
   var url = getUrl("open", id, action, addition, true);
  
   if (winId && winId != "") {
				} else {
					winId = "jDialogContainer";
				}
    if(document.getElementById(gridId)!=null)
	   $("#"+gridId).prepend("<div id=\"" + winId + "\" iconCls=\"icon-save\" title=\"\u4fe1\u606f\u7f16\u8f91\"></div>");
	else
	   $("body").prepend("<div id=\"" + winId + "\" iconCls=\"icon-save\" title=\"\u4fe1\u606f\u7f16\u8f91\"></div>");
 	$("#" + winId).load(url, function () {
		if (divHeight) {
		  	$("#" + winId).window({height:divHeight,width: divWidth,modal:true, minimizable:false, maximizable:false, collapsible:false, resizable:false, onClose:function () {
				$("#" + winId).remove();
				$("#" + winId).html("");
				$("select").show();
			}});
		} else {
		    
			$("#" + winId).window({ modal:true, minimizable:false, maximizable:false, collapsible:false, resizable:false, onClose:function () {
				$("#" + winId).remove();
				$("#" + winId).html("");
				$("select").show();
			}});
			 
		}
	});
}
function chakanwpxx(id,wpbh){
			var contextPath = $('#contextPath').val();
	        $('#add').dialog({
				buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						upatewpxx();
					}
				},
				{
					text:'查看历史痕迹',
					iconCls:'icon-ok',
					handler:function(){
						chakanlshj(wpbh);
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						closeWpxx();
					}
				}],
				title:"案件物品详细信息"
			});
			var url=contextPath+'/sawpgl_js/chakan.do?id='+id+'&qxid=1';
			$("#addiframe").attr("src",url);
			$('#add').dialog('open');
}
function chakanwpxxno(id,wpbh){
			var contextPath = $('#contextPath').val();
	        $('#add').dialog({
				buttons:[
				{
					text:'查看历史痕迹',
					iconCls:'icon-ok',
					handler:function(){
						chakanlshj(wpbh);
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						closeWpxx();
					}
				}],
				title:"案件物品详细信息"
			});
			var url=contextPath+'/sawpgl_js/chakan.do?id='+id+'&qxid=1';
			$("#addiframe").attr("src",url);
			$('#add').dialog('open');
}
function upatewpxx(){
			var contextPath = $('#contextPath').val();
		    var id=window.frames["addiframe"].$('#id').val();
		    var wpdl=window.frames["addiframe"].$('#wpdl').val();
		    var wpxl=window.frames["addiframe"].$('#wpxl').val();
		    var wpsx=window.frames["addiframe"].$('#wpsx').val();
			var mc=window.frames["addiframe"].$('#mc').val();
			var sl=window.frames["addiframe"].$('#sl').val();
			var tz=window.frames["addiframe"].$('#tz').val();
			
			//案件物品信息 机动车
			var clcpxh=window.frames["addiframe"].$('#clcpxh').val();
			var sbdm=window.frames["addiframe"].$('#sbdm').val();
			var fdjh=window.frames["addiframe"].$('#fdjh').val();
			var pzhm=window.frames["addiframe"].$('#pzhm').val();
			var xcls=window.frames["addiframe"].$('#xcls').val();
			var csys=window.frames["addiframe"].$('#csys').val();
			var sfyps=0;
			if(window.frames["addiframe"].document.getElementById("sfyps").checked){
			  sfyps = 1;
			}
			var clzk=window.frames["addiframe"].$('#clzk').val();
			var cllx=window.frames["addiframe"].$('#cllx').val();
			//案件物品信息 驾驶证
			var xm=window.frames["addiframe"].$('#jszxm').val();
			var zjcx=window.frames["addiframe"].$('#zjcx').val();
			var jszh=window.frames["addiframe"].$('#jszh').val();
			//案件物品信息 行驶证
			var syr=window.frames["addiframe"].$('#syr').val();
			var yxq=window.frames["addiframe"].$('#yxq').val();
			
			
		    if(sl==""){
	          $.messager.alert('系统提示', '数量不能为空','warning'); 
	        }else{
	          $.messager.confirm('保存', '你确认要保存吗？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/sawpgl_js/updatewpxx.do',   
						data : {   
							id : id,
							wpdl : wpdl,
							wpxl : wpxl,
							wpsx : wpsx,
							mc : mc,
							sl : sl,
							tz : tz,
							clcpxh : clcpxh,	
							sbdm : sbdm,	
							fdjh : fdjh,	
							pzhm : pzhm,	
							xcls : xcls,	
							csys : csys,	
							sfyps : sfyps,	
							clzk : clzk,	
							cllx : cllx,
							xm :  xm,	   
							zjcx : zjcx,
							jszh :  jszh,
							syr : syr,
							yxq : yxq	   
						},   
						type : 'POST',   
						success : function() {
						  $.messager.alert('系统提示', '保存成功','warning');
						  $('#dg').datagrid('reload');
						  $('#add').dialog('close');
						}   
                   }); 
				}
			  }); 
	        }
			
			
		}
function chakanlshj(wpbh){
			if(wpbh==' '){
			   $.messager.alert('系统提示', '还未入录，无法查看历史痕迹','warning'); 
	           return;
			}
			var contextPath = $('#contextPath').val();
	        $('#wplz').dialog({
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						closewplz();
					}
				}],
				title:"物品历史痕迹信息"
			});
			var url=contextPath+'/sawpgl_js/chakanlshj.do?wpbh='+wpbh;
			$("#wplziframe").attr("src",url);
			$('#wplz').dialog('open');
	 
}
function closeWpxx(){
	 $('#add').dialog('close');
			
}

 //查询设值
		 	     function setCxValue(){
		 	           $(".cxclass").val("");
		 	           var name=$('#cxtype').val();
		 	           var value=$('#cxvalue').val();
		 	           if(name!='')
		 	           $("#"+name).val(value);
		 	     }
