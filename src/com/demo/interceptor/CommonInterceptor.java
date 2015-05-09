package com.demo.interceptor;

import com.jfinal.aop.InterceptorStack;

public class CommonInterceptor extends InterceptorStack {

	@Override
	public void config() {
		addInterceptors(new SecurityInteceptor());
	}

}
