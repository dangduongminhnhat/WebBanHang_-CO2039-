package com.example.servlet.user;
import com.example.model.user.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.*;
public class LogInServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String path = getServletContext().getRealPath("/") + "accountInfo.txt";
        User user = ClientService.login(userId, password);
        if(user != null) {
            if(user.getLogInState() == true) {
                request.setAttribute("message", "Tài khoản đang được đăng nhập ở nơi khác");
                RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                view.forward(request, response);
            }
            request.setAttribute("message", "Xin chào " + user.getFullName());
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
        else {
            request.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            view.forward(request, response);
        }

    }   
}