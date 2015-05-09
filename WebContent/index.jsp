<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%String contextPath=request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>类似谷歌图片的图片展示代码-懒人建站</title>
<meta name="keywords" content="网页特效,网页模板,导航菜单,焦点幻灯片,JS代码" />
<meta name="description" content="懒人建站为您提供-HTML+CSS模板，JS广告代码，网页特效，导航菜单，焦点幻灯片代码，原创视频教程与网页模板和CSS技巧。" />

<base target="_blank" />
</head>
<link href="style/ykb.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/common.css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/jquery-1.2.6.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/ivy.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/autoPalyer.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/pricev2_1.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/test_codefans.net.js" type="text/javascript"></script>
<body >
  <div class="imgLib">
    <div class="imgShow">
		  <div id="_playpic" class="playNav">
			  <i class="title" id="alt"></i>
			  <i class="playButtom">
				<a href="javascript://" target="_self" class="play" title="播放" id="butPlay"></a>
				<span id="playStatus">点击自动播放</span>
				<a href="javascript://" target="_self" style="display:none" class="stop" title="停止" id="butStop"></a>
				<a href="javascript://" target="_self" style="display:none" class="pause" title="暂停" id="butPause"></a>
				<span id="speedGroup" class="spead" style="display:none">
					<a href="javascript://" target="_self" speed="3">快</a>┊<a href="javascript://" target="_self" speed="5">中</a>┊<a href="javascript://" target="_self" speed="8">慢</a>
				</span>
			</i>
			  <i class="jump">
				<a href="javascript://" class="pre" id="topPrev" target="_self" title="上一张"></a>
				<a href="javascript://" class="next" id="topNext" target="_self" title="下一张"></a>
				<span id="showPage">0</span>/<span id="showTotal">0</span>
			  </i>
		 </div>
		 
		  <div class="singlepic" id="_singlepic">
			<div class="prePic">
				<a href="javascript://" id="butPrev" target="_self" title="上一张"></a>
			</div>
			<div class="bigPic">
				<img id="screen" src="img/zp25.jpg" />
			</div>
			<div class="nextPic">
				<a href="javascript://" id="butNext" target="_self" title="下一张"></a>
			</div>
		</div>
		<div class="pageJump">键盘<i>← →</i>或<i>PageUp PageDown</i>键可查看
			
					<a id="butPrevLink" target="_self" href="#">上一页</a>
				
			
					<a id="butNextLink" target="_self" href="#">下一页</a>
				
		</div>
		<i class="to_left">
			<a id="butPrevGroup" href="javascript://" target="_self" title="上五张图片"></a>
		</i>
		<ul id="nav" class="silderpic">         
		</ul>		
		<i class="to_right">
			<a id="butNextGroup" href="javascript://" target="_self" title="下五张图片"></a>
		</i>  
	  </div>
      
  </div>  
  <div><a href="javascript:getpicture()">获取图片</a></div>
<script>var productId=349691; var brandId=35929; </script>
<span id="span_count" class="spanclass"></span>
<script type="text/javascript">
var autoPalyer = new AutoPlayer({
	"baseUrl":"http://product.pconline.com.cn/pdlib/",
	"tag":"",
	"screenId":"screen",
	"altId":"alt",
	"defaultAlt":"111111111111111111111111111111",
	"navId":"nav",
	"butPlayId":"butPlay",
	"butPauseId":"butPause",
	"butStopId":"butStop",
	"playStatusId":"playStatus",
	"butPrevId":"butPrev,topPrev",
	"butNextId":"butNext,topNext",
	"butPrevGroupId":"butPrevGroup",
	"butNextGroupId":"butNextGroup",
	"butPrevLinkId":"butPrevLink",
	"butNextLinkId":"butNextLink",
	"butExamineId":"butExamine",
	"pvCounterId":"span_count",
	"butSpeedGroupId":"speedGroup",
	"showTotalId":"showTotal",
	"showPageId":"showPage",
	"showSourceId":"showSource",
	"showSourceCompositeId":"showSourceComposite",
	"data":picsJson["pics"],
	"curId":3,
	"picFilter":"",
	"curUrl":""
});

function getpicture(){
	var name=autoPalyer.getName();
	alert(name);
}

</script>






























<!--下面只是说明与程序代码无关-->
<div style="width:95%; height:auto; display:block; margin:0 auto; margin-top:30px; font-size:10pt; line-height:150%;">
<span>本代码由<a href="http://www.51xuediannao.com" style="color:#F00;">懒人建站网 收集整理 我要学电脑.COM →51xuediannao.com</a> </span><br>
<a href="http://www.51xuediannao.com">懒人建站 http://www.51xuediannao.com</a><br /><br/>
<span>我们为您提供-
<a href="http://www.51xuediannao.com/html+css/">HTML+CSS模板</a>，
<a href="http://www.51xuediannao.com/js/">JS代码</a>，
<a href="http://www.51xuediannao.com/JS/texiao/">网页特效</a>，
<a href="http://www.51xuediannao.com/JS/nav/">导航菜单</a>，
<a href="http://www.51xuediannao.com/JS/Slide/">焦点幻灯片<a>，
<a href="http://www.51xuediannao.com/JS/show/">网页欣赏</a>和
<a href="http://www.51xuediannao.com/JS/jiqiao/css/">CSS技巧</a>；</span><br />
<span>懒人建站只收录实用和能提高用户体验的代码</span><br />
<span>我们只想解放出你的部分写代码时间来思考更高层次的设计，而不是要你懒惰、拼凑。</span>

















<center>
<script type='text/javascript'> 
cpro_client='lanrennet2010_cpr';
cpro_at='text'; 
cpro_161=4; 
cpro_flush=4; 
cpro_w=960; 
cpro_h=90; 
cpro_template='text_default_960_90'; 
cpro_cbd='#86AC5F'; 
cpro_cbg='#242E37'; 
cpro_ctitle='#6CA7C7'; 
cpro_cdesc='#cfe0ee'; 
cpro_curl='#008000'; 
cpro_cflush='#ff7b0e'; 
cpro_uap=1;
cpro_cad=1;
</script>
<script language='JavaScript' type='text/javascript' src='http://cpro.baidu.com/cpro/ui/cp.js'></script>
</center>

<div id="tj" style="display:none;"><script src="http://s9.cnzz.com/stat.php?id=1015985&web_id=1015985" language="JavaScript" charset="utf-8"></script></div>
</div>
</body>
</html>


