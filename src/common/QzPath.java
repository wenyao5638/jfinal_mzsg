package common;

import java.util.Properties;

public class QzPath {
   public String getPath(){
	   String qzpath="";
	   try{
	   Properties props = new Properties();
		props.load(this.getClass().getResourceAsStream("/ftp.properties"));
//		port = Integer.valueOf(props.getProperty("port"));
		qzpath = props.getProperty("qzpath");
	   }catch(Exception e){
		   e.printStackTrace();
	   }finally{
		   return qzpath;
	   }
   }
   public String getQzSize(){
	   String qzpath="";
	   try{
	   Properties props = new Properties();
		props.load(this.getClass().getResourceAsStream("/ftp.properties"));
//		port = Integer.valueOf(props.getProperty("port"));
		qzpath = props.getProperty("qzsize");
	   }catch(Exception e){
		   e.printStackTrace();
	   }finally{
		   return qzpath;
	   }
   }
   public String getQzGrSize(){
	   String qzpath="";
	   try{
	   Properties props = new Properties();
		props.load(this.getClass().getResourceAsStream("/ftp.properties"));
//		port = Integer.valueOf(props.getProperty("port"));
		qzpath = props.getProperty("qzgrsize");
	   }catch(Exception e){
		   e.printStackTrace();
	   }finally{
		   return qzpath;
	   }
   }
}
