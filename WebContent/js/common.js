// JavaScript Document
$(function(){
	 $("a[id^='submenu']").each(function(){		   
	     $(this).mouseover(function(){			
			$("div[id='" + $(this).attr("chgId")  + "']").show();
	 	});
	    $(this).mouseout(function(){
			$("div[id='" + $(this).attr("chgId")  + "']").hide();
	 	}); 
	 });
		$(".submenu").mouseover(function(){
			$(this).show();
			$("a[chgId='" + $(this).attr("id")  + "']").addClass("memustyle2");	
	 	});
	   $(".submenu").mouseout(function(){
			$(this).hide();
			$("a[chgId='" + $(this).attr("id")  + "']").removeClass("memustyle2");	
	 	}); 
		   
	   $(".subsubmenu_01").click(function(){
		var menu = $(this).attr("class");
		if( menu == 's1memustyle1')
		  { $("div[id='" + $(this).attr("chgId")  + "']").show();
			$(this).removeClass().addClass("s1memustyle2");	
		 }
		 else
		 { $(this).removeClass().addClass("s1memustyle1");
		   $("div[id='" + $(this).attr("chgId")  + "']").hide();}		   
		  
	 });
	 
	 $(".subsubmenu_001").click(function(){
		var menu = $(this).attr("class");
		if( menu == 's2memustyle1')
		  { $("div[id='" + $(this).attr("chgId")  + "']").show();
			$(this).removeClass().addClass("s2memustyle2");	
		 }
		 else
		 { $(this).removeClass().addClass("s2memustyle1");
		   $("div[id='" + $(this).attr("chgId")  + "']").hide();}
	 });
	    
});