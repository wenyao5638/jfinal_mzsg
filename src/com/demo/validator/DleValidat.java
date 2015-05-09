package com.demo.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class DleValidat extends Validator{

	@Override
	protected void handleError(Controller c) {
		System.out.println("Exception on:"+c.getClass().getSimpleName());
	}

	@Override
	protected void validate(Controller c) {
		System.out.println("validate on:"+c.getClass().getSimpleName());
//		throw new RuntimeException();
	}
	
}
