<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
  	<title>Đăng ký</title>
    <meta charset="utf-8">
  </head>

  <body>
    <h1>Đăng ký</h1>
    <form method="post" action="Register">
    	<label for="query">Họ và Tên</label>
      <input type="text" id="query" name="fullname"><br>

    	<label for="query">Số điện thoại</label>
      <input type="text" id="query" name="phoneNums"><br>

    	<label for="query">Id tài khoản</label>
      <input type="text" id="query" name="userId"><br>

      <label for="query">Mật khẩu</label>
      <input type="text" id="query" name="password"><br>

      <input type="reset" value = "Nhập lại">
      <input type="submit" value="Đăng ký">
    </form>
    <p>${message}</p>
    <button onclick="window.location.href = 'index.jsp'">Trở về</button>
  </body>
</html>