<%@page import="com.ict.ex02.Age"%>
<%@page import="com.ict.ex02.MyCalc2"%>
<%@page import="com.ict.Ex01.MyCalc"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.ict.edu.HelloImpl"%>
<%@page import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
 	ApplicationContext context = 
 	new GenericXmlApplicationContext("com/ict/edu/config.xml");
	
	HelloImpl hello = (HelloImpl)context.getBean("hello");
	String msg = hello.sayHello();
	out.println("<h2>"+msg+"</h2>");
	pageContext.setAttribute("msg",msg);
--%>
<%

	//application = 설정파일 => config.xml
	//서블릿 3.0 이상에서는 WEB-INF/spring/root-context.xml을 지칭함
	//일반적으로 생성 불가, 리스너 생성하면 읽을 수 있음
	//1. 자바에서 리스너 생성 2. web.xml에서 생성
	WebApplicationContext context = 
	WebApplicationContextUtils.getWebApplicationContext(application);
	HelloImpl hello = (HelloImpl)context.getBean("hello");
	String msg = hello.sayHello();
	out.println("<h2>"+msg+"</h2>");
	
	MyCalc mc = (MyCalc)context.getBean("mc");
	int result = mc.plus(20, 10);
	 mc.minus(25,15);
	int res2 = mc.getResult();
	
	pageContext.setAttribute("result", result);
	pageContext.setAttribute("res2", res2);
	
	MyCalc2 mc2 = (MyCalc2)context.getBean("myCalc2");
	int res3 = mc2.multi(15, 10);
	int res4 = mc2.div(201, 5);
	pageContext.setAttribute("res3", res3);
	pageContext.setAttribute("res4", res4);
	
	Age age = (Age)context.getBean("age");
	int res5 = age.count("680628", "2");
	pageContext.setAttribute("res5", res5);
	

%>



<hr>
<h2><%=msg%></h2>
<hr>
<h2>${msg }</h2>
<h2>결과: 10+20 = ${result }</h2>
<h2>결과: 25 - 15 = ${res2 }</h2>
<h2>결과: 15*10 = ${res3 }</h2>
<h2>결과: 201/5 = ${res4 }</h2>
<hr>
<h2> 이름 : 김씨</h2>
<h2>나이: (680628,2) = ${res5 }</h2>


</body>
</html>