<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%String contextPath=request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>类似谷歌图片的图片展示代码-懒人建站</title>
<meta name="keywords" content="网页特效,网页模板,导航菜单,焦点幻灯片,JS代码" />
<meta name="description" content="懒人建站为您提供-HTML+CSS模板，JS广告代码，网页特效，导航菜单，焦点幻灯片代码，原创视频教程与网页模板和CSS技巧。" />

<base target="_blank" />
</head>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/clqdcssjs/style/ykb.css"/>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/jquery-1.2.6.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/ivy.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/autoPalyer.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextPath%>/clqdcssjs/js/pricev2_1.js" type="text/javascript"></script>
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
  
  <div><a onClick="javascript:getpicture()">获取图片</a></div>
<script>var productId=349691; var brandId=35929; </script>
<span id="span_count" class="spanclass"></span>
<script type="text/javascript">

var picsJson={"pics":[{"thumbPicUrl":"<%=contextPath%>/clqdcssjs/img/zp01.jpg","id":"0","name":"01.jpg","middlePicUrl":"<%=contextPath%>/clqdcssjs/img/zp25.jpg"},
						{"thumbPicUrl":"<%=contextPath%>/clqdcssjs/img/zp25s.jpg","id":"1","name":"02.jpg","middlePicUrl":"<%=contextPath%>/clqdcssjs/img/zp25s.jpg"},
	                    {"thumbPicUrl":"<%=contextPath%>/clqdcssjs/img/zp01.jpg","id":"2","name":"03.jpg","middlePicUrl":"<%=contextPath%>/clqdcssjs/img/zp01.jpg"},
	                    {"thumbPicUrl":"<%=contextPath%>/clqdcssjs/img/zp02.jpg","id":"3","name":"04.jpg","middlePicUrl":"<%=contextPath%>/clqdcssjs/img/zp02.jpg"},
	                    {"thumbPicUrl":"<%=contextPath%>/clqdcssjs/img/zp24s.jpg","id":"4","name":"05.jpg","middlePicUrl":"<%=contextPath%>/clqdcssjs/img/zp24s.jpg"}]};
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
</body>
</html>