
 //创建ul
function initUL(txtId,type) {
	var divObj = document.createElement("div");
	divObj.id = txtId+"div";  
	divObj.style.display="none";
	divObj.style.position = "absolute";  
	divObj.innerHTML = "<ul id='"+txtId+"tree' class='ztree' style='margin-top: 0; width: 200px; height: 200px;'></ul>";
	var first = document.body.lastChild; //得到第一个元素
	var opendiv=document.getElementById('jDialogContainer');
	if(type=='win'){
	    opendiv.appendChild(divObj);
	}
	else{
	    document.body.appendChild(divObj)
 	}
	
}
 //初始化树
function initTree(txtId, hidId, json, selectId, type,fun) {
	initUL(txtId,type);
	var menusetting = {view:{dblClickExpand:false}, data:{simpleData:{enable:true}}, callback:{onClick:function (treeId, treeNode) {
		var treeObj = $.fn.zTree.getZTreeObj(treeNode);
		var selectedNode = treeObj.getSelectedNodes()[0];
	 	$("#" + hidId).val(selectedNode.id);
		$("#" + txtId).val(selectedNode.name);
		 
		$("#"+txtId+"div").fadeOut("fast");
		if(treeNode=='roletree'){
			
		  showrole();
		}
		if(fun){
		  fun(selectedNode.id);
		}
		
		
	}}};
	$.fn.zTree.init($("#"+txtId+"tree"), menusetting, json);
	if (selectId != ""&&selectId != "0") {
		var zTree = $.fn.zTree.getZTreeObj(""+txtId+"tree");
		node = zTree.getNodeByParam("id", selectId, null);
		zTree.selectNode(node);
	 	$("#" + hidId).val(node.id);
		$("#" + txtId).val(node.name);
	}
	$("body").bind("mousedown", function(event){
	   if(event.target.id.indexOf(txtId)<0 ){
	     $("#"+txtId+"div").fadeOut("fast");
	   }
	  });
	 
}

//显示树div
function showMenu(n,type) {
	inputid = n.id;
	 
	var left=$("#" + inputid + "").offset().left;
	var top=$("#" + inputid + "").offset().top;
	var outerHeight=$("#" + inputid + "").outerHeight();
	var opendiv=document.getElementById('jDialogContainer');
	if(type=='win'){
		var c=$("#jDialogContainer");
		$("#"+inputid+"div").css({left:(left-c.offset().left) + "px", top:(top + outerHeight-c.offset().top) + "px"}).slideDown("fast");
	    
	}else{
	    $("#"+inputid+"div").css({left:left + "px", top:top + outerHeight + "px"}).slideDown("fast");
	}
 
	 
}

