//设置信息系统提示窗口
var flag=false;

function delCode(area,lx,sqly){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('编号删除', '你确认要删除该记录吗？', function(r){
	if (r){
		$.ajax({
			url :contextPath+'/sqly/delCode.do',
			data : {
				"sqly.lx" : lx,
				"sqly.sqly" : sqly,
				"sqly.area" : area
			},
			type : 'POST',
			success : function() {
				 $('#tt2').datagrid('reload');
			}
		});
	}
	});
}
		
function edit(area,lx,sqly,sqlyshort,sqlyfull,sqlylaw,sfzx){
	var contextPath = $('#contextPath').val();
	$('#lx').val(lx);
	
		var zTree = $.fn.zTree.getZTreeObj("menutree5"),
		node = zTree.getNodeByParam("id",area,null);
		zTree.selectNode(node);
		$("#menu5").attr("value", node.name);
		$("#code5").attr("value", node.id);
	$('#sqly').val(sqly);
	$('#sqlyshort').val(sqlyshort);
	$('#sqlyfull').val(sqlyfull);
	$('#sqlylaw').val(sqlylaw);
	$("input[name=sfzx][value="+sfzx+"]").attr("checked", true);
	$('#oldlx').val(lx);
	$('#oldsqly').val(sqly);
	$('#add').window('open');  
}

function search(lx,sqly){
	var lx = $('#slx').val();
	var sarea = $('#sarea').val();
	$('#tt2').datagrid({
		queryParams: {"search.lx": lx,"search.area":area}
	});
	displayMsg();  
}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(area,url,lx,sqly,sqlyshort,sqlyfull,sqlylaw,sfzx,oldlx,oldsqly){
	$.ajax({   
		url : contextPath+'/sqly/checkCode.do',  
		type : 'POST',
		data:{
			"sqly.lx" : lx,
			"sqly.sqly" : sqly,
			"sqly.area" : area
		},
		dataType : 'json',  
		success : function(data) {
			flag=data;
			if(flag){
				$.messager.alert('系统提示', '类型，顺序号不能和已存在的记录重复!','warning');
				return;
			}else{
				save(area,url,lx,sqly,sqlyshort,sqlyfull,sqlylaw,sfzx,oldlx,oldsqly);
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
	$('#lx').val("");
	$('#sqly').val("");
	$('#sqlyshort').val("");
	$('#sqlyfull').val("");
	$('#sqlylaw').val("");
	$("input[name=sfzx][value=2]").attr("checked", true);
	$('#oldlx').val("");
	$('#oldsqly').val("");
	$("#menu5").attr("value","");
	$("#code5").attr("value", "");
	$('#add').window('open');
}

function saveCode() {
	var contextPath = $('#contextPath').val();
	var lx=$('#lx').val();
	var area=$('#code5').val();
	var sqly=$('#sqly').val();
	var sqlyshort=$('#sqlyshort').val();
    var sqlyfull=$("#sqlyfull").val();
    var sqlylaw=$("#sqlylaw").val();
	var sfzx=$("[name=sfzx]:checked").val();
	var oldlx=$('#oldlx').val();
	var oldsqly=$('#oldsqly').val();
	if(area==""){
		$.messager.alert('系统提示', '请选择所属区域!','warning');
		return;
	}else if(lx==""){
		$.messager.alert('系统提示', '请选择类型!','warning');
		return;
	}
	else if(sqly==""){
		$.messager.alert('系统提示', '请填写顺序号!','warning');
		 return;
	}
	else if(sqlyshort==""){
		$.messager.alert('系统提示', '请填写申请理由简称!','warning');
		 return;
	}
	else if(sqlyfull==""){
		$.messager.alert('系统提示', '请填写申请理由全称!','warning');
		return;
	}
	else if(sqlylaw==""){
		$.messager.alert('系统提示', '请填写法律条款!','warning');
		return;
	}
	var url;
	if(oldlx!=null&&oldlx!=""){
		url=contextPath+'/sqly/updateCode.do';
	}else{
		url=contextPath+'/sqly/saveCode.do';
	}
    if(oldlx!=lx&&oldsqly!=sqly){
    	//保存用的方法,判断是否重名
    	checkCode(area,url,lx,sqly,sqlyshort,sqlyfull,sqlylaw,sfzx,oldlx,oldsqly);
    }else{
		save(area,url,lx,sqly,sqlyshort,sqlyfull,sqlylaw,sfzx,oldlx,oldsqly);
	}
}
function save(area,url,lx,sqly,sqlyshort,sqlyfull,sqlylaw,sfzx,oldlx,oldsqly){
	$.ajax( {
		url : url,
		data : {
			"sqly.lx" : lx,
			"sqly.sqly" : sqly,
			"sqly.sqlyshort" : sqlyshort,
			"sqly.sqlyfull" : sqlyfull,
			"sqly.sqlylaw":sqlylaw,
			"sqly.area":area,
			"sqly.sfzx":sfzx,
			"oldsqly.lx" : oldlx,
			"oldsqly.sqly" : oldsqly
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
