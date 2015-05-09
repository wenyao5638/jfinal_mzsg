//var title_m=0;
//var  titleflag=false;
var arrayObj = new Array(); 
$(function(){
	InitLeftMenu();
	tabClose();
	tabCloseEven();


});

//初始化左侧
function InitLeftMenu() {
	//$("#nav").accordion({animate:true});
    /*var contextPath=$("#contextPath").val();
	$('#tree li a').click(function(){
		var tabTitle = $(this).children('.nav').text();

		var url =$(this).attr("rel");
		//alert(url);
		var menuid = $(this).attr("ref");
		//alert(menuid);
		var icon = "icon icon-sys";
        if(url!="#"){
			url= contextPath+"/"+url;
	       addTab(tabTitle,url,icon,menuid);
		}
		//$('nav li div').removeClass("selected");
		//$(this).parent().addClass("selected");
	}).hover(function(){
		//$(this).parent().addClass("hover");
	},function(){
		//$(this).parent().removeClass("hover");
	});

	//选中第一个
	//var panels = $('#nav').accordion('panels');
	//var t = panels[0].panel('options').title;
    //$('#nav').accordion('select', t);  */
}
//获取左侧导航的图标
function getIcon(menuid){
	var icon = 'icon ';
	$.each(_menus.menus, function(i, n) {
		 $.each(n.menus, function(j, o) {
		 	if(o.menuid==menuid){
				icon += o.icon;
			}
		 });
	});

	return icon;
}

function addTab(subtitle,url,icon,menuid){
	 if(url!="#"){
		 if(icon=='' || icon=="null"){
		   icon = "icon-nav";
		 }
		 icon="icon "+icon;
		if(!$('#tabs').tabs('exists',subtitle)){
			//alert("增加");
			//alert(subtitle);
			
			// if(subtitle=='文档上传'&&!titleflag){			 
			   // titleflag=true;
				//alert(title_m);
			/// }
			// if(!titleflag){
			  // title_m++;
			 //}
			 
			$('#tabs').tabs('add',{
				title:subtitle,
				content:createFrame(url,menuid),
				closable:true,
				icon:icon,
				id:subtitle
			});
		}else{
			closeTab(subtitle); 
			//$('#tabs').tabs('select',subtitle);
			//$('#mm-tabupdate').click();
			$('#tabs').tabs('add',{
				title:subtitle,
				content:createFrame(url,menuid),
				closable:true,
				icon:icon,
				id:subtitle
			});
		}
		// var arrayObj = new Array(); 
		 arrayObj=$('#tabs').tabs('tabs');
		
		//ff
		tabClose();
	 }
  
}

function getSubtitle(){
	var subtitle = "";
	var currTab = $('#tabs').tabs('getSelected');
	var tab = currTab.panel('options').tab;
	var subtitle = tab.text()
	return subtitle;
}

function reshT(subtitle){
	var contextPath=$("#contextPath").val();
	var currTab = $('#tabs').tabs('getTab', subtitle); 
	//alert(subtitle);
	var url = $(currTab.panel('options').content).attr('src');
	if(url==null|| url=="") url=contextPath+"/interface/first.jsp";
	if(url==null|| url=="") alert("标签链接丢失,请先关闭本标签页，重新打开!");
	$('#tabs').tabs('update',{
		tab:currTab,
		options:{
			content:createFrame(url)
		}
	});
}

function closeTab(subtitle){
	//alert(subtitle);
	//if(subtitle=='文档上传')titleflag=false;
	$('#tabs').tabs('close',subtitle);
}

function createFrame(url,menuid)
{

	var s = '<iframe scrolling="auto" id="'+menuid+'" name="'+menuid+'" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	
	return s;
}

function tabClose()
{
	
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		//alert("2:"+subtitle);
		//if(subtitle=='文档上传')titleflag=false;
		$('#tabs').tabs('close',subtitle);
	});
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();
		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}
//绑定右键菜单事件
function tabCloseEven()
{
	//刷新
	var contextPath=$("#contextPath").val();
	$('#mm-tabupdate').click(function(){
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url==null|| url=="") url=contextPath+"/interface/first.jsp";
		if(url==null|| url=="") alert("标签链接丢失,请先关闭本标签页，重新打开!");
		$('#tabs').tabs('update',{
			tab:currTab,
			options:{
				content:createFrame(url)
			}
		})
	})
	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		//alert("3:"+currtab_title);
		//if(currtab_title=='文档上传')titleflag=false;
		$('#tabs').tabs('close',currtab_title);
		//m--;
	})
	//全部关闭
	$('#mm-tabcloseall').click(function(){
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if(t!="欢迎使用" && t!=''){ 
			  // if(t=='文档上传')titleflag=false;
			  // alert("4:"+t);
			  $('#tabs').tabs('close',t);
			 // m--;
			}
		});
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		$('#mm-tabcloseright').click();
		$('#mm-tabcloseleft').click();
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			//alert("5:"+t);
			// if(t=='文档上传')titleflag=false;
			$('#tabs').tabs('close',t);
			//m--;
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			if(t!="欢迎使用"){
				//alert("6:"+t);
			 // if(t=='文档上传')titleflag=false;
			  $('#tabs').tabs('close',t);
			  //m--;
			}
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})
}

//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, msgString, msgType);
}
function reloadTabGrid(title) 
      {
             if ($("#tabs" ).tabs('exists', title)) {
                  $( '#tabs').tabs('select' , title);
                  window.top.reload_Abnormal_Monitor.call();
            }
      } 