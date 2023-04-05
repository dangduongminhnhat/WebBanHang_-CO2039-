package com.example.servlet.manager;
import com.example.model.manager.*;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
public class ImportProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String providerJson = request.getParameter("providerJson");
        ObjectMapper mapper = new ObjectMapper();
        // Deserialize the JSON string into a User object
        Provider provider = mapper.readValue(providerJson, Provider.class);
        if(request.getParameter("clear") != null) ManagerService.clearNewProductsList();
        String quantity = request.getParameter("quantity");
		ManagerService.importProduct(provider, Integer.parseInt(quantity));
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}