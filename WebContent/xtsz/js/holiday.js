//设置信息系统提示窗口
var flag=false;

function delCode(area){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('记录删除', '你确认要删除该记录吗？', function(r){
	if (r){
		$.ajax({
			url :contextPath+'/xzslxh/delCode.do',
			data : {
				"xzslxh.area" : area
			},
			type : 'POST',
			success : function() {
				 $('#tt2').datagrid('reload');
			}
		});
	}
	});
}
		
function edit(area,nr){
	var contextPath = $('#contextPath').val();
	$('#area').val(area);
	$('#nr').val(nr);
	$('#oldarea').val(area);
	$('#add').window('open');  
}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(url,area,nr,oldarea){
	$.ajax({   
		url : contextPath+'/xzslxh/checkCode.do',  
		type : 'POST',
		data:{
			"xzslxh.area" : area
		},
		dataType : 'json',  
		success : function(data) {
			flag=data;
			if(flag){
				$.messager.alert('系统提示', '该地区乡镇受理序号模板已存在!','warning');
				return;
			}else{
				save(url,area,nr,oldarea);
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
		height : 300,
		top:($(window).height() - 300) * 0.5,   
        left:($(window).width() - 600) * 0.5,
		resizable : false
	});
}

function add() {
	$('#area').val("");
	$('#nr').val("  （NF）i 号");
	$('#oldarea').val("");
	$('#add').window('open');
}

function saveCode() {
	var contextPath = $('#contextPath').val();
	var area=$('#area').val();
	var nr=$('#nr').val();
	var oldarea=$('#oldarea').val();
	if(area==""){
		$.messager.alert('系统提示', '请选择镇(街道)!','warning');
		return;
	}
	if(nr==""){
		$.messager.alert('系统提示', '请填写乡镇受理序号模板!','warning');
		 return;
	}
	var url;
	if(oldarea!=null&&oldarea!=""){
		url=contextPath+'/xzslxh/updateCode.do';
	}else{
		url=contextPath+'/xzslxh/saveCode.do';
	}
    if(oldarea!=area){
    	//保存用的方法,判断是否重名
    	checkCode(url,area,nr,oldarea);
    }else{
		save(url,area,nr,oldarea);
	}
}
function save(url,area,nr,oldarea){
	$.ajax( {
		url : url,
		data : {
			"xzslxh.area" : area,
			"xzslxh.nr" : nr,
			"oldxzslxh.area" : oldarea
		},
		type : 'POST',
		dataType : 'json',
		error : function() {
			$.messager.alert('系统提示', '添加出现错误输入','warning');
			return;
		},
		success : function(data) {
			search();
			$('#add').window('close');
		}
	});
}
