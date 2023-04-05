package com.example.servlet.manager;
import com.example.model.user.*;
import com.example.model.manager.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.fasterxml.jackson.databind.ObjectMapper;
public class GetProvidersServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        request.setAttribute("providers", ManagerService.providers);
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}