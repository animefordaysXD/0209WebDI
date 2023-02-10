package com.ict.edu;

public class HelloImpl implements Hello {
	
	public HelloImpl() {
		System.out.println("hello Impl constructor");
	}
	@Override
	public String sayHello() {
		
		return "Hello Spring world";
	}

}
