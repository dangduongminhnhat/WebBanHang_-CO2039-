package com.example.servlet.user;
import com.example.model.user.*;
import java.io.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.*;
public class LogOutServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        ObjectMapper mapper = new ObjectMapper();
        // Deserialize the JSON string into a User object
        User user = mapper.readValue(userJson, User.class);
        user.logout();
        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        view.forward(request, response);
    }   
}