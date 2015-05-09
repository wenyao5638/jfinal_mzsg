package uitl;

import java.io.IOException;
import java.util.Random;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;



@SuppressWarnings("serial")
public class PhotoTag extends TagSupport  {
	
	/**
	 * id主键
	 */
	private String id;
	/**
	 * 业务ID
	 */
	private String ywId;
	/**
	 * 业务表
	 */
	private String ywb;
	/**
	 * 是否可以修改
	 */
    private boolean edit=true;
    /**
     * 按钮是否可以点击
     */
    private boolean enable=false;
    /**
     * 是否显示图片
     */
    private boolean showimg=false;
    /**
     * 图片类别
     */
    private String lb;
    
   
	public int doEndTag() throws JspException {
		  try {
		   String html = "";
		   JspWriter out = pageContext.getOut();
		   if(ywId==null||ywId.isEmpty()){
			  
			   out.write("<font color='red'>业务ID不能为空，请传入业务ID</font>");
			   
		   }else{
			   html=addButton();
			   if(showimg){
				   html += addUrl();
			   }else{
				   html+=addList();
			   }
			   out.write(html);
		   }
		   
		  } catch (IOException ioe) {
		   throw new JspException(ioe);
		  }
		  return super.doEndTag();
		 }
	/**
     * 增加按钮拼接的HTML
     * @return
     */
    private String addButton(){
       String html="";
       if(edit){
    	   html+="<input type='button' value='+' class='PhotoTag' onclick='openPhoto(\""+ywId+"\",\""+ywb+"\",\""+showimg+"\",\""+lb+"\")'" ;
           if(enable)
        	 html+=" disabled='"+enable+"' " ;
             html+=" />";
       }
    	 
       return html;
    }
    /**
     * 查询出照片LIST并返回拼接的HTML
     * @return
     */
    private String addList(){
    	String html="";
        html+="<div id='"+lb+"'>";
   		html+="<script> refreshDate('"+ywId+"',"+edit+","+showimg+",'"+lb+"');  </script>";
        html+="</div>";
    	return html;
    }
    /**
     * 
     * @return
     */
    private String addUrl(){
    	System.out.println("addUrl lb:"+lb);
    	String html="";
        html+="<div id='"+lb+"'>";
   		html+="<script> refreshDateZp('"+ywId+"',"+edit+","+showimg+",'"+lb+"');  </script>";
        html+="</div>";
    	return html;
    }
    
	public void setYwId(String ywId) {
		this.ywId = ywId;
	}
    public void setEdit(boolean edit) {
		this.edit = edit;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public void setYwb(String ywb) {
		this.ywb = ywb;
	}
	public void setShowimg(boolean showimg) {
		this.showimg = showimg;
	}
	public String getLb() {
		return lb;
	}
	public void setLb(String lb) {
		this.lb = lb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	 

}
