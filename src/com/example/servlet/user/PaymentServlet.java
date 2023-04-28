package com.example.servlet.user;
import com.example.model.user.*;
import com.example.model.manager.*;
import com.fasterxml.jackson.core.util.RequestPayload;
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
        String nameOfClient = request.getParameter("fullName");
        String phoneNums = request.getParameter("phoneNums");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String note = request.getParameter("note");
        if(user.bankPay(nameOfClient, phoneNums, address, email, note)) {
            ManagerService.noOfOrders++;
            request.setAttribute("message", "Đặt Hàng Thành Công");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("info-delivery.jsp");
            view.forward(request, response);
        }
        else {
            request.setAttribute("message", "Tiền không đủ để giao dịch");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("info-delivery.jsp");
            view.forward(request, response);
        }
    }     
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        String userJson = request.getParameter("userJson");
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        User user = (User) mapper.readValue(decodedValue, User.class);    
        String nameOfClient = request.getParameter("fullName");
        String phoneNums = request.getParameter("phoneNums");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String note = request.getParameter("note");
        if(user.bankPay(nameOfClient, phoneNums, address, email, note)) {
            ManagerService.noOfOrders++;
            request.setAttribute("message", "Đặt Hàng Thành Công");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("info-delivery.jsp");
            view.forward(request, response);
        }
        else {
            request.setAttribute("message", "Tiền không đủ để giao dịch");
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("info-delivery.jsp");
            view.forward(request, response);
        }
    }     
}