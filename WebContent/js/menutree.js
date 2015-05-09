/*
menu1,menuContent1,code1(��ѯ)
menu2,menuContent2,code2(�������޸�)
*/

var inputid = "";

function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(treeId),
	nodes = zTree.getCheckedNodes(true),
	v = "";
	s = "";
	for (var i=0, l=nodes.length; i<l; i++) {
//�˴��ж�ֻ���ڽ�ɫ������û��޸Ľ�ɫ�����õ�
		if(nodes[i].id.indexOf("a")!=-1){
			$.messager.alert('��ʾ', '�ýڵ㲻���ڽ�ɫ!'); 
			return;
		}
		v += nodes[i].name;
		s += nodes[i].id;
	}
	var cityObj = $("#"+inputid+"");
	cityObj.attr("value", v);
	if(inputid=="menu1"){
		$('#code1').val(s);
	}else if(inputid=="menu2"){
		$('#code2').val(s);
	}else if(inputid=="menu3"){
		$('#code3').val(s);
	}else if(inputid=="menu4"){
		$('#code4').val(s);
	}else if(inputid=="menu5"){
		$('#code5').val(s);
	}
	
	hideMenu();
}

function showMenu(n) {
		alert("kk")

	inputid = n.id;
	var cityObj = $("#"+inputid+"");
	var cityOffset = $("#"+inputid+"").offset();
	if(inputid=="menu1"){
		$("#menuContent1").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	}else if(inputid=="menu2"){
		//������������Ҫ�����жϵ�����Ĵ�С
		var c=$("#add");
		$("#menuContent2").css({left:(cityOffset.left-c.offset().left+5) + "px", top:(cityOffset.top + cityObj.outerHeight()-c.offset().top+27) + "px"}).slideDown("fast");
	}else if(inputid=="menu3"){
		var c=$("#add");
		//$("#menuContent3").css({left:(cityOffset.left-cityObj.left+5) + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		$("#menuContent3").css({left:(cityOffset.left-c.offset().left+5) + "px", top:(cityOffset.top + cityObj.outerHeight()-c.offset().top+27) + "px"}).slideDown("fast");
		
	}else if(inputid=="menu4"){
		//������������Ҫ�����жϵ�����Ĵ�С
		//$("#menuContent4").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		var c=$("#add");
		$("#menuContent4").css({left:(cityOffset.left-c.offset().left+5) + "px", top:(cityOffset.top + cityObj.outerHeight()-c.offset().top+27) + "px"}).slideDown("fast");
	}else if(inputid=="menu5"){
		//������������Ҫ�����жϵ�����Ĵ�С
		$("#menuContent5").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		//var c=$("#add");
		//$("#menuContent4").css({left:(cityOffset.left-c.offset().left+5) + "px", top:(cityOffset.top + cityObj.outerHeight()-c.offset().top+27) + "px"}).slideDown("fast");
	}
	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent1").fadeOut("fast");
	$("#menuContent2").fadeOut("fast");
	$("#menuContent3").fadeOut("fast");
	$("#menuContent4").fadeOut("fast");
	$("#menuContent5").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menu1" || event.target.id == "menuContent1" || $(event.target).parents("#menuContent1").length>0||event.target.id == "menu2" || event.target.id == "menuContent2" || $(event.target).parents("#menuContent2").length>0
		||event.target.id == "menu3" || event.target.id == "menuContent3" || $(event.target).parents("#menuContent3").length>0||event.target.id == "menu4" || event.target.id == "menuContent4" || $(event.target).parents("#menuContent4").length>0
		||event.target.id == "menu5" || event.target.id == "menuContent5" || $(event.target).parents("#menuContent5").length>0)) {
		hideMenu();
	}
}