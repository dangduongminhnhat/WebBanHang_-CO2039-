package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.net.*;
public class CheckCartServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
        view.forward(request, response);
    }     
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
        view.forward(request, response);
    }     
}