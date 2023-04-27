package com.example.servlet.user;
import com.example.model.user.*;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
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
            else if(request.getParameter("product") != null) {
                ObjectMapper objectMapper = new ObjectMapper();
                String userJson = objectMapper.writeValueAsString(user);
                String productJson = request.getParameter("productJson");
                String path = "upd-ct?product=true&userJson=" + URLEncoder.encode(userJson, "UTF-8") + "&productJson=" + URLEncoder.encode(productJson, "UTF-8") + "&size=" + request.getParameter("size") + "&quantity=" + request.getParameter("quantity");
                // RequestDispatcher view = request.getRequestDispatcher("upd-ct?product=true&userJson=".concat(URLEncoder.encode(userJson, "UTF-8")).concat("&productJson=".concat(URLEncoder.encode(productJson, "UTF-8"))).concat("&size=".concat(request.getParameter("size"))).concat("&quantity=".concat(request.getParameter("quantity"))));
                RequestDispatcher view = request.getRequestDispatcher(path);
                view.forward(request, response);
            }
            else {
                request.setAttribute("user", user);
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);    
            }
        }
        else {
            request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác");
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            view.forward(request, response);
        }
    }   
}