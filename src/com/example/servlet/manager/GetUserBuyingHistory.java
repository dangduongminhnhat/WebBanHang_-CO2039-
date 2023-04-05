package com.example.servlet.manager;
import com.example.model.user.*;
import com.example.model.manager.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.fasterxml.jackson.databind.ObjectMapper;
public class GetUserBuyingHistory extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        ObjectMapper mapper = new ObjectMapper();
        // Deserialize the JSON string into a User object
        String userJson = request.getParameter("userJson");
        User user = mapper.readValue(userJson, User.class);
        request.setAttribute("buyingHistory", user.getbuyingHistory());
        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}