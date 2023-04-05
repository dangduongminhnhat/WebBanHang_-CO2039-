package com.example.servlet.user;
import com.example.model.user.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
public class PaymentServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String userJson = request.getParameter("userJson");
        ObjectMapper mapper = new ObjectMapper();
        // Deserialize the JSON string into a User object
        User user = mapper.readValue(userJson, User.class);
        request.setAttribute("User", user);
        if(user.bankPay()) request.setAttribute("message", "Thanh toán thành công");
        else {
            request.setAttribute("message", "Số tiền trong tài khoản ngân hàng không đủ để thực hiện giao dịch này");
            RequestDispatcher view = request.getRequestDispatcher(".jsp");
            view.forward(request, response);
        }
        RequestDispatcher view = request.getRequestDispatcher(".jsp");
        view.forward(request, response);
    }     
}