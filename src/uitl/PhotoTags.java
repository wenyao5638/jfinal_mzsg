package uitl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

@SuppressWarnings("serial")
public class PhotoTags extends TagSupport  {
 
	/**
	 * 业务ID
	 */
	private String id;
	/**
	 * 业务表
	 */
//	private String ywb;
	/**
	 * 是否可以修改
	 */
    private boolean edit=true;
    /**
     * 按钮是否可以点击
     */
    private boolean enable=false;
   
	public int doEndTag() throws JspException {
		  try {
		   JspWriter out = pageContext.getOut();
		   if(id==null||id.isEmpty())
			  out.write("<font color='red'>业务ID不能为空，请传入业务ID</font>");
			  String html=addButton();
			  html+=addList();
		      out.write(html);
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
    	   html+="<input type='button' value='+' class='PhotoTag' onclick='openPhoto(\""+id+"\")'" ;
           if(enable)
        	 html+=" disabled='"+enable+"' " ;
             html+=" />";
       }
    	 
       return html;
    }
    /**
     * 查询出照片(显示图片)LIST并返回拼接的HTML
     * @return
     */
    private String addList(){
    	String html="";
        html+="<div id='"+id+"'>";
   		html+="<script> refreshDate('"+id+"',"+edit+");  </script>";
        html+="</div>";
    	return html;
    }

    public void setEdit(boolean edit) {
		this.edit = edit;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	 
	

}
