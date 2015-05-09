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

function DisplayLiucheng(id,count) {
    var i = 1;
    
    for (i = 1; i <= count; i++) {
        if (i == id) {
            document.getElementById("Liucheng" + id).className = "info_source";
            document.getElementById("List" + id).className = "current";
        }
        else {
            document.getElementById("Liucheng" + i).className = "info_source_hidden";
            document.getElementById("List" + i).className = "";
        }
    }
}

function DisplayLogin() {
    document.getElementById("login").src = "images/login_1.png";
}
function HiddenLogin() {
    document.getElementById("login").src = "images/login.png";
}
function DisplayMail() {
    document.getElementById("login_mail").style.backgroundImage = "url(images/mail_1.png)";
}
function HiddenMail() {
    document.getElementById("login_mail").style.backgroundImage = "url(images/mail.png)";
}
function DisplayPassword() {
    document.getElementById("login_password").style.backgroundImage = "url(images/password_1.png)";
}
function HiddenPassword() {
    document.getElementById("login_password").style.backgroundImage = "url(images/password.png)";
}