package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
public class AddProductReviewServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        ObjectMapper mapper = new ObjectMapper();
        // Deserialize the JSON string into a User object
        User user = mapper.readValue(userJson, User.class);
        String productJson = request.getParameter("productJson");
        // Deserialize the JSON string into a User object
        ProductForSale product = mapper.readValue(productJson, ProductForSale.class);
        user.addProductReview(product, Integer.parseInt(request.getParameter("noOfStars")), request.getParameter("review"));
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}