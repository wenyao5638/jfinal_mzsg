//设置信息系统提示窗口
   function delCode(id){
	    var contextPath = $('#contextPath').val();
		$.messager.confirm('记录删除', '你确认要删除已经选中的数据吗？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/dxwh/delCode_Jsdx.do',   
						data : {   
							"dxwh_jsdx.id" : id
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
 function openUsers(){
	var jsdx=$('#jsdx').val();
	if(jsdx==""){
	    $.messager.alert('系统提示', '请先选择短信接收对象!','warning');
	    return;
	}
	if(jsdx=="9"){
		$.messager.alert('系统提示', '申请人不用添加!','warning'); 
		$('#jsdx').val('');
		return;
	} 
	 var contextPath = $('#contextPath').val();
	        $('#userlist').dialog({
				buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						addUser();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						closeUsers();
					}
				}],
				title:"具体人员选择"
			});
			
			var url=contextPath+"/user/jsdx_dialog.do?jsdx="+jsdx;
			$("#users").attr("src",url);
			$('#userlist').dialog('open');
		}
		function closeUsers(){
			$('#userlist').dialog('close');
		}
 function addUser(){
		    var array=window.frames["users"].$('#tt2').datagrid('getSelections');
			var str="";
			if(array.length>0){
				 var uids="";
				 var names="";
				for(var i=0;i<array.length;i++){
					uids+=array[i].username;	
					uids+=",";
					names+=array[i].cnname;	
					names+=",";
				} 
				 if(uids.length>0){
				  uids=uids.substring(0,uids.length-1);
				 }
				if(names.length>0){
				  names=names.substring(0,names.length-1);
				 }
				$("#username").val(uids);	
				$("#usercnname").val(names);
				closeUsers();			
			}else{
			   	$("#username").val("");				
				$("#usercnname").val("");
				closeUsers();		
			}
		
			
		}
     
   function closes(win){
      $('#'+win).window('close');
   }	
    
function open_Jsdx() {
	$('#search').window( {
		title : '查询',
		width : 600,
		modal : true,
		shadow : true,
		closed : true,
		height : 200,
		top:($(window).height() - 300) * 0.5,   
        left:($(window).width() - 500) * 0.5,
		resizable : false
	});
}	
function add() {
	$('#id').val("");
	$('#jsdx').val("");
	$('#username').val("");
	$('#usercnname').val("");

}


function save_Jsdx() {
	var contextPath = $('#contextPath').val();
	var id=$('#id').val();
	var jsdx=$('#jsdx').val();
	var username=$('#username').val();
	
	if(jsdx==""){
	    $.messager.alert('系统提示', '请选择接收对象!','warning');
	    return;
	}
	if(username==""){
	    $.messager.alert('系统提示', '请选择具体人员!','warning'); 
	    return;
	}
	
	var url;
    url=contextPath+'/dxwh/saveCode_Jsdx.do';
    save(url,id,jsdx,username);
}

function   save(url,id,jsdx,username) {
		$.ajax( {
			url : url,
			data : {
				"dxwh_jsdx.id" : id,
				"dxwh_jsdx.jsdx" : jsdx,
				"dxwh_jsdx.username" : username
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '添加出现错误输入','warning');
			},
			success : function(data) {
				   $('#tt2').datagrid('reload');
				   add();
				}
			});
		 

    }

