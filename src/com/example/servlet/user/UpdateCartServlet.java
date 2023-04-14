package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.net.*;
public class UpdateCartServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        String productJson = request.getParameter("productJson");
        if(productJson == null) {    
            user.clearCart();
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
        decodedValue = URLDecoder.decode(productJson, "UTF-8");
        ProductForSale product = mapper.readValue(decodedValue, ProductForSale.class);
        String saleoff = request.getParameter("saleoff");
        if(request.getParameter("cart") == null) {
            user.addToCart(product, Integer.parseInt(request.getParameter("quantity")), product.getSaleoff());
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
        if(request.getParameter("clear") != null) {
            user.updateCart(product, 0, product.getSaleoff());
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
        user.updateCart(product, Integer.parseInt(request.getParameter("quantity")), product.getSaleoff());
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
        view.forward(request, response);
    }     
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);
        String productJson = request.getParameter("productJson");
        if(productJson == null) {    
            user.clearCart();
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
        decodedValue = URLDecoder.decode(productJson, "UTF-8");
        ProductForSale product = mapper.readValue(decodedValue, ProductForSale.class);
        if(request.getParameter("cart") == null) {
            // if(saleoff != null) user.addToCart(product, Integer.parseInt(request.getParameter("quantity")), Double.parseDouble(saleoff));
            user.addToCart(product, Integer.parseInt(request.getParameter("quantity")), product.getSaleoff());
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
        if(request.getParameter("clear") != null) {
            user.updateCart(product, 0, product.getSaleoff());
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
        // if(saleoff != null) user.updateCart(product, Integer.parseInt(request.getParameter("quantity")), Double.parseDouble(saleoff));
        user.updateCart(product, Integer.parseInt(request.getParameter("quantity")), product.getSaleoff());
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
        view.forward(request, response);
    }     
}