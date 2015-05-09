
   var flag=false; 
   function del(ids){
	    var contextPath = $('#contextPath').val();
		$.messager.confirm('记录删除', '你确认要删除已经选中的数据吗？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/user/deleteUser',   
						data : {   
							ids : ids   
						},   
						type : 'POST',   
						success : function(data) {
							if(data){
								$('#tt2').datagrid('reload');	
								$('#tt2').datagrid('clearSelections');
							}
						}   
                   }); 
				}
			});  
		}
		
   
   function reUser(username){
	    var contextPath = $('#contextPath').val();
		$.messager.confirm('用户初始化', '你确认要初始化该用户？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/user/reUser',   
						data : {   
							username : username   
						},   
						type : 'POST',   
						success : function() {
						  $.messager.alert('系统提示', '初始化成功！'); 
						}   
                   }); 
				}
			});  
		}

   
   function closes(win){
      $('#'+win).window('close');
   }	
  function checkUser(username){
	   var contextPath = $('#contextPath').val();
	   var olduser=$('#olduser').val();
       if(username!=olduser && username!=''){
		  $.ajax({   
					   url : contextPath+'/user/checkUser',  
						type : 'POST',
						data:{'username':username},
						dataType : 'json',  
						success : function(data) {
							flag=data;
							if(flag){
							   $.messager.alert('系统提示', '用户名已经存在，请输入其他用户名！'); 
							}
						}
					});
	   }
  }
function openUser() {
	$('#jDialogContainer').window( {
		title : '用户设置',
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
 
  //$("input[name=status]").attr("checked","1");
	$('#area').val("");
	$('#menu4').val("");
	$('#username').val("");
	$('#bmmc').val("");
  //$('#password').val("");
	$('#usercnname').val("");
  //$('#lxdh').val("");
    $('#createtime').val("");
    $('#createuser').val("");
  //$('#lastlogintime').val("");
    $('#menu2').val("");
    $('#olduser').val("");
    $('#phone').val("");
  //$("input[name=xb][value=1]").attr("checked", true);
	$("input[name=enable][value=1]").attr("checked", true);
    $('#email').val("");
	$("input[name=xb][value=男]").attr("checked", true);
    $('#username').attr('readonly',false);
   	 flag=false;

   	 $('#jDialogContainer').window('open');

}


function saveUser() {
	var username=$('#username').val();
	//var password=$('#password').val();
	var usercnname=$('#usercnname').val();
	var area=$('#menu2').val();
	var bmmc=$('#bmmc').val();
	var roleid=$('#code4').val();
	var phone=$('#phone').val();
//	var email=$('#email').val();
	var area=$('#code2').val();
	var createuser=$('#createuser').val();
	var createtime=$('#createtime').val();

	//var lastlogintime=$('#lastlogintime').val();
	var enable=$("[name=syzt]:checked").val();
	//alert(username);
	//alert(password);
	//alert(bmmc);
	checkUser(username);
	if(flag){
	 $.messager.alert('系统提示', '用户名已经存在，请输入其他用户名！','warning'); 
	}else if(username==""){
	   $.messager.alert('系统提示', '用户名不能为空','warning'); 
	}else if(usercnname==""){
	    $.messager.alert('系统提示', '姓名不能为空','warning'); 
	}else if(bmmc==""){
		$.messager.alert('系统提示', '部门名称不能为空','warning'); 
	}else if(area==""){
	    $.messager.alert('系统提示', '请选择用户所属地区','warning'); 
	}else if(roleid==""){
	    $.messager.alert('系统提示', '请选择用户角色','warning'); 
	}else{
     	save(username,usercnname,bmmc,roleid,phone,area,createuser,createtime,enable);
	}
}
function save(username,usercnname,bmmc,roleid,phone,area,createuser,createtime,enable) {
		var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/user/updateUser',
			data : {
				"u.username" : username,
				"u.usercnname" : usercnname,
				"u.bmmc" : bmmc,
				"u.role" : roleid,
				"u.phone" : phone,
				"u.area" : area,
				"u.createuser" : createuser,
				"u.createtime" : createtime,
				"u.syzt" : enable
				
			},
			type : 'POST',
			dataType : 'json',
			error : function(e) {
				$.messager.alert('系统提示', '区域编码添加出现错误输入 '+e,'warning');
			},
			success : function(data) {
				   $('#tt2').datagrid('reload');
				   $('#jDialogContainer').window('close');
				}
			});
    }


//检验邮箱
/*function checkEmail() {
	var email = document.getElementById("email").value;
	if (email != "") {
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		isok = reg.test(email);
		if (!isok) {
			alert("email输入有误!");
			document.getElementById("email").focus();
		}
	};
}*/










