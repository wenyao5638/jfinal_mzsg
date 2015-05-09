// JavaScript Document
$(function(){
	 $('#dg').datagrid({
		 url:'/mzsg/sq/sq_list.do',
		 sortName:'clsj',
		 sortOrder:'desc',
		 width:'99%',
		
		 	singleSelect : false,
		        frozenColumns:[[ 
                                        {field:'test',checkbox:true}
  					
                                        ,
					
						{ field:'action',
						  title:'操作'
						  
						  
						  ,width:'100'
						  ,align:'center'
						  
						  
						  ,formatter:function(value,row,index){return operate(value,row,index) ;}
						  
							}
					,
					
                                        
					
						{ field:'jd',
						  title:'街道'
						  ,sortable:'true'
						  
						  ,width:'60'
						  ,align:'left'
						  
						  
							}
					,
					
                                        
					
						{ field:'sq',
						  title:'所属社区'
						  ,sortable:'true'
						  
						  ,width:'60'
						  ,align:'left'
						  
						  
							}
					,
					
                                        
					
						{ field:'sqmc',
						  title:'小区名称'
						  ,sortable:'true'
						  
						  ,width:'140'
						  ,align:'left'
						  
						  
							}
					
					
					
		            ]] ,
		    
		 
		 
		 pagination:true,
		 rowStyler: function(index,row){
		               
	 		},
		 height:'380',
		 collapsible:false,
		 
		 
		 	nowrap : true,
		 
	  	 striped: true,
		 rownumbers:true,
		 iconCls:"icon-save",
		 fitColumns:false,
		 
		  
		   toolbar:[
		    
				
                                 
		                  {
					text:'添加',
					iconCls:'icon-add'
					
					
					,handler:function(){
					    url='/mzsg/sq/sq_open.do?bz=edit';
					    var win='add';
					    var arg='';
					    var title='社区信息表';
                                            if(arg==null) arg="";
					    window.parent.addTab(title,url,"","");
					   
					}
					
				}
			  	
			  
			  
			      
                  
 
			   
				],
	     
		 columns:[[
					
					
                                        
						{ field:'id',
						  title:'id'
						  ,sortable:'true'
						  
						  
						  
						  ,hidden:'true'
						  
                                                  
							}
					,
					
					
                                        
						{ field:'clsj',
						  title:'成立时间'
						  ,sortable:'true'
						  
						  ,width:'100'
						  ,align:'left'
						  
						  
                                                  
							}
					,
					
					
                                        
						{ field:'dzd',
						  title:'地址东'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzd"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzn',
						  title:'地址南'
						  ,sortable:'true'
						  
						  ,width:'120'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzn"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzx',
						  title:'地址西'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzx"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzb',
						  title:'地址北'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzb"; return styleChange(value,row,index,name) ;}
						  

							}
					,
					
					
                                        
						{ field:'qymj',
						  title:'区域面积'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="qymj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'jzmj',
						  title:'建筑面积'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="jzmj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'zhs',
						  title:'总户数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="zhs"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'xrzhs',
						  title:'现入住户数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="xrzhs"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'zrks',
						  title:'总人口数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="zrks"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'czrks',
						  title:'常住人口数'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="czrks"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'fwzxwz',
						  title:'服务中心位置'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="fwzxwz"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'fwzxmj',
						  title:'服务中心面积'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="fwzxmj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'sqlx',
						  title:'社区类型'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="sqlx"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'bz',
						  title:'备注'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
							}
					
					
		            ]] 
		    
	 });
	 var page = $('#dg').datagrid('getPager');
	 if (page){
		$(page).pagination({
			pageSize:10
		});
	}
});
