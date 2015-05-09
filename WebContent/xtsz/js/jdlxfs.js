//设置信息系统提示窗口
var flag=false;

function delCode(area){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('记录删除', '你确认要删除该记录吗？', function(r){
	if (r){
		$.ajax({
			url :contextPath+'/jdlxfs/delCode.do',
			data : {
				"jdlxfs.area" : area
			},
			type : 'POST',
			success : function() {
				 $('#tt2').datagrid('reload');
			}
		});
	}
	});
}
		
function edit(area,lxdh){
	var contextPath = $('#contextPath').val();
	var zTree = $.fn.zTree.getZTreeObj("menutree5"),
		node = zTree.getNodeByParam("id",area,null);
		zTree.selectNode(node);
		$("#menu5").attr("value", node.name);
		$("#code5").attr("value", node.id);
	$('#lxdh').val(lxdh);
	$('#oldarea').val(area);
	$('#add').window('open');  
}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(url,area,lxdh,oldarea){
	$.ajax({   
		url : contextPath+'/jdlxfs/checkCode.do',  
		type : 'POST',
		data:{
			"jdlxfs.area" : area
		},
		dataType : 'json',  
		success : function(data) {
			flag=data;
			if(flag){
				$.messager.alert('系统提示', '该地区联系电话已存在!','warning');
				return;
			}else{
				save(url,area,lxdh,oldarea);
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
	$('#lxdh').val("");
	$('#oldarea').val("");
	$('#add').window('open');
}

function saveCode() {
	var contextPath = $('#contextPath').val();
	var area=$('#code5').val();
	var lxdh=$('#lxdh').val();
	var oldarea=$('#oldarea').val();
	if(area==""){
		$.messager.alert('系统提示', '请选择镇(街道)!','warning');
		return;
	}
	if(lxdh==""){
		$.messager.alert('系统提示', '请填写联系电话!','warning');
		 return;
	}
	var url;
	if(oldarea!=null&&oldarea!=""){
		url=contextPath+'/jdlxfs/updateCode.do';
	}else{
		url=contextPath+'/jdlxfs/saveCode.do';
	}
    if(oldarea!=area){
    	//保存用的方法,判断是否重名
    	checkCode(url,area,lxdh,oldarea);
    }else{
		save(url,area,lxdh,oldarea);
	}
}
function save(url,area,lxdh,oldarea){
	$.ajax( {
		url : url,
		data : {
			"jdlxfs.area" : area,
			"jdlxfs.lxdh" : lxdh,
			"oldjdlxfs.area" : oldarea
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
