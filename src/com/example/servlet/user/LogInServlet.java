package com.example.servlet.user;
import com.example.model.user.*;

import java.beans.Encoder;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.net.*;
public class LogInServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        User user = ClientService.login(userId, password);
        if(user != null) {
            if(user.getLogInState() == true) {
                request.setAttribute("message", "Tài khoản đang được đăng nhập ở nơi khác");
                RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                view.forward(request, response);
            }
            else user.setActiveLoginState();
            if(request.getParameter("cart") != null) {
                ObjectMapper objectMapper = new ObjectMapper();
                String userJson = objectMapper.writeValueAsString(user);
                RequestDispatcher view = request.getRequestDispatcher("Cart?userJson=".concat(URLEncoder.encode(userJson, "UTF-8")));
                view.forward(request, response);
            }
            else {
                request.setAttribute("user", user);
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);    
            }
        }
        else {
            request.setAttribute("message", "Id tài khoản hoặc mật khẩu không chính xác");
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            view.forward(request, response);
        }

    }   
}