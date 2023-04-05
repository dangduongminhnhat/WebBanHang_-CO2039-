package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;
public class GetProductsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        request.setAttribute("products", ClientService.getProducts());
        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        view.forward(request, response);
    }   
}