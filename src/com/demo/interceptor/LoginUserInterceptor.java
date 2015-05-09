package com.demo.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class LoginUserInterceptor implements Interceptor{

	@Override
	public void intercept(ActionInvocation ai) {
	    ai.invoke();
	}

}
