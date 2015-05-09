//设置信息系统提示窗口
var flag=false;

function delCode(clzt,sftjhfs,jsdx){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('记录删除', '你确认要删除该记录吗？', function(r){
	if (r){
		$.ajax({
			url :contextPath+'/dxwh/delCode_Dxmb.do',
			data : {
				"dxwh_dxmb.clzt" : clzt,
				"dxwh_dxmb.sftjhfs" : sftjhfs,
				"dxwh_dxmb.jsdx" : jsdx
			},
			type : 'POST',
			success : function() {
				 $('#tt2').datagrid('reload');
			}
		});
	}
	});
}

function edit(clzt,sftjhfs,jsdx,fsnr,fssj,fssj_days,fssj_hour,fspl,zt){
	var contextPath = $('#contextPath').val();
	$('#clzt').val(clzt);
	$('#sftjhfs').val(sftjhfs);
	$('#jsdx').val(jsdx);
	$('#fsnr').val(fsnr);
	$('#fssj').val(fssj);
	$('#fssj_days').val(fssj_days);
	$('#fssj_hour').val(fssj_hour);
	$('#fspl').val(fspl);
	$("input[name=zt][value="+zt+"]").attr("checked", true);
	$('#oldclzt').val(clzt);
	$('#oldsftjhfs').val(sftjhfs);
	$('#oldjsdx').val(jsdx);
	$('#add').window('open');  
	showFssj();
}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(url,clzt,sftjhfs,jsdx,fsnr,fssj,fssj_days,fssj_hour,fspl,zt,oldclzt,oldsftjhfs,oldjsdx,areaCode){
	$.ajax({   
		url : contextPath+'/dxwh/checkCode_Dxmb.do',  
		type : 'POST',
		data:{
			"dxwh_dxmb.clzt" : clzt,
			"dxwh_dxmb.sftjhfs" : sftjhfs,
			"dxwh_dxmb.jsdx" : jsdx
		},
		dataType : 'json',  
		success : function(data) {
			flag=data;
			if(flag){
				$.messager.alert('系统提示', '该记录已存在!','warning');
				return;
			}else{
				save(url,clzt,sftjhfs,jsdx,fsnr,fssj,fspl,zt,fssj_days,fssj_hour,oldclzt,oldsftjhfs,oldjsdx,areaCode);
			}
		}
	});
}

function openCode() {
	$('#add').window( {
		title : '添加',
		width : 600,
		modal : true,
		shadow : true,
		closed : true,
		height : 450,
		top:($(window).height() - 450) * 0.5,   
        left:($(window).width() - 600) * 0.5,
		resizable : false
	});
}

function add() {
	$('#clzt').val("");
	$('#sftjhfs').val("");
	$('#jsdx').val("");
	$('#fsnr').val("");
	$('#fssj').val("");
	$('#fssj_days').val("0");
	$('#fssj_hour').val("9");
	$('#fspl').val("0");
	$("input[name=zt][value=1]").attr("checked", true);
	$('#oldclzt').val("");
	$('#oldsftjhfs').val("");
	$('#oldjsdx').val("");
	$('#add').window('open');
	$('#show1').css("display","none");
	$('#show2').css("display","none");
}

function saveCode() {
	var contextPath = $('#contextPath').val();
	var clzt=$('#clzt').val();
	var areaCode=$('#areaCode').val();
	var sftjhfs=$('#sftjhfs').val();
	var jsdx=$('#jsdx').val();
	var fsnr=$('#fsnr').val();
	var fssj=$('#fssj').val();
	var fssj_days=$('#fssj_days').val();
	var fssj_hour=$('#fssj_hour').val();
	var fspl=$('#fspl').val();
	var zt=$("[name=zt]:checked").val();
	var oldclzt=$('#oldclzt').val();
	var oldsftjhfs=$('#oldsftjhfs').val();
	var oldjsdx=$('#oldjsdx').val();
	if(clzt==""){
		$.messager.alert('系统提示', '请选择处理状态!','warning');
		return;
	}
	if(sftjhfs==""){
		$.messager.alert('系统提示', '请选择是否提交后发送!','warning');
		return;
	}
	if(jsdx==""){
		$.messager.alert('系统提示', '请选择接收对象!','warning');
		return;
	}
	if(fsnr==""){
		$.messager.alert('系统提示', '请输入发送内容!','warning');
		return;
	}
	if(sftjhfs=="0"){
		if(fssj==""){
			$.messager.alert('系统提示', '请选择发送时间!','warning');
			return;
		}
		if(fssj_days==""){
			$.messager.alert('系统提示', '请输入发送时间后具体多长时间后发送!','warning');
			return;
		}
		if(fssj_hour==""){
			$.messager.alert('系统提示', '请输入具体几点发送!','warning');
			return;
		}
		if(fspl==""){
			$.messager.alert('系统提示', '请输入发送频率!','warning');
			return;
		}
	}
	var url;
	if(oldclzt!=null&&oldclzt!=""){
		url=contextPath+'/dxwh/updateCode_Dxmb.do';
		if(clzt==oldclzt&&sftjhfs==oldsftjhfs&&jsdx==oldjsdx){
	    	save(url,clzt,sftjhfs,jsdx,fsnr,fssj,fssj_days,fssj_hour,fspl,zt,oldclzt,oldsftjhfs,oldjsdx,areaCode);
		}else{
    		checkCode(url,clzt,sftjhfs,jsdx,fsnr,fssj,fssj_days,fssj_hour,fspl,zt,oldclzt,oldsftjhfs,oldjsdx,areaCode);
    	}
	}else{
		url=contextPath+'/dxwh/saveCode_Dxmb.do';
		checkCode(url,clzt,sftjhfs,jsdx,fsnr,fssj,fssj_days,fssj_hour,fspl,zt,oldclzt,oldsftjhfs,oldjsdx,areaCode);
	}
}
function save(url,clzt,sftjhfs,jsdx,fsnr,fssj,fssj_days,fssj_hour,fspl,zt,oldclzt,oldsftjhfs,oldjsdx,areaCode){
	$.ajax( {
		url : url,
		data : {
			"dxwh_dxmb.clzt" : clzt,
			"dxwh_dxmb.sftjhfs" : sftjhfs,
			"dxwh_dxmb.jsdx" : jsdx,
			"dxwh_dxmb.fsnr" : fsnr,
			"dxwh_dxmb.fssj" : fssj,
			"dxwh_dxmb.fssj_days" : fssj_days,
			"dxwh_dxmb.fssj_hour" : fssj_hour,
			"dxwh_dxmb.fspl" : fspl,
			"dxwh_dxmb.zt" : zt,
			"olddxwh_dxmb.clzt" : oldclzt,
			"olddxwh_dxmb.sftjhfs" : oldsftjhfs,
			"olddxwh_dxmb.jsdx" : oldjsdx,
			"dxwh_dxmb.areaCode":areaCode
		},
		type : 'POST',
		dataType : 'json',
		error : function() {
			$.messager.alert('系统提示', '添加出现错误输入','warning');
			return;
		},
		success : function(data) {
			search();
			$('#show1').css("display","none");
			$('#show2').css("display","none");
			$('#add').window('close');
		}
	});
}
