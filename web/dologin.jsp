<%--
  Created by IntelliJ IDEA.
  User: hjx
  Date: 2019/8/18
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.net.*" %>
<html>
<head>
	<title>登录成功页面</title>
</head>
<body>
<h1>登录成功</h1>
<hr>
<br>
<br>
<%
	request.setCharacterEncoding("utf-8");
	//首先判断用户是否选择了记住登录状态
	String[] isUseCookie=request.getParameterValues("isUseCookie");
	if (isUseCookie!=null&&isUseCookie.length>0){
	    //把用户名和密码保存到Cookie对象里面
	    String username=URLEncoder.encode(request.getParameter("username"),"utf-8");
	    //使用URLEncoder.encode方法解决cookie的中文字符串异常
	    String password=URLEncoder.encode(request.getParameter("password"),"utf-8");

	    //创建Cookie对象
	    Cookie usernameCookie=new Cookie("username",username);
	    Cookie passwordCookie=new Cookie("password",password);
	    //设置生命周期为10天
	    usernameCookie.setMaxAge(864000);
	    passwordCookie.setMaxAge(864000);
	    //写入Cookie对象
	    response.addCookie(usernameCookie);
	    response.addCookie(passwordCookie);
	}else {
	    Cookie[] cookies=request.getCookies();
	    if (cookies!=null&&cookies.length>0){
	        for (Cookie c:cookies){
	            if (c.getName().equals("username")||c.getName().equals("password")){
	               //设置生存期限为0
	                c.setMaxAge(0);
	                //保存cookie
	                response.addCookie(c);
				}
			}
		}
	}
%>
<a href="users.jsp" target="_blank">查看用户信息</a>
</body>
</html>
