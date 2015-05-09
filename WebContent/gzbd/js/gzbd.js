

function closeWin(name){
	//alert(name);
  window.parent.closeTab(name);
 }
 function saveGzbd(zt) {
	   
	/**
	 * 防止重复提交校验
	 */
	  var flag = $("#token").val();
	 // alert(flag);
	if (flag == false || flag == "false") {
		$.messager.alert("\u63d0\u793a\u4fe1\u606f", "\u8bf7\u52ff\u91cd\u590d\u63d0\u4ea4\uff01", "error");
		return;
	}

	$("#zt").val(zt);
	
	
 
			 $("#gzbd").form("submit", {onSubmit:function () {
				   var valResult=$("#gzbd").validate().form();
					if (!valResult) {
   					//	$("#token").val(false);
		    			$.messager.alert('\u63d0\u793a\u4fe1\u606f', '\u8bf7\u5b8c\u5584\u5f55\u5165\u4fe1\u606f','warning'); 
			        }else{
					    $.messager.progress(); 
					}	
					
					return valResult;
				}, success:function (result) {
					
					 parent.reshT($("#name").val());
				//alert(result);
				
					var res = eval("(" + result + ")");
					 
					if (res.success) {
					     //parent.reshT("社工工资变动申请");
						showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
					   //window.parent.addTab("社工工资变动申请","${ctx}/gzbd/gzbd.do","","");
					 //  parent.reshg();
					fname="工资变动申请表";
					   window.parent.closeTab(fname);
					} else {
						$("#token").val(true);
						  $.messager.progress('close'); 
						showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
					}
				}
				});
	  

} 

 
  $(function(){
	  <!--$.fn.zTree.init($("#menutree3"), menusetting, zNodesmenu1);
					<!--  var zTree = $.fn.zTree.getZTreeObj("menutree3");	
					<!--if("<s:property value='vo.pid'/>"!=""){			 
						<!--node = zTree.getNodeByParam("id","<s:property value='vo.pid'/>",null);
						<!--zTree.selectNode(node);
					
						<!--$("#menu3").attr("value", node.name);
						<!--$("#code3").attr("value", node.id);
					<!--}-->
	 });   
	

function gzdd(lb){
 var dj="";
 var name="";
 var je="";
  if(lb=='01'){
     name="xzydj";
     je="xzydjgz";
	 dj=$("#"+name).val();
	  $("#xgwdj").val(dj);
	  $("#xdqjtdj").val(dj);
	   $("#xzyzgjtdj").val(dj);
  }else if(lb=='02'){
     name="xgwdj";
    je="xgwgz";
		dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	  //$("#xdqjtdj").val(dj);
	  // $("#xzyzgjtdj").val(dj);
  }else if(lb=='03'){
     name="xdqjtdj";
     je="xdqjt";
	 dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	 // $("#xgwdj").val(dj);
	 //  $("#xzyzgjtdj").val(dj);
  }else if(lb=='04'){
     name="xzyzgjtdj";
     je="xzyzgjt";
	  dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	 // $("#xgwdj").val(dj);
	  // $("#xdqjtdj").val(dj);
  }
 sz("01",$("#xzydj").val(),"xzydjgz");
 sz("02",$("#xgwdj").val(),"xgwgz");
 sz("03",$("#xdqjtdj").val(),"xdqjt");
 sz("04",$("#xzyzgjtdj").val(),"xzyzgjt");
 

}
function sz(lb,dj,je){
	var path=$("#path").val();
  $.ajax({
	     	type:'POST',
		 	url: path+"/djgz/findDjgz.do",
			data:{"lb":lb,"dj":dj},
		 	error: function(){
		       		$("#info").val("服务器繁忙，请稍后重试...");
     		},
     		success: function(data){
			  if(data!=null){
				 $("#"+je+"").val(data.je); 
			  }
			 
		    }
		 });
 
}

 function dialog2(){
  var path=$("#path").val();
  doAjaxOpen("dg",path+"/sgry/sgry_dialog.do?bd=1","", "m="+m,800,400,"jDialogContainer");
 }
 function data(data){
  $("#xm").val(data.xm);
  $("#xb").val(data.xb);
  $("#zw").val(data.zw);
  $("#csny").val(data.csny);
  $("#cjgzsj").val(data.cjgzsj);
  $("#jsqsj").val(data.jsqsj);
   $("#yzwdj").val(data.zygzdj);
  $("#ygwdj").val(data.gwdj);
  $("#ydqjtdj").val(data.dqjtdj);
  $("#yzyzgjtdj").val(data.zyzgjtdj);
   $("#yzwdj2").val(data.zygzdj2);
  $("#ygwdj2").val(data.gwdj2);
  $("#ydqjtdj2").val(data.dqjtdj2);
  $("#yzyzgjtdj2").val(data.zyzgjtdj2);
  $("#yzwdjgz").val(data.zydjgz);
  $("#ygwgz").val(data.gwgz);  
  $("#ydqjt").val(data.dqjt);
   $("#yzyzgjt").val(data.zyzgjt); 
   $("#yzwgzdjrq").val(data.zxqssj); 
   $("#ygwgzrq").val(data.zxqssj); 
   $("#ydqjtrq").val(data.zxqssj); 
   $("#yzyzgjtrq").val(data.zxqssj); 
    $("#ryid").val(data.id); 
	 $("#xzydj").val(data.zygzdj2);
	$("#sssq").val(data.szsq);

  $("#xgwdj").val(data.gwdj2);
  $("#xdqjtdj").val(data.dqjtdj2);
  $("#xzyzgjtdj").val(data.zyzgjtdj2);
  $("#xzydjgz").val(data.zydjgz);
  $("#xgwgz").val(data.gwgz);  
  $("#xdqjt").val(data.dqjt);
   $("#xzyzgjt").val(data.zyzgjt); 
	
 }
 function changeRq(){
    var xzygzdjrq=$("#xzygzdjrq").val();
	$("#xgwgzrq").val(xzygzdjrq);
	$("#xdqjtrq").val(xzygzdjrq);
	$("#xzyzgjtrq").val(xzygzdjrq);
 }
