//设置信息系统提示窗口
   var flag=false;
   function del(typecode,ids,lb){
	 //  alert(ids);
	     var contextPath = $('#contextPath').val();
		$.messager.confirm('编号删除', '你确认要删除已经选中的数据吗？', function(r){
				if (r){
					 if(lb==0){
						 $.ajax({  
							url :contextPath+'/code/deleteTypecode.do',   
							data : {   
								ids : ids   
							},   
							type : 'POST',   
							success : function() { 	
							      bmtj('');
								 $('#tt2').treegrid('reload');	
								 $('#tt2').treegrid('clearSelections');
							}   
					   }); 
					 }else if(lb==1){
					     $.ajax({  
							url :contextPath+'/code/deleteCode.do',   
							data : {   
								ids : ids   
							},   
							type : 'POST',   
							success : function() { 		
								 search(typecode);
								 $('#tt2').treegrid('clearSelections');
							}   
					   }); 
					 }
				}
			});
			    
		}
function edit(code,typecode,lb,qx){
     var contextPath = $('#contextPath').val();
	 if(lb==0){
		  $("#flb").html("");
		  $.ajax({   
					   url : contextPath+'/code/findTypecode.do',  
						data:{"typecode.typecode":typecode},
						type : 'POST',
						dataType : 'json',  
						success : function(data) {
							 flag=false;
							$('#oldbh').val(data.typecode);
							$('#bh').val(data.typecode);
							$('#mc').val(data.typename);
							$('#lb').val(lb);
							 $('#bh').attr('readonly',true);
							if(qx==1){
								$("#save").html("");
								/*$("#button").html("<a id='cancel' class='easyui-linkbutton' icon='icon-cancel' href='javascript:closes()'>关闭</a>");*/
								
							}
							$('#add').window('open'); 
						 
						}
					});
		 }else if(lb==1){
			   $("#flb").html('<td align="right" height="28">父编码：</td><td width="38%"  align="left"><select id="fbh" name="fbh"></select></td>');
	   fbh();
		 $.ajax({   
					   url : contextPath+'/code/findCode.do',  
						data:{"code.code":code,"code.typecode":typecode},
						type : 'POST',
						dataType : 'json',  
						success : function(data) {
							 flag=false;
							$('#oldbh').val(data.code);
							$('#bh').val(data.code);
							$('#lb').val(lb);
							$('#mc').val(data.name);
							$('#bh').attr('readonly',true);
							 var count=$("#fbh option").length;

						  for(var i=0;i<count;i++)  
							 {  
							 if($("#fbh").get(0).options[i].value == data.typecode)  
								{  
									$("#fbh").get(0).options[i].selected = true;  
								  
									break;  
								}  
							}
							if(qx==1){
								$("#save").html("");
							}
							$('#add').window('open'); 
						 
						}
					});
		}
   }
function search(typecode){
	    
	    if(typecode==''){
		   typecode=$("input[name=sfbh]").val();
		}
		 //alert(typecode);
		var code=$("#bh").val();
        var mc=$("#mc").val();
		if(typecode!=''){
			$('#tt2').treegrid({
				queryParams: {
					"search.typecode": typecode
				}
			});
			
			displayMsg();  
		}
	}
     
	
function closes(win){
      $('#'+win).window('close');
   }	
function checkCode(id){
		//alert(code);
		var lb=$("#lb").val();
	  if(lb==0){	
	   var contextPath = $('#contextPath').val();
	   var oldbh=$('#oldbh').val();
	   if(oldbh!=id && id!=''){
		  $.ajax({   
					   url : contextPath+'/code/checkTypecode.do',  
						type : 'POST',
						data:{'id':id},
						dataType : 'json',  
						success : function(data) {
							flag=data;
							if(flag){
							   $.messager.alert('系统提示', '编码已经存在，请输入其他编号！','warning'); 
							}
						}
					});
	   }else{
	      flag=false;
	   }
	  }
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
function add(lb) {
	$('#oldbh').val("");
	$('#bh').val("");
	$('#mc').val("");
	$("#lb").val(lb);
	$('#bh').attr('readonly',false);

	if(lb=="0"){
	   $("#flb").html("");
	}else{
		if($("input[name=sfbh]").val()==null||$("input[name=sfbh]").val()==""){
			$.messager.alert('系统提示', '请先选择代码类型,再执行添加操作!','warning'); 
			return;
		}
	   $("#flb").html('<td align="right" height="28">父编码：</td><td width="38%"  align="left"><select id="fbh" name="fbh"></select></td>');
	   fbh();
	}
	$('#add').window('open');

}
function fbh(){
	var contextPath = $('#contextPath').val();
	var typecode=$("input[name=sfbh]").val();
   $.ajax( {
			url : contextPath + '/code/findTypecodes.do',
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '系统出现错误','warning');
			},
			success : function(data) {
				     var fbh=document.getElementById('fbh');
				     for(var i=0;i<data.length;i++){
					    fbh.options.add(new Option(data[i].name,data[i].code)); 
						if(typecode==data[i].code){
						   fbh.options[i].selected = true; 
						}
					 }
				}
			});
}

function saveCode() {
	var bh=$('#bh').val();
	var mc=$('#mc').val();
    var lb=$("#lb").val();
	//alert(lb);
    if(lb==0){
		 if(flag){
			 $.messager.alert('系统提示', '编码已经存在，请输入其他编号！','warning'); 
		 }else if(bh==""){
		   $.messager.alert('系统提示', '编码不能为空','warning'); 
		}else if(mc==""){
			$.messager.alert('系统提示', '名称不能为空','warning'); 
		}else{
		 saveTcode(bh,mc);
		}
	}else{
	  	var fbh=$('#fbh').val();
	    if(fbh==""){
		   $.messager.alert('系统提示', '父编码不能为空','warning'); 
		}else if(bh==""){
		   $.messager.alert('系统提示', '编码不能为空','warning'); 
		}else if(mc==""){
			$.messager.alert('系统提示', '名称不能为空','warning'); 
		}else{
		 save(fbh,bh,mc);
		}
	  
	}
}

function  saveTcode(bh,mc) {
		var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/code/updateTypecode.do',
			data : {
				"typecode.typecode" : bh,
				"typecode.typename" : mc
				
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '添加出现错误输入','warning');
			},
			success : function(data) {
				   bmtj(bh);
				   search(bh);
				   $('#add').window('close');
				}
			});
		 

    }
   function bmtj(bh){
	   var contextPath = $('#contextPath').val();
	   $('#sfbh').combobox({
					url:contextPath+'/code/findTypecodes.do',
					valueField:'code',
					textField:'name',
					 onHidePanel:function(){
					   search('');
					 }
				});
	   $('#sfbh').combobox('setValue',bh);
		  /* $.ajax( {
				url :   contextPath+'/code/findTypecodes.do',
				type : 'POST',
				dataType : 'json',
				error : function() {
					$.messager.alert('系统提示', '系统出现错误','warning');
				},
				success : function(data) {
						 var fbh=document.getElementById('sfbh');
						  var count=fbh.length;
						  for(i=1;i<count;i++){
							  fbh.options.length--;
						  }
						 for(var i=0;i<data.length;i++){
							fbh.options.add(new Option(data[i].name,data[i].code)); 
							if(data[i].code==bh){
							  fbh.options[i+1].selected = true; 
							 }
						 }
						 
					}
				});*/
	   }
function  save(fbh,bh,mc){
   var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/code/updateCode.do',
			data : {
				"code.typecode" : fbh,
				"code.name" : mc,
				"code.code":bh,
				"code.enable":"1"
				
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '添加出现错误输入','warning');
			},
			success : function(data) {
				   search(fbh);
				   $('#add').window('close');
				}
			});
		 

}

