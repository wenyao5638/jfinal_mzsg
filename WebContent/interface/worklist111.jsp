<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<%String contextPath=request.getContextPath(); %>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>再生育审批管理平台</title>
        
<!-- The stylesheet -->
<link href="<%=contextPath%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/css/ziti.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
        
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function selectSearch(swlx,lx,zsysp_base_swxh){
	$.ajax( {
			url :   '<%=contextPath%>/zsysp/zsysp_base_select.do',
			data : {
				"lx"   : lx,
				"zsysp_base_swxh" : zsysp_base_swxh
			},
			type : 'POST',
			dataType : 'json',  
			async: false,
			error : function() {
				$.messager.alert('提示', '系统出现错误，请稍后重试或者联系管理员!');
			},
			success : function(data) {
				if(data==""){
					$.messager.alert('系统提示', '您的角色暂时没有权限查看!','warning');
					return;
				}else{
					if(data=="0"){
						if(lx=="zsysp"){
							swlx="名单查询-再";
						}else if(lx="tssysp"){
							swlx="名单查询-特";
						}
					}
					var swxh = data;
					parent.addTab(swlx,"<%=contextPath%>/zsysp/zsysp_base.do?lx="+lx+"&swxh="+swxh+"&zsysp_base_swxh="+zsysp_base_swxh);
				}
			}
		});
} 
    </script>
    </head>
    
    <body onLoad="MM_preloadImages('<%=contextPath%>/images/zs1.png','<%=contextPath%>/images/zs2.png','<%=contextPath%>/images/zs3.png','<%=contextPath%>/images/ts1.png','<%=contextPath%>/images/ts2.png','<%=contextPath%>/images/ts3.png')">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="500" valign="top"><table width="80%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25">&nbsp;</td>
          </tr>
        </table>
          <table width="88%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="content"> <s:property value='%{#session.user.usercnname}'/>,欢迎您登录海曙区再生育审批管理平台！</td>
            </tr>
          </table>
          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" colspan="4" align="center" valign="bottom" class="copyname">再生育审批情况</td>
            </tr>
            <tr>
              <td width="25%" height="168"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('社区核实-再','zsysp','2')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8-1','','<%=contextPath%>/images/zs1.png',1)" id="z_sqhs_1"><img src="<%=contextPath%>/images/zs1-1.png" alt="" name="Image8" width="124" height="127" border="0" id="Image8-1" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('社区核实-再','zsysp','2')" id="z_sqhs_2"><font size="2">社区待核实<s:property value='%{#request.worklist.z_sqhs}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="25%" height="168"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('申请公示-再','zsysp','3')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8-2','','<%=contextPath%>/images/zs1.png',1)" id="z_sqgs_1"><img src="<%=contextPath%>/images/zs1-1.png" alt="" name="Image8" width="124" height="127" border="0" id="Image8-2" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('申请公示-再','zsysp','3')" id="z_sqgs_2"><font size="2">待申请公示<s:property value='%{#request.worklist.z_sqgs}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="25%"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('承办人审核-再','zsysp','4')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','<%=contextPath%>/images/zs2.png',1)" id="z_cbrsh_1"><img src="<%=contextPath%>/images/zs2-2.png" alt="" name="Image1" width="124" height="127" border="0" id="Image1" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('承办人审核-再','zsysp','4')" id="z_cbrsh_2"><font size="2">承办人待审核<s:property value='%{#request.worklist.z_cbrsh}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="25%"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('负责人审核-再','zsysp','5')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','<%=contextPath%>/images/zs3.png',1)" id="z_fzrsh_1"><img src="<%=contextPath%>/images/zs3-3.png" alt="" name="Image21" width="124" height="127" border="0" id="Image21" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('负责人审核-再','zsysp','5')" id="z_fzrsh_2"><font size="2">负责人待批准<s:property value='%{#request.worklist.z_fzrsh}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table>
          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" colspan="4" align="center" valign="bottom" class="copyname">特殊生育审批情况</td>
            </tr>
            <tr>
              <td width="25%" height="167"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('社区核实-特','tssysp','2')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image22-1','','<%=contextPath%>/images/ts1.png',1)" id="ts_sqhs_1"><img src="<%=contextPath%>/images/ts1-1.png" alt="" name="Image22" width="124" height="127" border="0" id="Image22-1" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('社区核实-特','tssysp','2')" id="ts_sqhs_2"><font size="2">社区待核实<s:property value='%{#request.worklist.ts_sqhs}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="25%" height="167"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('申请公示-特','tssysp','3')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image22-2','','<%=contextPath%>/images/ts1.png',1)" id="ts_sqgs_1"><img src="<%=contextPath%>/images/ts1-1.png" alt="" name="Image22" width="124" height="127" border="0" id="Image22-2" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('申请公示-特','tssysp','3')" id="ts_sqgs_2"><font size="2">待申请公示<s:property value='%{#request.worklist.ts_sqgs}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="25%"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('承办人审核-特','tssysp','4')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','<%=contextPath%>/images/ts2.png',1)" id="ts_cbrsh_1"><img src="<%=contextPath%>/images/ts2-2.png" alt="" name="Image31" width="124" height="127" border="0" id="Image31" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('承办人审核-特','tssysp','4')" id="ts_cbrsh_2"><font size="2">承办人待审核<s:property value='%{#request.worklist.ts_cbrsh}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="25%"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><a href="javascript:selectSearch('负责人审核-特','tssysp','5')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','<%=contextPath%>/images/ts3.png',1)" id="ts_fzrsh_1"><img src="<%=contextPath%>/images/ts3-3.png" alt="" name="Image41" width="124" height="127" border="0" id="Image41" /></a></td>
                </tr>
                <tr>
                  <td align="center" background=""><table width="117" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="41" align="center" background="<%=contextPath%>/images/xinxbg.gif" class="copyname2"><a href="javascript:selectSearch('负责人审核-特','tssysp','5')" id="ts_fzrsh_2"><font size="2">负责人待批准<s:property value='%{#request.worklist.ts_fzrsh}'/>人</font></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
      </tr>
    </table>
    </body>
</html>