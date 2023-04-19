package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.net.*;
public class AddProductReviewServlet extends HttpServlet {
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
        user.addProductReview(product, Integer.parseInt(request.getParameter("noOfStars")), request.getParameter("review"), user);
        request.setAttribute("user", user);
        request.setAttribute("product", product);
        RequestDispatcher view = request.getRequestDispatcher("product.jsp");
        view.forward(request, response);
    }     
}