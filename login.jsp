<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
  	<title>Đăng nhập</title>
    <meta charset="utf-8">
  </head>

  <body>
    <%String cart = request.getParameter("cart");%>
    <h1>Đăng nhập</h1>
    <form method="post" action="Login">
      <%if(cart != null)%> <input type="hidden" name = "cart" value = "true">
    	<label for="query">Id tài khoản</label>
    	<input type="text" id="query" name="userId"><br>

      <label for="query">Mật khẩu</label>
      <input type="text" id="query" name="password"><br>

      <input type="reset" value = "Nhập lại">
      <input type="submit" value = "Đăng nhập">
    </form>
    <p>Chưa có tài khoản, <a href="register.jsp"><i>Đăng ký tại đây</i></a></p>
    <p>${message}</p>
    <button onclick="window.location.href = 'index.jsp'">Trở về</button>
  </body>
</html>