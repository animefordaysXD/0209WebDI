package com.ict.ex02;

import org.springframework.stereotype.Component;

@Component
public class MyCalc2 {
	public int multi(int s1, int s2) {
		return s1 * s2;
	}
	public int div(int s1, int s2) {
		return s1/s2;
	}
}
