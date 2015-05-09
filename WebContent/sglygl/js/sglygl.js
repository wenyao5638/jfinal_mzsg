
$(document).ready(function(){
	   
   var isvisible = '<s:property value="#request.flag"/>';
   if(isvisible == "view" || isvisible == "sb"){
   	$("input").attr("disabled",true);
   	$("select").attr("disabled",true);
   	$("textarea").attr("disabled",true);
   	$("a").attr("disabled",true);
   }
   $.validator.addMethod("valueNotEquals", function(value, element, arg){return arg != value;}, "请选择一项！");
   $.validator.addMethod("isIdCardNo", function (value, element) {
       return this.optional(element) || IdentityCodeValid(value);
   }, "请输入正确的身份证号码");
   
   $("#ajxx").validate({
		rules: {
			'vo.xm':{
				required : true
			},
			'vo.xb':{
				valueNotEquals: "-1"
			},
			'vo.mz':{
				valueNotEquals: "0"
			},
			'vo.zjlx':{
				valueNotEquals: "0"
			},
			'vo.csny':{
				required : true
			},
			'vo.whcd':{
				valueNotEquals: "0"
			},
			'vo.zzmm':{
				valueNotEquals: "0"
			},
			'vo.hyzk':{
				valueNotEquals: "0"
			},
			'vo.ryly':{
				valueNotEquals: "0"
			},
			'vo.hkxx':{
				valueNotEquals: "0"
			},
			'vo.hyzk':{
				valueNotEquals: "0"
			},
			'vo.ldhtqdqk':{
				valueNotEquals: "0"
			},
			'vo.zgzs':{
				valueNotEquals: "0"
			},
			
			
			'vo.zjhm':{
				required : true,
				isIdCardNo : true 
			},
			'vo.jsqsj':{
				required : true
			},
			'menu1':{
				required : true
			},'vo.cjgzsj':{
				required : true
			},'vo.zw':{
				required : true
			}
		
		},
		highlight: function(element, errorClass) {
	        $(element).removeClass(errorClass);
	    }
	  });
	   
	}); 
	
	function tjbd(zt){
	
		   $("input[type='checkbox']").attr("disabled",false);
		   $("#zt").val(zt);
		   if(zt=='01'){
		    $("#ztm").val("sb");
		   }else if(zt=='03'){
		    $("#ztm").val("sh");
		   }
		   var form = document.forms['ajxx'];
		   $(form).form("submit", {onSubmit:function () {
		    var valResult=$(form).validate().form();
		    if (!valResult) {
//				$("#token").val(false);
		    	$.messager.alert('系统提示', '请完善录入信息','warning'); 
			}else{
					    $.messager.progress(); 
					}	
			return valResult;
		}, success:function (result) {
	         parent.reshT("社工录用申请");
			var res = eval("(" + result + ")");
		  
			if (res.success) {
			  
				showMessage("\u63d0\u793a\u4fe1\u606f", "\u64cd\u4f5c\u6210\u529f");
				
				window.parent.closeTab(fname);
			} else {
//				$("#token").val(true);
			      $.messager.progress('close'); 
				showMessage("\u63d0\u793a\u4fe1\u606f", "<font color='red'>" + res.msg + "</font>");
			}
		}
		});
	
	}
	
	function getGzje(){
		
		var choseidex1 = $('#zydjdj option:selected') .val();//职务等级
		var choseidex2 = $('#gwdj option:selected') .val();//岗位等级
		var choseidex3 = $('#dqjtdj option:selected') .val();//地区津贴等级
		var choseidex4 = $('#zyzgjtdj option:selected') .val();//职业资格津贴等级
		if(choseidex1 != "0"){
			//设置隐藏工资selected选项
			$("#zydjgz2").find("option[value="+choseidex1+"]").attr("selected",true);
			$("#gwgz2").find("option[value="+choseidex1+"]").attr("selected",true);
			$("#dqjt2").find("option[value="+choseidex1+"]").attr("selected",true);
			$("#zyzgjt2").find("option[value="+choseidex1+"]").attr("selected",true);
			
			
			$("#zydjdj").find("option[value="+choseidex1+"]").attr("selected",true);
			$("#gwdj").find("option[value="+choseidex1+"]").attr("selected",true);
			$("#dqjtdj").find("option[value="+choseidex1+"]").attr("selected",true);
			$("#zyzgjtdj").find("option[value="+choseidex1+"]").attr("selected",true);
			
			
			$("#zydjgz").val($("#zydjgz2").find("option:selected").text());
			$("#gwgz").val($("#gwgz2").find("option:selected").text());
			$("#dqjt").val($("#dqjt2").find("option:selected").text());
			$("#zyzgjt").val($("#zyzgjt2").find("option:selected").text());
			
		}else{
			$("#zydjgz2").find("option[value="+choseidex1+"]").attr("selected",true);
			$("#gwgz2").find("option[value="+choseidex2+"]").attr("selected",true);
			$("#dqjt2").find("option[value="+choseidex3+"]").attr("selected",true);
			$("#zyzgjt2").find("option[value="+choseidex4+"]").attr("selected",true);
			
			
			$("#zydjgz").val($("#zydjgz2").find("option:selected").text());
			$("#gwgz").val($("#gwgz2").find("option:selected").text());
			$("#dqjt").val($("#dqjt2").find("option:selected").text());
			$("#zyzgjt").val($("#zyzgjt2").find("option:selected").text());
		}
	}
	function getGzje2(){
		
		var choseidex1 = $('#zydjdj option:selected') .val();//职务等级
		var choseidex2 = $('#gwdj option:selected') .val();//岗位等级
		var choseidex3 = $('#dqjtdj option:selected') .val();//地区津贴等级
		var choseidex4 = $('#zyzgjtdj option:selected') .val();//职业资格津贴等级
		
		$("#zydjgz2").find("option[value="+choseidex1+"]").attr("selected",true);
		$("#gwgz2").find("option[value="+choseidex2+"]").attr("selected",true);
		$("#dqjt2").find("option[value="+choseidex3+"]").attr("selected",true);
		$("#zyzgjt2").find("option[value="+choseidex4+"]").attr("selected",true);
		
		
		$("#zydjgz").val($("#zydjgz2").find("option:selected").text());
		$("#gwgz").val($("#gwgz2").find("option:selected").text());
		$("#dqjt").val($("#dqjt2").find("option:selected").text());
		$("#zyzgjt").val($("#zyzgjt2").find("option:selected").text());
	}
	
	function IdentityCodeValid(code) { 
            var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
            var tip = "";
            var pass= true;
            
            if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
                tip = "身份证号格式错误";
                pass = false;
            }
            
           else if(!city[code.substr(0,2)]){
                tip = "地址编码错误";
                pass = false;
            }
            else{
                //18位身份证需要验证最后一位校验位
                if(code.length == 18){
                    code = code.split('');
                    //∑(ai×Wi)(mod 11)
                    //加权因子
                    var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                    //校验位
                    var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                    var sum = 0;
                    var ai = 0;
                    var wi = 0;
                    for (var i = 0; i < 17; i++)
                    {
                        ai = code[i];
                        wi = factor[i];
                        sum += ai * wi;
                    }
                    var last = parity[sum % 11];
                    if(parity[sum % 11] != code[17]){
                        tip = "校验位错误";
                        pass =false;
                    }
                }
            }
//            if(!pass) alert(tip);
            return pass;
        }
function gzdd(lb){
 var dj="";
 var name="";
 var je="";
  if(lb=='01'){
     name="zydjdj";
     je="zydjgz";
	 dj=$("#"+name).val();
	  $("#gwdj").val(dj);
	  $("#dqjtdj").val(dj);
	   $("#zyzgjtdj").val(dj);
  }else if(lb=='02'){
     name="gwdj";
    je="gwgz";
		dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	  //$("#xdqjtdj").val(dj);
	  // $("#xzyzgjtdj").val(dj);
  }else if(lb=='03'){
     name="dqjtdj";
     je="dqjt";
	 dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	 // $("#xgwdj").val(dj);
	 //  $("#xzyzgjtdj").val(dj);
  }else if(lb=='04'){
     name="zyzgjtdj";
     je="zyzgjt";
	  dj=$("#"+name).val();
	 // $("#xzwdj").val(dj);
	 // $("#xgwdj").val(dj);
	  // $("#xdqjtdj").val(dj);
  }
 sz("01",$("#zydjdj").val(),"zydjgz");
 sz("02",$("#gwdj").val(),"gwgz");
 sz("03",$("#dqjtdj").val(),"dqjt");
 sz("04",$("#zyzgjtdj").val(),"zyzgjt");
 

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