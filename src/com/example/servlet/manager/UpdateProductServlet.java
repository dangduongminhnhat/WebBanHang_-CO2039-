package com.example.servlet.manager;
import com.example.model.manager.*;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
public class UpdateProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int initPrice = Integer.parseInt(request.getParameter("initPrice"));
        int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));////
		ManagerService.updateProduct(image, description, name, category, quantity, unitPrice, initPrice);
        RequestDispatcher view = request.getRequestDispatcher("warehouse.jsp");
        view.forward(request, response);
    }     
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int initPrice = Integer.parseInt(request.getParameter("initPrice"));
        int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));///
		ManagerService.updateProduct(image, description, name, category, quantity, unitPrice, initPrice);
        RequestDispatcher view = request.getRequestDispatcher("warehouse.jsp");
        view.forward(request, response);
    }     
}