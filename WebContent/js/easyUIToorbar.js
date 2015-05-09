//动态增加删除按钮
$.extend($.fn.datagrid.methods, { 
				     addToolbarItem: function(jq, items){ 
				        return jq.each(function(){ 
				            var toolbar = $(this).parent().prev("div.datagrid-toolbar");
				             for(var i = 0;i<items.length;i++){
				                var item = items[i];
				                if(item === "-"){
				                     toolbar.append('<div class="datagrid-btn-separator"></div>');
				               }else{
				                    var btn=$("<a href=\"javascript:void(0)\"></a>");
				                    btn[0].onclick=eval(item.handler||function(){});
				                    btn.css("float","left").appendTo(toolbar).linkbutton($.extend({},item,{plain:true}));
				                }
				             }
				             toolbar = null;
				         }); 
				     },
				 	    removeToolbarItem: function(jq, param){ 
				 	        return jq.each(function(){ 
				             var btns = $(this).parent().prev("div.datagrid-toolbar").children("a");
				             var cbtn = null;
				             if(typeof param == "number"){
				                 cbtn = btns.eq(param);
				           }else if(typeof param == "string"){
				                 var text = null;
				                 btns.each(function(){
				                     text = $(this).data().linkbutton.options.text;
				                    if(text == param){
				                        cbtn = $(this);
				                        text = null;
				                         return;
				                    }
				                });
				            }
				            if(cbtn){
				                 var prev = cbtn.prev()[0];
				                 var next = cbtn.next()[0];
				                if(prev && next && prev.nodeName == "DIV" && prev.nodeName == next.nodeName){
				                     $(prev).remove();
				                }else if(next && next.nodeName == "DIV"){
				                    $(next).remove();
				                 }else if(prev && prev.nodeName == "DIV"){
				                     $(prev).remove();
				                }
				                 cbtn.remove(); 
				                 cbtn= null;
				             }                      
				         }); 
				     }              
				 	});