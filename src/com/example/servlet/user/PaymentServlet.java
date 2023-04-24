package com.example.servlet.user;
import com.example.model.user.*;
import com.example.model.manager.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.*;
public class PaymentServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);    
        if(user.bankPay()) {
            ManagerService.noOfOrders++;
            request.setAttribute("message", "Đặt hàng thành công");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
        else {
            request.setAttribute("message", "Số tiền trong tài khoản ngân hàng không đủ để thực hiện giao dịch này");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
    }     
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);    
        if(user.bankPay()) {
            ManagerService.noOfOrders++;
            request.setAttribute("message", "Đặt hàng thành công");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
        else {
            request.setAttribute("message", "Số tiền trong tài khoản ngân hàng không đủ để thực hiện giao dịch này");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
            view.forward(request, response);
        }
    }     
}