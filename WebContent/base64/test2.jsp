<%@ page contentType="text/html; charset=GBK" %>
<html>
<head> 
<title>高拍仪上传</title>
<style type="text/css">
            .one 
            {
	            border-color: #ffa8a8;
	            background-color: #fff3f3;
	            color: #000;
            }
</style>
</head>
<% String contextPath = request.getContextPath();
   String filename = (String)request.getParameter("filename");%>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-ui.min.js"></script>
<script>
		    function start_preview(url)  
		    {   
			    ScanCtrl.StartPreview(); 
 		    }
		    function stop_preview(url)     
		    {   
			    ScanCtrl.StopPreview(); 
		    }
	        function TakePic(url)    
	        {		
		      //  var path = prompt("请输入图片保存路径","D:\\1.jpg");
		      //  if(path==null || path=="" || path=="undefined"){
		      //  	path="c:/1.jpg";
		      //  }
		        var val=document.getElementById("selJpeg").value;
		        ScanCtrl.SetJpegQuality(parseInt(val)); 
		        var imgstr = ScanCtrl.ScanBase64(0);
		        if (confirm("你确认要保存该照片吗？")) {
				$.ajax({   
		        	url : '<%= contextPath %>/saveFile.do',   
		            data : {   
		            	imgstr : imgstr,
		            	filename : '<%=filename%>'
		            },   
		            type : 'POST',   
		            error: function(){
		            	alert("保存失败！");
		     		}, 
		            success : function() {
		            	alert("保存成功！");
		            }   
	                });   
			    }
	        }
	        function Property(url) 
            {
	            ScanCtrl.Property();
	        }
	        function deloption()
	        {   
		        var obj=document.getElementById("sel").options; 
		        while (obj.length > 0)
		        {
			        obj.options.remove(obj.length - 1);   
		        }   
	        }
	        function addoption(s)   
	        {
		        var obj=document.getElementById("sel").options; 
		        var opt = new Option(s, obj.length ); 
		        obj.options.add(opt);   
	        }
	        function deloption1()
	        {   
		        var obj=document.getElementById("sel1").options; 
		        while (obj.length > 0)
		        {
			        obj.options.remove(obj.length - 1);   
		        }   
	        }
		    function deloption2()
	        {   
		        var obj=document.getElementById("sel2").options; 
		        while (obj.length > 0)
		        {
			        obj.options.remove(obj.length - 1);   
		        }   
	        }
	        function deloption3()
	        {   
		        var obj=document.getElementById("sel3").options; 
		        while (obj.length > 0)
		        {
			        obj.options.remove(obj.length - 1);   
		        }   
	        }
	        function deloption4()
	        {   
		        var obj=document.getElementById("sel4").options; 
		        while (obj.length > 0)
		        {
			        obj.options.remove(obj.length - 1);   
		        }   
	        }
	        function deloption5()
	        {   
		        var obj=document.getElementById("sel5").options; 
		        while (obj.length > 0)
		        {
			        obj.options.remove(obj.length - 1);   
		        }   
	        }
	        function addoption1(s)   
	        {
		        var   obj=document.getElementById("sel1").options; 
		        var   opt = new Option(s, obj.length ); 
		        obj.options.add(opt);   
	        }
	        function addoption2(s)   
	        {
		        var obj=document.getElementById("sel2").options; 
		        var opt = new Option(s, obj.length ); 
		        obj.options.add(opt);   
	        }
	        function addoption3(s)   
	        {
		        var obj=document.getElementById("sel3").options; 
		        var opt = new Option(s, obj.length ); 
		        obj.options.add(opt);   
	        }
	        function addoption4(s)   
	        {
		        var obj=document.getElementById("sel4").options; 
		        var opt = new Option(s, obj.length ); 
		        obj.options.add(opt);   
	        }	
	        function initoption5()   
	        {
		        var obj=document.getElementById("sel5").options; 
		        var count = ScanCtrl.GetDeviceCount();
		
		        for(var i = 0; i < count; i++)
		        {
			        var s = ScanCtrl.GetDevName(i);
			        var opt = new Option(s, obj.length ); 
			        obj.options.add(opt);   
		        }
	        }
	        function changeresolution()
	        {
		        var num= ScanCtrl.GetResolutionCount();
		        var obj=document.getElementById("sel").options; 
		        var x = obj.selectedIndex;    

		        if(x <= num)
		        {
			        ScanCtrl.SetResolution(x);          
		        }
		        else
			        window.alert("Out of Range"); 
	        }
	        function changedev()
	        {
		        var num= ScanCtrl.GetDeviceCount();
		        var obj=document.getElementById("sel5").options; 
		        var x = obj.selectedIndex;    

		        if(x <= num)
		        {
			        ScanCtrl.SetCurDev(x);   
			        //clearall();
			        deloption();
			        deloption1();
			        deloption2();
			        deloption3();
			        deloption4();
			        init(x);       
		        }
		        else
		        {
			        window.alert("Out of Range"); 
		        }
	        }
	        function contentLoad()
	        {
		        init(0);
		        initoption5();	
		        setJpegInit();
		        ScanCtrl.StartPreview();
	        }
	        function init(x)
	        {
		        var num = ScanCtrl.GetResolutionCount();
		        //var selindex;
		        //var width = ScanCtrl.GetResolutionWidth(x);
		        //var height = ScanCtrl.GetResolutionHeight(x);  

		        for(var i=0;i<num;i++)
		        {
			        var w=ScanCtrl.GetResolutionWidth(i);
			        var h=ScanCtrl.GetResolutionHeight(i);
			        var str=w.toString()+"x"+h.toString();
			        addoption(str);

		        }    

		        num = ScanCtrl.GetScanSizeCount();
		        if(num == 8)
		        {
			        addoption1("All");
			        addoption1("A3");
			        addoption1("A4");
			        addoption1("A5");
			        addoption1("A6");
			        addoption1("A7");
			        addoption1("名片");
			        addoption1("身份证");
			        addoption1("自定义");
		        }
		        else if(num == 7)
		        {
			        addoption1("All");
			        addoption1("A4");
			        addoption1("A5");
			        addoption1("A6");
			        addoption1("A7");
			        addoption1("名片");
			        addoption1("身份证");
			        addoption1("自定义");
		        }
		        else
		        {
			        addoption1("All");
			        addoption1("自定义");
		        }

		        addoption2("0°");
		        addoption2("90°");
		        addoption2("180°");
		        addoption2("270°");

		        addoption3("彩色");
		        addoption3("灰度");
		        addoption3("黑白");

		        for(i=1;i<256;i++)
			        addoption4(i);
	        }	
	        function clearall()
	        {
		        alert("clear all");
		        var obj=document.getElementById("sel").options; 
		        obj.lengths = 0;
		        obj=document.getElementById("sel1").options; 
		        obj.lengths = 0;
		        obj=document.getElementById("sel2").options; 
		        obj.lengths = 0;
		        obj=document.getElementById("sel3").options; 
		        obj.lengths = 0;
		        obj=document.getElementById("sel4").options; 
		        obj.lengths = 0;
		        obj=document.getElementById("sel5").options; 
		        obj.lengths = 0;
		        alert("clear all finished!");
	        }
	        function changescansize()
	        {
		        var   num=ScanCtrl.GetScanSizeCount();
		        var   obj=document.getElementById("sel1").options; 
		        var   x = obj.selectedIndex;    
		        if(x<=num)
		        {
			        ScanCtrl.SetScanSize(x);
		        }
		        else
			        window.alert("Out of  Range"); 
	        }     
	        function changerotate()
	        {
		        var   obj=document.getElementById("sel2").options; 
		        var   x = obj.selectedIndex;    

		        if(x<4)
		        {
			        ScanCtrl.SetVideoRotate(x);
		        }
		        else
			        window.alert("Out of  Range"); 
	        }	  
	        function changecolor()
	        {
		        var obj = document.getElementById("sel3").options; 
		        var x = obj.selectedIndex;    

		        if(x<3)
		        {
			        ScanCtrl.SetVideoColor(x);
		        }
		        else
			        window.alert("Out of  Range"); 
	        }   
	        function changethresvalue()
	        {
		        var   obj = document.getElementById("sel4").options; 
		        var   x = obj.selectedIndex + 1;    

		        if( x < 256 && x > 0 )
		        {
			        ScanCtrl.SetThresVal(x);
		        }else
                {
			        window.alert("Out of Range"); 
		        };		
	        }
	        function ZoomIn()
	        {
		        ScanCtrl.SetZoomIn();
	        }
	        function ZoomOut()
	        {
		        ScanCtrl.SetZoomOut();
	        }
	        function RotateCrop(obj)
	        {
		        ScanCtrl.SetRotateCrop2(obj.checked);
	        }
	        function RemoveBackColor(obj)
	        {
		        ScanCtrl.DelBackColor(obj.checked);
	        }  
	        function SetJpegQuality(obj){
	        	if(obj.value=="" || obj.value==null){
	        		obj.value=36;
	        	}
	        	ScanCtrl.SetJpegQuality(obj.value);
	        } 
	        function SetDPI(){
	        	var x=document.getElementById("x").value;
	        	var y=document.getElementById("y").value;
	        	if(x=="" || x==null){
	        		x=-1;
	        	}
	        	if(y=="" || y==null){
	        		y=-1;
	        	}
	        	ScanCtrl.SetDPI(x,y);
	        }
	        function setJpegInit(){
	         	var obj=document.getElementById("selJpeg").options; 
	        	for(var i=1;i<=100;i++){
	        		var opt = new Option(i, i); 
		        	obj.options.add(opt); 
	        	};
	        	//给select设置默认值
	        	//document.getElementById("selJpeg").selectedIndex=25;
	        	//document.getElementById("selJpeg").options[25].selected=true;
	        	document.getElementById("selJpeg").value=26;
	        }
	        function IDCardRecognize(){
	        	var isOk=ScanCtrl.IDCardRecognize();
	        	if(isOk){
	        		alert("姓名："+ScanCtrl.GetIDCardName()+";\r\n"+
	        		"性别："+ScanCtrl.GetIDCardSex()+";\r\n"+
	        		"民族："+ScanCtrl.GetIDCardNation()+";\r\n"+
	        		"出生日期："+ScanCtrl.GetIDCardBorn()+";\r\n"+
	        		"住址："+ScanCtrl.GetIDCardAddr()+";\r\n"+
	        		"二代证编号："+ScanCtrl.GetIDCardNo()+";\r\n"+
	        		"身份证签发机关的名称 ："+ScanCtrl.GetIDCardPolice()+";\r\n"+
	        		"二代证有效期："+ScanCtrl.GetIDCardActive()+";\r\n");
	        	};
	        }
        </script>

<body onload="contentLoad()">
	<div class="top">
		<div class="global-width">
			<!--<img src="images/logo.gif" class="logo" />-->
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<span class="usertype">【登录角色：管理员】</span>admin你好！欢迎良田影像管理系统！
		</div>
	</div>
	<div class="main">
		<div class="global-width">
			
			<div class="action">
				<div class="t">开始预览</div>
				<div class="pages">
					<div>
						<object classid="clsid:090457CB-DF21-41EB-84BB-39AAFC9E271A"
							id="ScanCtrl" codebase="<%=contextPath%>/*.cab#version=1,0,0,1" width="660"
							height="400"></object>
					</div>
					
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="addform-item">
							<tbody>
								<tr>
									<td><input class="submit_01" type="button" value="开始预览"
										onclick="start_preview()" /> <input class="submit_01"
										type="button" value="停止预览" onclick="stop_preview()" /> <input
										class="submit_01" type="button" value="拍照" onclick="TakePic()" />
										<input class="submit_01" type="button" value="属性"
										onclick="Property()" /> <input class="submit_01"
										type="button" value="放大" onclick="ZoomIn()" /> <input
										class="submit_01" type="button" value="缩小" onclick="ZoomOut()" />

									</td>
								</tr>
								<tr>
									<td>分辨率：<select id="sel" style="width: 90px" name="sel"
										onchange="changeresolution()"></select> 扫描尺寸：<select id="sel1"
										style="width: 90px" name="sel1" onchange="changescansize()"></select>
										旋转角度：&nbsp;&nbsp;<select id="sel2" style="width: 90px"
										name="sel2" onchange="changerotate()"></select> <input
										type="checkbox" value="" onclick="RotateCrop(this)" />去黑边</td>
								</tr>
								<tr>
									<td>颜&nbsp;&nbsp;色：<select id="sel3" style="width: 90px"
										name="sel3" onchange="changecolor()"></select> 设备列表：<select
										id="sel5" style="width: 90px" name="sel5"
										onchange="changedev()"></select> 二值化阈值：<select id="sel4"
										style="width: 90px" name="sel4" onchange="changethresvalue()"></select>
										<input type="checkbox" value=""
										onclick="RemoveBackColor(this)" />去底色</td>
								</tr>
							</tbody>
							<tfoot>
							<tr>
								<td>
								<input class="submit_01" type="button" value="启动二代证识别" onclick="IDCardRecognize()" />
								</td>
							</tr>
								<tr>
									<td>设置拍照图片的横纵DPI：<input style="width: 50px" type="text" id="x" value="-1" />
										<input style="width: 50px" type="text" id="y" value="-1" /> <input type="button"
										value="确定" class="submit_01" onclick="SetDPI()" /> 设置JPEG质量：<select id="selJpeg" style="width: 50px"
									 onchange="SetJpegQuality(this)">
										</select> 
									</td>
								</tr>
							</tfoot>
							
						</table>
			</div>
			</div>
			</div>
			</div>	

</body>        
</html>