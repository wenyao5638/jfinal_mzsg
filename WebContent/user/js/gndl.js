  var flag=false;
  function del(ids){
	 //  alert(ids);
	     var contextPath = $('#contextPath').val();
		$.messager.confirm('编号删除', '你确认要删除已经选中的数据吗？', function(r){
				if (r){
					 $.ajax({  
						url :contextPath+'/gndl/deleteGndl.do',   
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
                   url : contextPath+'/gndl/findGndl.do',  
					data:{"gndl.id":id},
                    type : 'POST',
					dataType : 'json',  
                    success : function(data) {
			             var contextPath=$('#contextPath').val();
						
						$('#id').val(data.id);
						$('#dlr').val(data.dlr);
						$('#dlrs').val(data.dlrs);
						$('#kssj').val(data.dlsjq);
						$('#jssj').val(data.dlsjz);
						$('#bdlr').val(data.bdlr);
						$('#roleid').val(data.roleid);
						$('#szsj').val(data.szsj);
						 var count=$("#moduleid option").length;

						  for(var i=0;i<count;i++)  
							 {  
							 if($("#moduleid").get(0).options[i].value == data.moduleid)  
								{  
									$("#moduleid").get(0).options[i].selected = true;  
								  
									break;  
								}  
							}
					   
					 
					}
                });
  
		
   }

function saveGndl() {
	var contextPath = $('#contextPath').val();
	var id=$('#id').val();
	var dlr=$('#dlr').val();
	var kssj=$('#kssj').val();
	var jssj=$('#jssj').val();
	var moduleid=$('#moduleid').val();
	var roleid=$('#roleid').val();
	var szsj=$('#szsj').val();
	if(dlr==""){
	   $.messager.alert('系统提示', '代理人不能为空','warning'); 
	}else if(kssj==""){
	    $.messager.alert('系统提示', '代理开始时间不能为空','warning'); 
	}else if(jssj==""){
	    $.messager.alert('系统提示', '代理结束时间不能为空','warning'); 
	}else if(moduleid==""){
	    $.messager.alert('系统提示', '请选择要代理的功能','warning'); 
	}else{
		
		  $.ajax({   
                   url : contextPath+'/gndl/existGndl.do',  
					data:{"id":id,"stime":kssj,"etime":jssj,"moduleid":moduleid},
                    type : 'POST',
					dataType : 'json',
				    error : function() {
							$.messager.alert('系统提示', '出现错误输入','warning');
						},
                   success : function(data) {
			             var contextPath=$('#contextPath').val();
						if(data!=null){
						  
						   $.messager.alert('系统提示', data[0]+"至"+data[1]+'时间段里面已经有设置过代理，请检查！','warning'); 
						}else{
						       save(id,dlr,kssj,jssj,moduleid,roleid,szsj);
						}
					}
						 
                });
	}
}

function  save(id,dlr,kssj,jssj,moduleid,roleid,szsj){
	
		var contextPath = $('#contextPath').val();
		$.ajax( {
			url : contextPath + '/gndl/updateGndl.do',
			data : {
				"gndl.id" : id,
				"gndl.dlr" : dlr,
				"gndl.dlsjz" : jssj,
				"gndl.dlsjq" : kssj,
				"gndl.moduleid" : moduleid,
				"gndl.roleid" :roleid,
				"gndl.szsj" :szsj
			},
			type : 'POST',
			dataType : 'json',
			error : function() {
				$.messager.alert('系统提示', '出现错误输入','warning');
			},
			success : function(data) {
				   $('#tt2').datagrid('reload');
				   
					
				   add();
				}
			});
    }
function openSearch() {
	$('#search').window( {
		title : '查询',
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
function openS(){
    $('#search').window('open'); 
}
 function search(){
	     var smoduleid = $('#smoduleid').val();
		  var qstime = $('#qstime').val();
		  var qetime = $('#qetime').val();
		  var zstime = $('#zstime').val();
		  var zetime = $('#zetime').val();
		$('#tt2').datagrid({
			queryParams: {
				"search.moduleid": smoduleid,"qstime":qstime,"qetime":qetime,"zstime":zstime,"zetime":zetime
			}
		});
		 $('#search').window('close'); 
		displayMsg(); 
		
	}
function add(){
      $('#dlr').val("");
				   $('#dlrs').val("");
				   $('#id').val("");
				   $('#kssj').val("");
				   $('#jssj').val("");
					$('#moduleid').val("");
}


