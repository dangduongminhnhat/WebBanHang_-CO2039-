package com.example.servlet.user;
import com.example.model.manager.ManagerService;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.net.*;
public class GetProductDetailsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        String productJson = request.getParameter("productJson");
        decodedValue = URLDecoder.decode(productJson, "UTF-8");
        ProductForSale product = mapper.readValue(decodedValue, ProductForSale.class);
        for(int i = 0; i < ManagerService.products.size(); i++) {
            if(product.getName().equals(ManagerService.products.get(i).getName())) {
                request.setAttribute("product", ManagerService.products.get(i));
                request.setAttribute("user", user);
                RequestDispatcher view = request.getRequestDispatcher("product.jsp");
                view.forward(request, response);
            }
        }
    }     

    public void doGet(HttpServletRequest request, HttpServletResponse response) 
    throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        String productJson = request.getParameter("productJson");
        decodedValue = URLDecoder.decode(productJson, "UTF-8");
        ProductForSale product = mapper.readValue(decodedValue, ProductForSale.class);
        for(int i = 0; i < ManagerService.products.size(); i++) {
            if(product.getName().equals(ManagerService.products.get(i).getName())) {
                request.setAttribute("product", ManagerService.products.get(i));
                break;
            }
        }
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("product.jsp");
        view.forward(request, response);
    }     
}