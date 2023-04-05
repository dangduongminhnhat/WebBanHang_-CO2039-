package com.example.servlet.manager;
import com.example.model.manager.*;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
public class UpdateSaleOffProductsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String productJson = request.getParameter("productJson");
        ObjectMapper mapper = new ObjectMapper();
        // Deserialize the JSON string into a User object
        ProductForSale product = mapper.readValue(productJson, ProductForSale.class);
        if(request.getParameter("add") != null) ManagerService.addSaleOffProducts(product);
        if(request.getParameter("remove") != null) ManagerService.removeSaleOffProducts(product);
        if(request.getParameter("clear") != null) ManagerService.clearSaleOffProducts();
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}