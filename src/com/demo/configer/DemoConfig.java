package com.demo.configer;

import model.Area;
import model.Code;
import model.Role;
import model.User;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.demo.controller.LoginController;
import com.demo.controller.UserController;
import com.demo.interceptor.CommonInterceptor;
import com.demo.interceptor.SecurityInteceptor;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.spring.IocInterceptor;
import com.jfinal.plugin.spring.SpringPlugin;
import com.jfinal.render.ViewType;

public class DemoConfig extends JFinalConfig{
	
	/**
	 * ���ø��ֳ���
	 */
	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
	}
	/**
	 * Handler �ӹ�web��������
	 */
	@Override
	public void configHandler(Handlers me) {
		//handler session
//		me.add(new SessionHandler());
	}
	/**
	 * ����������
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		//me.add(globalInterceptor)//�˴����õ���Global
		//login interceptor
		me.add(new SecurityInteceptor());
		me.add(new IocInterceptor());
//		me.add(new CommonInterceptor());
	}

	@Override
	public void configPlugin(Plugins me) {
		
		C3p0Plugin cp = new C3p0Plugin("jdbc:sqlserver://localhost;DatabaseName=yzmzsg",
                "sa", "123456");
        // ����Oracle��
        cp.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        
        me.add(cp);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
        me.add(arp);
        // ����Oracle����
        arp.setDialect( new AnsiSqlDialect());
        // ����������(�ֶ���)��Сд��������������
        arp.setContainerFactory(new CaseInsensitiveContainerFactory());
        //add Model Mapping
//        arp.addMapping("zyhdgl", "id", Zyhdgl.class);
        arp.addMapping("xtsz_code", "id", Code.class);
        arp.addMapping("xtsz_usertable","username", User.class);
        arp.addMapping("area", "code",Area.class);
        arp.addMapping("xtsz_function", model.Function.class);
        arp.addMapping("xtsz_role","roleid", Role.class);
        //add spring plugin new ClassPathXmlApplicationContext("path")
        me.add(new SpringPlugin("classpath:beans.xml"));
		
	}
	/**���÷���·��
	 * 
	 */
	@Override
	public void configRoute(Routes me) {
	     me.add("/login", LoginController.class);
	     me.add("/user",UserController.class);
	     //����Զ���·��(�ʺϷֹ�����������ͬʱ�޸�JfinalConfig��İ汾��ͻ)
//	     me.add(new FrontRout());
	}
	
	
}
