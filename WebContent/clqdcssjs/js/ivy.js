//Download by http://www.codefans.net
var _ivyIDs="";var _tmpIvyIDs="";var _cntUrl=window._cntUrl||"";var _state_=0;var _count_=1;var __lock__=0;var _ivySubmitPage="http://ivy.pconline.com.cn/adpuba/show2?channel=inline&id=";function _addIvyID(a){if(_tmpIvyIDs.indexOf(a+";")>-1){return}_tmpIvyIDs=_tmpIvyIDs+a+";";_ivyIDs=_ivyIDs+a+";"}function _delIvyID(a){if(a!=null&&a.length>0&&a.indexOf("_")>0){if(_tmpIvyIDs.indexOf(a+";")>-1){_tmpIvyIDs=_tmpIvyIDs.replace(a+";","")}if(_ivyIDs.indexOf(a+";")>-1){_ivyIDs=_ivyIDs.replace(a+";","")}}}function _submitIvyID_impl(){__lock__=1;if(_ivyIDs&&_ivyIDs!=""){var a=_ivyIDs;_ivyIDs="";try{var b=document.createElement("script");if(b){var c=document.getElementById("ivy_div");if(!c){c=document.createElement("div");c.id="ivy_div";c.style.display="none";document.body.insertBefore(c,document.body.firstChild)}if(!c){try{var b=new Image(1,1);b.src=_ivySubmitPage+a;b.onload=function(){_uVoid()}}catch(err0){_addIvyID(a)}}else{document.body.insertBefore(b,document.body.firstChild);var d=_ivySubmitPage+a+"&state="+_state_+"&submitcnt="+_count_;b.src=d}}}catch(err){try{var b=new Image(1,1);b.src=_ivySubmitPage+a;b.onload=function(){_uVoid()}}catch(err1){_addIvyID(a)}}}if(_cntUrl&&_cntUrl!=""){var e=new Image(1,1);e.src=_cntUrl;e.onload=function(){_uVoid()};_cntUrl=""}__lock__=0}function _uVoid(){return}function _ivyRandom(a){try{hi_now=new Date();hi_id=hi_now.getSeconds()%a;return hi_id}catch(err){return 0}}function _submitIvyID(){if(__lock__!=0){window.setTimeout(_submitIvyID,3000);return}_state_=0;_count_=1;_submitIvyID_impl()}function _submitIvyID2(){if(__lock__!=0){window.setTimeout(_submitIvyID2,3000);return}_state_=1;_count_=1;_submitIvyID_impl()}function _submitIvyID3(){if(__lock__!=0){window.setTimeout(_submitIvyID3,3000);return}_state_=0;_count_=2;_submitIvyID_impl()}window.onbeforeunload=_submitIvyID2;var userAgent=navigator.userAgent.toLowerCase();if(/msie/.test(userAgent)&&!/opera/.test(userAgent)){document.onreadystatechange=function(){if(document.readyState=="complete"){_submitIvyID3()}}}else if(/opera/.test(userAgent)||/mozilla/.test(userAgent)){document.addEventListener("DOMContentLoaded",_submitIvyID3,false)}function document_write(s){document.write(s)}function document_writeln(s){document.writeln(s)}var _IVY_AD_MAP_=new Array();function struct_IVY_AD_MAP(a,b){this.key=a;this.value=b}function setLocationAd(a,b){for(var i=0;i<this._IVY_AD_MAP_.length;i++){if(this._IVY_AD_MAP_[i].key===a){this._IVY_AD_MAP_[i].value=b;return}}this._IVY_AD_MAP_[this._IVY_AD_MAP_.length]=new struct_IVY_AD_MAP(a,b)}function getLocationAd(a,b){var c=new Array();var d=new Array();for(var i=0;i<this._IVY_AD_MAP_.length;i++){if(this._IVY_AD_MAP_[i].key===a){c=this._IVY_AD_MAP_[i].value;break}}if(c!=null&&c.length>0){var e=c[0].level;for(var i=0;i<c.length;i++){if(b!=null&&b>0){if(b>d.length){d[d.length]=c[i];_addIvyID(c[i].locationId+"_"+c[i].adId)}}else{if(e>c[i].level)break;d[d.length]=c[i];_addIvyID(c[i].locationId+"_"+c[i].adId);if(e<2)break}}}return d}var ivymap=new Object();function showIvyViaJs(a){var b=undefined;var c='ivymap[\"'+a+'\"]';try{b=eval(c);if(b!=undefined){b()}}catch(e){}}var ivyAdList=new Array();function IvyKeyword(a,b,c,d,e,f){this.key=a;this.content=b;this.href=c;this.ivyPara=d;this.showCount=e;this.tmpCount=0;this.linkCss=f}function showKeyWorkAd(a,b,c,d,e,f){ivyAdList[ivyAdList.length]=new IvyKeyword(a,b,c,d,e,f)}