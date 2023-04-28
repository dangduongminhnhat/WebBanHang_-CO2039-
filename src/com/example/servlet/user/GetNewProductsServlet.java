package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.net.*;
public class GetNewProductsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        request.setAttribute("user", user);
        request.setAttribute("price", request.getParameter("price"));
        request.setAttribute("sort", request.getParameter("sort"));
        request.setAttribute("brand", request.getParameter("brand"));
        request.setAttribute("filter", request.getParameter("filter"));
        RequestDispatcher view = request.getRequestDispatcher("newProducts-all.jsp");
        view.forward(request, response);
    }     
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
    throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        request.setAttribute("user", user);
        request.setAttribute("price", request.getParameter("price"));
        request.setAttribute("sort", request.getParameter("sort"));
        request.setAttribute("brand", request.getParameter("brand"));
        request.setAttribute("filter", request.getParameter("filter"));
        RequestDispatcher view = request.getRequestDispatcher("newProducts-all.jsp");
        view.forward(request, response);
    }  
}
