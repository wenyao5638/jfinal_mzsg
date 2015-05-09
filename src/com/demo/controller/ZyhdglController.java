package com.demo.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import model.Zyhdgl;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

public class ZyhdglController extends Controller {
	    public void index() {
	        List<Zyhdgl> list = Zyhdgl.dao.find("" +
	        		"select a.id as id,hdbt,hdjxsj,b.name as hdlb,zycjry,hdnr from zyhdgl a left join xtsz_code b on a.hdlb = b.id");
	        setAttr("studentList", list);
	        renderJson();//json��Ⱦ
	        render("/index.html");
	        
	       /* renderJson("zyhdList",list);*/
//	        render("/index.html");
	    }
	    
	    public void add() {
	        render("/index2.html");
	    }
	    @Before(com.demo.validator.DleValidat.class)
	    public void delete() {
	        // ��ȡ������ΪstudentID��ֵ
	        // Student.dao.deleteById(getPara("studentID"));
	        // ��ȡurl�����е�һ��ֵ
	        Zyhdgl.dao.deleteById(getPara());
	        forwardAction("/index");
	    }

	    public void update() {
	    	System.out.println(getPara("student.hdbt"));
	    	System.out.println(getPara("student.hdnr"));
	    	System.out.println(getPara("student.id"));
	        Zyhdgl student = getModel(Zyhdgl.class);
	        
	        student
	        .set("ID",getPara("student.id"))
	        .set("HDBT", getPara("student.hdbt"))
	        .set("HDNR", getPara("student.hdnr"))
	        .update();
	       // Zyhdgl.dao.findById(getPara("student.id")).set("hdbt", getPara("student.hdbt")).set("hdnr", getPara("student.hdnr"));
	        student.update();
	        forwardAction("/hdgl");
	        
	    }

	    public void get() {
	    	Zyhdgl student = Zyhdgl.dao.findById(getPara());
	        setAttr("student", student);
	        render("/index2.html");
	    }

	    public void save() {
	    	Zyhdgl student = getModel(Zyhdgl.class);
	        forwardAction("/hdgl");
	    }


}
