
 //创建ul
function initUL(txtId) {
	var divObj = document.createElement("div");
	divObj.id = txtId+"div";  
	divObj.style.display="none";
	divObj.style.position = "absolute";  
	divObj.innerHTML = "<ul id='"+txtId+"tree' class='ztree' style='margin-top: 0; width: 200px; height: 200px;'></ul>";
	var first = document.body.lastChild; //得到第一个元素
	var opendiv=document.getElementById('jDialogContainer');
	if(opendiv)
	   opendiv.appendChild(divObj);
	else{
	   document.body.insertBefore(divObj, first);
	}
}
 //初始化树
function initTree(txtId, hidId, json, selectId,fun) {
	initUL(txtId);
	
	var menusetting = {view:{dblClickExpand:false}, data:{simpleData:{enable:true}}, callback:{onClick:function (treeId, treeNode) {
		var treeObj = $.fn.zTree.getZTreeObj(treeNode);
		
		var selectedNode = treeObj.getSelectedNodes()[0];
	  
	 	$("#" + hidId).val(selectedNode.id);
		$("#" + txtId).val(selectedNode.name);
		 
		$("#"+txtId+"div").fadeOut("fast");
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

 //初始化树
function initTree2(txtId, hidId, json, selectId,fun) {
	var menusetting = {view:{dblClickExpand:false}, data:{simpleData:{enable:true}}, callback:{onClick:function (treeId, treeNode) {
		var treeObj = $.fn.zTree.getZTreeObj(treeNode);
		alert(treeNode);
		var selectedNode = treeObj.getSelectedNodes()[0];
	  
	 	$("#" + hidId).val(selectedNode.id);
		$("#" + txtId).val(selectedNode.name);
		 
		$("#"+txtId+"div").fadeOut("fast");
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
function showMenu(n) {
	inputid = n.id;
	var left=$("#" + inputid + "").offset().left;
	var top=$("#" + inputid + "").offset().top;
	var outerHeight=$("#" + inputid + "").outerHeight();
	var opendiv=document.getElementById('jDialogContainer');
	if(opendiv){
	    var divleft=$("#jDialogContainer").offset().left;
		var divtop=$("#jDialogContainer").offset().top;
		var divouterHeight=$("#jDialogContainer").outerHeight();
	 	left=left-divleft;
		top=top-divtop;	
		
		if (navigator.userAgent.indexOf('Firefox') >= 0){
    		left+=5;
    		top+=27;
		}
	}
   $("#"+inputid+"div").css({left:left + "px", top:top + outerHeight + "px"}).slideDown("fast");
	 
}

