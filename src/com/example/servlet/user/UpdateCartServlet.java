package com.example.servlet.user;
import com.example.model.user.*;
import com.example.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
public class UpdateCartServlet extends HttpServlet {
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
        String remove = request.getParameter("remove");
        String add = request.getParameter("add");
        String clear = request.getParameter("clear");
        user.bankPay();
        if(remove != null) user.removeFromCart(product, Integer.parseInt(request.getParameter("quantity")));
        else if(add != null) user.addToCart(product, Integer.parseInt(request.getParameter("quantity")));
        else if(clear != null) user.clearCart();
        request.setAttribute("User", user);
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}