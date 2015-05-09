//设置信息系统提示窗口
var flag=false;

function delCode(id){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('记录删除', '你确认要删除该记录吗？', function(r){
	if (r){
		$.ajax({
			url :contextPath+'/zsyzh/delCode.do',
			data : {
				"id" : id
			},
			type : 'POST',
			success : function() {
				 $('#tt2').datagrid('reload');
			}
		});
	}
	});
}
		
function edit(id){
	var contextPath = $('#contextPath').val();
	$.ajax({   
		url : contextPath+'/zsyzh/findCode.do',  
		data:{"id":id},
			type : 'POST',
			dataType : 'json',  
		success : function(data) {
			$('#id').val(data.id);
			var zTree = $.fn.zTree.getZTreeObj("menutree5"),
		node = zTree.getNodeByParam("id",data.area,null);
		zTree.selectNode(node);
		$("#menu5").attr("value", node.name);
		$("#code5").attr("value", node.id);
			$('#zsyzhs').val(data.zsyzhs);
			$('#zsyzhe').val(data.zsyzhe);
			$('#bz').val(data.bz);
			$('#add').window('open');  
		}
	});	
}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(url,id,area,zsyzhs,zsyzhe,bz){
	$.ajax({   
		url : contextPath+'/zsyzh/checkCode.do',  
		type : 'POST',
		data:{
			"zsyzh.id" : id,
			"zsyzh.area" : area,
			"zsyzh.zsyzhs" : zsyzhs,
			"zsyzh.zsyzhe" : zsyzhe,
			"zsyzh.bz" : bz
		},
		dataType : 'json',  
		success : function(data) {
			if(data==""){
				save(url,id,area,zsyzhs,zsyzhe,bz);
			}else{
				$.messager.alert('系统提示', '再生育证号与"'+data+'"重复,请核实!','warning');
				return;
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
	$('#zsyzhs').val("");
	$('#zsyzhe').val("");
	$('#bz').val("");
	$('#id').val("");
	$('#add').window('open');
}

function saveCode() {
	var contextPath = $('#contextPath').val();
	var area=$('#code5').val();
	var zsyzhs=$('#zsyzhs').val();
	var zsyzhe=$('#zsyzhe').val();
	var bz=$('#bz').val();
	var id=$('#id').val();
	if(area==""){
		$.messager.alert('系统提示', '请选择镇(街道)!','warning');
		return;
	}
	if(zsyzhs==""){
		$.messager.alert('系统提示', '请输入再生育证号最小值!','warning');
		 return;
	}
	if(zsyzhe==""){
		$.messager.alert('系统提示', '请输入再生育证号最大值!','warning');
		 return;
	}
	if(Number(zsyzhs)>=Number(zsyzhe)){
		$.messager.alert('系统提示', '再生育证号范围应由小到大输入!','warning');
		 return;
	}
	var url;
	if(id!=null&&id!=""){
		url=contextPath+'/zsyzh/updateCode.do';
	}else{
		url=contextPath+'/zsyzh/saveCode.do';
	}
    checkCode(url,id,area,zsyzhs,zsyzhe,bz);
}
function save(url,id,area,zsyzhs,zsyzhe,bz){
	$.ajax( {
		url : url,
		data : {
			"zsyzh.id" : id,
			"zsyzh.area" : area,
			"zsyzh.zsyzhs" : zsyzhs,
			"zsyzh.zsyzhe" : zsyzhe,
			"zsyzh.bz" : bz
		},
		type : 'POST',
		dataType : 'json',
		error : function() {
			$.messager.alert('系统提示', '添加出现错误输入','warning');
			return;
		},
		success : function(data) {
			$('#add').window('close');
			$('#tt2').datagrid('reload');
		}
	});
}
