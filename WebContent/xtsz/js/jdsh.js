//设置信息系统提示窗口
var flag=false;

function delCode(area,lx){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('记录删除', '你确认要删除该记录吗？', function(r){
	if (r){
		$.ajax({
			url :contextPath+'/jdsh/delCode.do',
			data : {
				"jdsh.area" : area,
				"jdsh.lx" : lx
			},
			type : 'POST',
			success : function() {
				 $('#tt2').datagrid('reload');
			}
		});
	}
	});
}
		
function edit(area,nr,lx){
	var contextPath = $('#contextPath').val();
	var zTree = $.fn.zTree.getZTreeObj("menutree5"),
		node = zTree.getNodeByParam("id",area,null);
		zTree.selectNode(node);
		$("#menu5").attr("value", node.name);
		$("#code5").attr("value", node.id);
	$('#nr').val(nr);
	$('#oldarea').val(area);
	$('#lx').val(lx);
	$('#oldlx').val(lx);
	$('#add').window('open');  
}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(url,area,nr,oldarea,lx,oldlx){
	$.ajax({   
		url : contextPath+'/jdsh/checkCode.do',  
		type : 'POST',
		data:{
			"jdsh.area" : area,
			"jdsh.lx"   : lx
		},
		dataType : 'json',  
		success : function(data) {
			flag=data;
			if(flag){
				$.messager.alert('系统提示', '该地区决定书号模板已存在!','warning');
				return;
			}else{
				save(url,area,nr,oldarea,lx,oldlx);
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
	$("#menu5").attr("value","");
	$("#code5").attr("value", "");
	$('#nr').val("海人口计生[NF]i号");
	$('#oldarea').val("");
	$('#add').window('open');
}

function saveCode() {
	var contextPath = $('#contextPath').val();
	var area=$('#code5').val();
	var nr=$('#nr').val();
	var lx = $('#lx').val();
	var oldarea=$('#oldarea').val();
	var oldlx=$('#oldlx').val();
	if(area==""){
		$.messager.alert('系统提示', '请选择镇(街道)!','warning');
		return;
	}
	if(nr==""){
		$.messager.alert('系统提示', '请填写决定书号模板!','warning');
		 return;
	}
	var url;
	if(oldarea!=null&&oldarea!=""){
		url=contextPath+'/jdsh/updateCode.do';
	}else{
		url=contextPath+'/jdsh/saveCode.do';
	}
    if(oldarea!=area||oldlx!=lx){
    	//保存用的方法,判断是否重名
    	checkCode(url,area,nr,oldarea,lx,oldlx);
    }else{
		save(url,area,nr,oldarea,lx,oldlx);
	}
}
function save(url,area,nr,oldarea,lx,oldlx){
	$.ajax( {
		url : url,
		data : {
			"jdsh.area" : area,
			"jdsh.nr" : nr,
			"jdsh.lx" : lx,
			"oldjdsh.area" : oldarea,
			"oldjdsh.lx" : oldlx
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
