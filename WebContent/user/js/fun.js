//设置信息系统提示窗口
   var flag=false;
   function del(ids){
	 //  alert(ids);
	     var contextPath = $('#contextPath').val();
		$.messager.confirm('编号删除', '你确认要删除已经选中的数据吗？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/fun/deleteFun.do',   
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
function edit(id,qx){
     var contextPath = $('#contextPath').val();
	  $.ajax({   
                   url : contextPath+'/fun/findFun.do',  
					data:{"fun.id":id},
                    type : 'POST',
					dataType : 'json',  
                    success : function(data) {
			             var contextPath=$('#contextPath').val();
						 flag=false;
						$('#id').val(data.id);
						$('#pid').val(data.pid);
						$('#oldid').val(data.id);
						$('#cnname').val(data.cnname);
						$('#href').val(data.href);
						
						$('#icon').val(data.icon);
						$("input[name=dlbz][value="+data.dlbz+"]").attr("checked", true);
						
						$("input[name=manager][value="+data.manage+"]").attr("checked", true);
						$('#id').attr('readonly',true);
						if(qx==1){
						    $("#save").html("");
							/*$("#button").html("<a id='cancel' class='easyui-linkbutton' icon='icon-cancel' href='javascript:closes()'>关闭</a>");*/
							
						}
					    $('#add').window('open'); 
					 
					}
                });
  
		
   }
function search(){
	     var cnname = $('#scnname').val();
	    var id = $('#sid').val();
		  var pid=$("#spid").val();
	   var dlbz=$("[name=sdlbz]:checked").val();
	var manager=$("[name=smanage]:checked").val();
    
		$('#tt2').datagrid({
			queryParams: {
				"search.cnname": cnname,"search.id":id,"search.pid":pid,"search.dlbz":dlbz,"search.manage":manager
			}
		});
		displayMsg();  
	}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkFun(id){
		//alert(code);
		
	   var contextPath = $('#contextPath').val();
	   var oldid=$('#oldid').val();
	   if(oldid!=id && id!=''){
		  $.ajax({   
					   url : contextPath+'/fun/checkFun.do',  
						type : 'POST',
						data:{'id':id},
						dataType : 'json',  
						success : function(data) {
							flag=data;
							if(flag){
							   $.messager.alert('系统提示', '权限编码已经存在，请输入其他编号！','warning'); 
							}
						}
					});
	   }
  }
function openFun() {
	$('#add').window( {
		title : '权限设置',
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
	// $("input[name=status]").attr("checked","1");
	$('#id').val("");
	$('#pid').val("");
	$('#cnname').val("");
	$('#oldid').val("");
	$('#href').val("");
	$("input[name=dlbz][value=0]").attr("checked", true);
	$("input[name=manager][value=1]").attr("checked", true);
	$('#id').attr('readonly',false);
	$('#icon').val("");
	//$("#button").html("<a href='#'>看啊看你</a>");

	$('#add').window('open');

}


function saveFun() {
	var id=$('#id').val();
	var pid=$('#pid').val();
	var cnname=$('#cnname').val();
	var href=$('#href').val();
	var dlbz=$("[name=dlbz]:checked").val();
	var manager=$("[name=manager]:checked").val();
 //alert(id);
 	var icon=$('#icon').val();
	 if(id==""){
	   $.messager.alert('系统提示', '编码不能为空','warning'); 
	}else if(name==""){
	    $.messager.alert('系统提示', '名称不能为空','warning'); 
	}else{
     save(id,pid,cnname,href,dlbz,manager,icon);
	}
}
function  save(id,pid,cnname,href,dlbz,manager,icon) {
		var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/fun/updateFun.do',
			data : {
				"fun.id" : id,
				"fun.pid" : pid,
				"fun.cnname" : cnname,
				"fun.href" : href,
				"fun.dlbz" : dlbz,
				"fun.manage" : manager,
				"fun.icon":icon
				
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '权限添加出现错误输入','warning');
			},
			success : function(data) {
				   $('#tt2').datagrid('reload');
				   $('#add').window('close');
				}
			});
		 

    }

