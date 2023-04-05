package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
public class GetBestSellerServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        request.setAttribute("bestSeller", ClientService.getBestSeller());
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}