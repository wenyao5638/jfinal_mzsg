//设置信息系统提示窗口
var flag=false;

function changeSqly_search(){
	var sarea=$("#clcode1").val();
	var slx=$("#slx").val();
	if(sarea!="" && slx!=""){
		var contextPath = $('#contextPath').val();
		$.ajax({
			type:'POST',
			url: contextPath+"/clqdcode/findSqly.do",
			data:{"lx":slx,"area":sarea} ,
			dataType: "json",
			error: function(){
				alert("服务器繁忙，请稍后重试...");
			},
			success: function(date){
				var sqly=document.getElementById('ssqly');
				var count=sqly.length;
				for(i=1;i<count;i++){
					sqly.options.length--;
				}
				for (i=0;i< date.length;i++){ 
					sqly.options.add(new Option(date[i].name,date[i].code));
				}			   			  	 
			}
		});
	}
}
function findArea(){
	var contextPath = $('#contextPath').val();
	$.ajax({
		type:'POST',
		url: contextPath+"/area/findQu.do",
		data:{"lx":lx} ,
		dataType: "json",
		error: function(){
			alert("服务器繁忙，请稍后重试...");
		},
		success: function(data){
			var area=document.getElementById('clcode2');
		//	area.empty();
			for (i=0;i< data.length;i++){ 
				area.options.add(new Option(data[i].name,data[i].code));
			}			   			  	 
		}
	});
}
function changeSqly(){
	var contextPath = $('#contextPath').val();
	var area=$("#clcode2").val();
	var lx=$("#lx").val();
	if(area!="" && lx!=""){
	
		$.ajax({
			type:'POST',
			url: contextPath+"/clqdcode/findSqly.do",
			data:{"lx":lx,"area":area} ,
			dataType: "json",
			error: function(){
				alert("服务器繁忙，请稍后重试...");
			},
			success: function(date){
				var sqlyselect=document.getElementById('sqly');
				var count=sqlyselect.length;
				for(i=1;i<count;i++){
					sqlyselect.options.length--;
				}
				for (i=0;i< date.length;i++){
					sqlyselect.options.add(new Option(date[i].name,date[i].code));
					if(sqly!=null&&sqly!=""&&sqly==date[i].code){
						sqlyselect.options[i+1].selected = true; 
					}
				}			   			  	 
			}
		});
	}
}
function changeSqly_c(sqly){
	var contextPath = $('#contextPath').val();
	var area=$("#clcode2").val();
	var lx=$("#lx").val();
	if(area!="" && lx!=""){
		$.ajax({
			type:'POST',
			url: contextPath+"/clqdcode/findSqly.do",
			data:{"lx":lx,"area":area} ,
			dataType: "json",
			error: function(){
				alert("服务器繁忙，请稍后重试...");
			},
			success: function(date){
				var sqlyselect=document.getElementById('sqly');
				var count=sqlyselect.length;
				for(i=1;i<count;i++){
					sqlyselect.options.length--;
				}
				for (i=0;i< date.length;i++){
					sqlyselect.options.add(new Option(date[i].name,date[i].code));
					if(sqly!=null&&sqly!=""&&sqly==date[i].code){
						sqlyselect.options[i+1].selected = true; 
					}
				}			   			  	 
			}
		});
	}
}

function delCode(area,lx,sqly,xh){
	var contextPath = $('#contextPath').val();
	$.messager.confirm('编号删除', '你确认要删除该记录吗？', function(r){
	if (r){
		$.ajax({
			url :contextPath+'/clqdcode/delCode.do',
			data : {
				"clqdCode.lx" : lx,
				"clqdCode.sqly" : sqly,
				"clqdCode.xh" : xh,
				"clqdCode.area" : area
			},
			type : 'POST',
			success : function() {
				 $('#tt2').datagrid('reload');
			}
		});
	}
	});
}
		
function edit(area,lx,sqly,xh,nameshort,name,isneed){
	var contextPath = $('#contextPath').val();
	
	$('#lx').val(lx);
	//$('#area').val(area);
	var zTree = $.fn.zTree.getZTreeObj("clmenutree2"),
	node = zTree.getNodeByParam("id",area,null);
	zTree.selectNode(node);
	$("#clmenu2").attr("value", node.name);
	$("#clcode2").attr("value", node.id);
	
	changeSqly_c(sqly);
	//$('#sqly').val(sqly);
	$('#xh').val(xh);
	$('#nameshort').val(nameshort);
	$('#name').val(name);
	$("input[name=isneed][value="+isneed+"]").attr("checked", true);
	$('#oldlx').val(lx);
	$('#oldsqly').val(sqly);
	$('#oldxh').val(xh);
	
	$('#add').window('open');  
}

function search(lx,sqly){
	var lx = $('#lx').val();
	var sqly = $('#sqly').val();
	$('#tt2').datagrid({
		queryParams: {"search.lx": lx,"search.sqly":sqly}
	});
	displayMsg();  
}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(area,url,lx,sqly,xh,nameshort,name,isneed,oldlx,oldsqly,oldxh){
	
	$.ajax({   
		url : contextPath+'/clqdcode/checkCode.do',  
		type : 'POST',
		data:{
			"clqdCode.area" : area,
			"clqdCode.lx" : lx,
			"clqdCode.sqly" : sqly,
			"clqdCode.xh" : xh
		},
		dataType : 'json',  
		success : function(data) {
			flag=data;
			if(flag){
				$.messager.alert('系统提示', '编码已经存在，请输入其他编号！','warning');
				return;
			}else{
				save(area,url,lx,sqly,xh,nameshort,name,isneed,oldlx,oldsqly,oldxh);
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
		height : 320,
		top:($(window).height() - 320) * 0.5,   
        left:($(window).width() - 600) * 0.5,

		resizable : false
	});
}

function add() {
	$('#lx').val("");
	$('#sqly').val("");
	$('#xh').val("");
	$('#nameshort').val("");
	$('#name').val("");
	$("input[name=isneed][value=1]").attr("checked", true);
	$('#oldlx').val("");
	$('#oldsqly').val("");
	$('#oldxh').val("");
	var sqlyselect=document.getElementById('sqly');
	var count=sqlyselect.length;
	for(i=1;i<count;i++){
		sqlyselect.options.length--;
	}
	$('#add').window('open');
	
	
}

function saveCode() {
	var contextPath = $('#contextPath').val();
	var lx=$('#lx').val();
	var area=$('#clcode2').val();
	var sqly=$('#sqly').val();
    var xh=$("#xh").val();
    var nameshort=$("#nameshort").val();
    var name=$("#name").val();
	var isneed=$("[name=isneed]:checked").val();
	var oldlx=$('#oldlx').val();
	var oldsqly=$('#oldsqly').val();
	var oldxh=$('#oldxh').val();

	if(area==""){
		$.messager.alert('系统提示', '请选择所属区域!','warning');
		return;
	}
	else if(lx==""){
		$.messager.alert('系统提示', '请选择类型!','warning');
		return;
	}
	else if(sqly==""){
		$.messager.alert('系统提示', '请选择申请理由!','warning');
		 return;
	}
	else if(nameshort==""){
		$.messager.alert('系统提示', '请填写简称!','warning');
		return;
	}
	else if(name==""){
		$.messager.alert('系统提示', '请填写全称!','warning');
		return;
	}
	var url;
	if(oldlx!=null&&oldlx!=""){
		url=contextPath+'/clqdcode/updateCode.do';
	}else{
		url=contextPath+'/clqdcode/saveCode.do';
	}
    if(oldlx!=lx&&oldsqly!=sqly&&oldxh!=xh){
    	//保存用的方法,判断是否重名
    	checkCode(area,url,lx,sqly,xh,nameshort,name,isneed,oldlx,oldsqly,oldxh);
    }else{
		save(area,url,lx,sqly,xh,nameshort,name,isneed,oldlx,oldsqly,oldxh);
	}
}
function save(area ,url,lx,sqly,xh,nameshort,name,isneed,oldlx,oldsqly,oldxh){
	 
	 if(oldxh!=null && oldxh!=""){
		$.ajax( {
			url : url,
			data : {
				"clqdCode.area" : area,
				"clqdCode.lx" : lx,
				"clqdCode.sqly" : sqly,
				"clqdCode.xh" : xh,
				"clqdCode.nameshort":nameshort,
				"clqdCode.name":name,
				"clqdCode.isneed":isneed,			
				"oldclqdCode.lx" : oldlx,
				"oldclqdCode.sqly" : oldsqly,
				"oldclqdCode.xh" : oldxh	
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '添加出现错误输入','warning');
				return;
			},
			success : function(data) {
				search(lx,sqly);
				$('#add').window('close');
			}
		});
	 }else{
		 $.ajax( {
				url : url,
				data : {
					"clqdCode.area" : area,
					"clqdCode.lx" : lx,
					"clqdCode.sqly" : sqly,
					"clqdCode.xh" : xh,
					"clqdCode.nameshort":nameshort,
					"clqdCode.name":name,
					"clqdCode.isneed":isneed
				
				},
				type : 'POST',
				dataType : 'json',
				error : function() {
					$.messager.alert('系统提示', '添加出现错误输入','warning');
					return;
				},
				success : function(data) {
					search(lx,sqly);
					$('#add').window('close');
				}
			});
	 
	 }
}
