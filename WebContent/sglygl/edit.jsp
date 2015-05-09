<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
//图片验证
 function fileyz(){  
       	var objs=$("input[type='file']");
		for(var i=0;i<objs.length;i++){
		   
		   var flag=LimitAttach(objs[i].value);
		   if(!flag){
		   
		     return false;
		    }
		}
	   $("input[type='checkbox']").attr("disabled",false);
	   return true;
	 }
//验证图片
var extArray = new Array(".jpg",".JPG",".gif",".GIF",".png",".PNG",".JPEG",".jpeg");
function LimitAttach(file){   
	var allowSubmit = true;   
	if (!file){  
	      $.messager.alert('系统提示', '图片不能为空','warning');   
          return false;   
	}  
	 
    while(file.indexOf("\\") != -1){     
         file = file.slice(file.indexOf("\\") + 1);  
    }  
    var ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {   
        if (extArray[i] == ext){     
           allowSubmit = true;     
            break;      
         }   
     }  
     if (allowSubmit){ 
         return true; 
      }else{    
          var msg="所有照片只能上传以下格式的文件:"+ (extArray.join("")) + "\n请重新选择再上传.";   
          $.messager.alert('系统提示', msg,'warning');    
          return false;   
       } 
     }
var rowCount = 1;
function addRow(){
	
	rowCount++;
	var newRow='<tr id="option'+rowCount+'" class="title"><td align="right"><font color="red">*</font>照片'+rowCount+':</td><td><s:file key="tp" /></td><td><a href="#" onclick=delRow('+rowCount+')>删除</a></td></tr>';  
    $('#img').append(newRow);  
}
function delRow(rowIndex){  
    $("#option"+rowIndex).remove();  
    rowCount--;  
}  
</script>
<form id="uploadImg" method="post" enctype="multipart/form-data"
	action="uploadImg_save.do">
    <s:hidden key="ywid"/>
    <s:hidden key="ywb"/>
    <s:hidden key="showimg"/>
    <s:hidden key="lb"/>
    <table id = "img" align="center" class="hovertable" border="0" cellpadding="0"
		cellspacing="0">
		<tr align="left"><a id="" class="l-btn" href="javascript:void(0)" onclick="addRow()"
			onclick=" "> <span
			class="l-btn-left"> <span
				style="padding-left: 0px;">增加</span> </span> </a>
		</tr>
		<tr class="title">
			<td colspan="2">
				照片上传
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="title2">
				<font color="red">*</font>照片1:
			</td>
	        <td colspan="2">
				<s:file key="tp"  />
			</td>
		</tr>
    </table>
    <div class="dialog-button">
		<a id="" class="l-btn" href="javascript:void(0)" onclick="if(fileyz()){saveZP(document.forms['uploadImg'])}"
			onclick=" "> <span
			class="l-btn-left"> <span class="icon-ok"
				style="padding-left: 20px;">保存</span> </span> </a>
		<a class="l-btn" href="javascript:void(0)"
			onclick="closeDialog('uploadImg');"> <span
			class="l-btn-left"> <span class="icon-cancel"
				style="padding-left: 20px;">取消</span> </span> </a>
	</div>
</form>

