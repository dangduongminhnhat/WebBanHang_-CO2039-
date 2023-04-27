package com.example.servlet.manager;
import com.example.model.manager.*;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.net.*;
public class RemoveProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String productJson = request.getParameter("productJson");
        ObjectMapper mapper = new ObjectMapper();
        String decodedValue = URLDecoder.decode(productJson, "UTF-8");
        ProductForSale product = mapper.readValue(decodedValue, ProductForSale.class);
        ManagerService.removeProduct(product);
        RequestDispatcher view = request.getRequestDispatcher("warehouse.jsp");
        view.forward(request, response);
    }     
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String productJson = request.getParameter("productJson");
        ObjectMapper mapper = new ObjectMapper();
        String decodedValue = URLDecoder.decode(productJson, "UTF-8");
        ProductForSale product = mapper.readValue(decodedValue, ProductForSale.class);
        ManagerService.removeProduct(product);
        RequestDispatcher view = request.getRequestDispatcher("warehouse.jsp");
        view.forward(request, response);
    }     
}