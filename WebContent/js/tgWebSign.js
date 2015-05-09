var SERVER_HOST = "10.35.206.142";
var SERVER_PORT = 80;
var QRCODE_URL = "http://10.35.206.142:80/qrcode/enQrCode";

var ocxWebSign;
ocxWebSign = document.getElementById("tgWebSign");
OnInit();

function OnInit(){
	if(ocxWebSign == null || ocxWebSign == undefined){
		alert("页面中没有网页签章控件，请联系管理员！");
		return;
	}
	ocxWebSign.serverHost = SERVER_HOST;
	ocxWebSign.port = SERVER_PORT;
}

function GetByIssuer(Issuer)
{
	//alert(Issuer)
	var s=ocxWebSign.GetSerialNumberByIssuer(Issuer);
	//alert(s)

}
function OnSign(parentDiv, signTxt, lx, ly){
	var ocxWebSign=document.getElementById("tgWebSign");
	var signId = ocxWebSign.iSign(signTxt);
	OnLoad(parentDiv, signId, lx, ly);
	OnLoad(parentDiv, signId, ly, lx);

	return signId;
} 

function OnSignByType(parentDiv, signTxt, lx, ly){
	var issuerTxt = "ZJCA";
	GetByIssuer(issuerTxt);
	ocxWebSign.SetSelectCertMode("1");
	var signId2 = ocxWebSign.iSignByType(signTxt,"3");//个人签章
	if(signId2=="" || signId2==null){
	  return "";
	}else{
		ocxWebSign.SetSelectCertMode("0");
	  var signId1 = ocxWebSign.iSignByType(signTxt,"1");//公章签章
		 if(signId1=="" || signId1==null){
		   return "";
		 }else{
		  OnLoad(parentDiv, signId1, lx, ly);
		//OnLoad(parentDiv, signId2, lx, ly);
		  return signId2+":"+signId1;
		 }
	}
}
function OnSignSilenceByType(parentDiv, signTxt){
	var issuerTxt = "ZJCA";
	GetByIssuer(issuerTxt);
	ocxWebSign.SetSelectCertMode("1");
	var signId2 = ocxWebSign.iSignByType(signTxt,"3");
	if(signId2=="" || signId2==null){
	  return "";
	}else{
	  ocxWebSign.SetSelectCertMode("0");
	  var signId1 = ocxWebSign.iSignByType(signTxt,"1");
	 if(signId1=="" || signId1==null){
		   return "";
	  }else{
	   return signId2+":"+signId1;
	 }
	}
}
function OnSignSilenceByTypeGz(parentDiv,signTxt){
	var issuerTxt = "ZJCA";
	GetByIssuer(issuerTxt);
	ocxWebSign.SetSelectCertMode("1");
    var signId1 = ocxWebSign.iSignByType(signTxt,"1");
	 if(signId1=="" || signId1==null){
		   return "";
	  }else{
	   return signId1;
	 }
}

function OnSignSilenceByTypeGr(parentDiv,signTxt){
	var issuerTxt = "ZJCA";
	GetByIssuer(issuerTxt);
	ocxWebSign.SetSelectCertMode("1");
    var signId1 = ocxWebSign.iSignByType(signTxt,"3");
	 if(signId1=="" || signId1==null){
		   return "";
	  }else{
	   return signId1;
	 }
}


function OnAutoSign(parentDiv, signTxt, lx, ly){
	var signId = 0;
	signId = ocxWebSign.iAutoSealSign(signTxt);
	OnLoad(parentDiv, signId, lx, ly);
	return signId;
}

function OnBackSign(parentDiv, signTxt, lx, ly){
	var signId = OnBackSignSilence(parentDiv, signTxt);
	//signId = ocxWebSign.iBackSign(signTxt);
	OnLoad(parentDiv, signId, lx, ly);
	return signId;
} 

function OnBackSignSilence(parentDiv, signTxt){
	var signId = 0;
	signId = ocxWebSign.iBackSign(signTxt);
	return signId;
}

function OnLoad(parentDiv, signId, lx, ly){
	if(signId > 0){
		var sealImgSrc = "http://" + SERVER_HOST + ":" + SERVER_PORT + "/tseal/rest/sign-rest!getSealImgById?signId=" + signId;
		if("IMG" == parentDiv.tagName || "img" == parentDiv.tagName || "TABLE" == parentDiv.tagName || "table" == parentDiv.tagName){
			var sealWidth = ocxWebSign.iGetSealWidth(signId);
			var sealHeight = ocxWebSign.iGetSealHeight(signId);
			//alert("sealWidth"+sealWidth);
			var sealImg = new Image();
			sealImg.id = "seal_img_" + signId;
			sealImg.src = sealImgSrc;
			sealImg.className = "tg_seal_img";
			sealImg.style.left = lx;
			sealImg.style.top = ly;
			sealImg.width = sealWidth;
			sealImg.height = sealHeight;
			document.body.appendChild(sealImg);
		}else{
			parentDiv.style.cssText = "background: url(" + sealImgSrc + ") " + lx + "px " + ly + "px no-repeat;";
		}
	}
}

function OnVerify(parentDiv, signId, verifyTxt, isDelete){
	var vResult = ocxWebSign.iVerify(signId, verifyTxt);
	if(vResult > 0)
		return true;
	if(isDelete)
		OnDelete(parentDiv, signId);
	return false;
}

function OnDelete(parentDiv, signId){
	if(signId > 0){
		if("IMG" == parentDiv.tagName || "img" == parentDiv.tagName){
			var signImgId = "seal_img_" + signId;
			var signImg = document.getElementById(signImgId);
			if(null != signImg && undefined != signImg)
				document.body.removeChild(signImg);
		}else{
			parentDiv.style.background = "none";
		}
	}
}

function OnViewUserCert(signId){
	if(signId > 0)
		ocxWebSign.iViewUserCert(signId);
}

function OnViewSignCert(signId){
	if(signId > 0)
		ocxWebSign.iViewSignCert(signId);
}

function OnShowQrcode(signId, lx, ly){
	if(signId > 0){
		var content = "http://" + SERVER_HOST + ":" + SERVER_PORT + "/tseal/rest/sign-rest!getSignedInfo?signId=" + signId;
		var qrcodeImgSrc = QRCODE_URL + "?content=" + content;
		var qrcodeImg = new Image();
		
		qrcodeImg.id = "qrcode_img_" + signId;
		qrcodeImg.src = qrcodeImgSrc;
		qrcodeImg.className = "tg_qrcode_img";
		qrcodeImg.style.left = lx;
		qrcodeImg.style.top = ly;	
		
		document.body.appendChild(qrcodeImg);	
	}
}