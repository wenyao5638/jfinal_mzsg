//设置信息系统提示窗口
   var flag=false;
   function del(ids){
	     var contextPath = $('#contextPath').val();
		$.messager.confirm('编号删除', '你确认要删除已经选中的数据吗？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/area/deleteArea.do',   
						data : {   
							ids : ids   
						},   
						type : 'POST',   
						success : function() { 		
						     $('#tt2').datagrid('reload');	
							 $('#tt2').datagrid('clearSelections');
						}   
                   }); 
				}
			});
			    
		}

  
     
	
   function closes(win){
      $('#'+win).window('close');
   }	
    function checkArea(code){
		//alert(code);
		
	   var contextPath = $('#contextPath').val();
	   var oldcode=$('#oldcode').val();
	   if(oldcode!=code && code!=''){
		  $.ajax({   
					   url : contextPath+'/area/checkArea.do',  
						type : 'POST',
						data:{'code':code},
						dataType : 'json',  
						success : function(data) {
							flag=data;
							if(flag){
							   $.messager.alert('系统提示', '区域编码已经存在，请输入其他编号！','warning'); 
							}
						}
					});
	   }
  }
function openArea() {
	$('#jDialogContainer').window( {
		title : '区域编号',
		width : 600,
		modal : true,
		shadow : true,
		closed : true,
		height : 280,
		top:($(window).height() - 280) * 0.5,   
        left:($(window).width() - 600) * 0.5,

		resizable : false
	});
}


function saveArea() {
	var name=$('#name').val();
	var code=$('#code').val();
	var superior=$('#code2').val();
	var level=$('#level').val();
	var scbz=$('input:radio[name=scbz]:checked').val();
	if(code==""){
	   $.messager.alert('系统提示', '编码不能为空','warning'); 
	}else if(name==""){
	    $.messager.alert('系统提示', '名称不能为空','warning'); 
	}else{
     	save(name,code,superior,level,scbz);
	}
}
function save(name,code,superior,level,scbz) {

		var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/area/updateArea.do',
			data : {
				"area.code" : code,
				"area.name" : name,
				"area.superior" : superior,
				"area.level" : level,
				"area.scbz" : scbz
				
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '区域编码添加出现错误输入','warning');
			},
			success : function(data) {
				   $('#tt2').datagrid('reload');
				   $('#jDialogContainer').window('close');
				}
			});
		 

    }

