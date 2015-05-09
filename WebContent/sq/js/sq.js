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
						  title:'����'
						  
						  
						  ,width:'100'
						  ,align:'center'
						  
						  
						  ,formatter:function(value,row,index){return operate(value,row,index) ;}
						  
							}
					,
					
                                        
					
						{ field:'jd',
						  title:'�ֵ�'
						  ,sortable:'true'
						  
						  ,width:'60'
						  ,align:'left'
						  
						  
							}
					,
					
                                        
					
						{ field:'sq',
						  title:'��������'
						  ,sortable:'true'
						  
						  ,width:'60'
						  ,align:'left'
						  
						  
							}
					,
					
                                        
					
						{ field:'sqmc',
						  title:'С������'
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
					text:'���',
					iconCls:'icon-add'
					
					
					,handler:function(){
					    url='/mzsg/sq/sq_open.do?bz=edit';
					    var win='add';
					    var arg='';
					    var title='������Ϣ��';
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
						  title:'����ʱ��'
						  ,sortable:'true'
						  
						  ,width:'100'
						  ,align:'left'
						  
						  
                                                  
							}
					,
					
					
                                        
						{ field:'dzd',
						  title:'��ַ��'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzd"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzn',
						  title:'��ַ��'
						  ,sortable:'true'
						  
						  ,width:'120'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzn"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzx',
						  title:'��ַ��'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzx"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'dzb',
						  title:'��ַ��'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="dzb"; return styleChange(value,row,index,name) ;}
						  

							}
					,
					
					
                                        
						{ field:'qymj',
						  title:'�������'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="qymj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'jzmj',
						  title:'�������'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="jzmj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'zhs',
						  title:'�ܻ���'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="zhs"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'xrzhs',
						  title:'����ס����'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="xrzhs"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'zrks',
						  title:'���˿���'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="zrks"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'czrks',
						  title:'��ס�˿���'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="czrks"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'fwzxwz',
						  title:'��������λ��'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="fwzxwz"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'fwzxmj',
						  title:'�����������'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="fwzxmj"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'sqlx',
						  title:'��������'
						  ,sortable:'true'
						  
						  ,width:'80'
						  ,align:'left'
						  
						  
                                                  
						  ,styler:function(value,row,index){var name="sqlx"; return styleChange(value,row,index,name) ;}
						  
							}
					,
					
					
                                        
						{ field:'bz',
						  title:'��ע'
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
