package com.example.servlet.user;
import com.example.model.user.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String fullName = request.getParameter("fullname");
        String phoneNums = (String) request.getParameter("phoneNums");
        String userId = (String) request.getParameter("userId");
        String password = request.getParameter("password");
        String threeFirstChars = phoneNums.substring(0, 3);
        if(threeFirstChars.equals("+84")) phoneNums = ("0" + phoneNums.substring(3, 10));
        if(phoneNums.charAt(0) != '0') {
            request.setAttribute("message", "Số điện thoại không hợp lệ");
            RequestDispatcher view = request.getRequestDispatcher("register.jsp");
            view.forward(request, response);
        }
        else if(isValidPassword(password) == false) {
            request.setAttribute("message", "Mật khẩu phải có tối thiểu 4 ký tự");
            RequestDispatcher view = request.getRequestDispatcher("register.jsp");
            view.forward(request, response);    
        }
        else {
            if(ClientService.isExistedAccount(phoneNums) == true) {
                request.setAttribute("message", "Số điện thoại đã được sử dụng");
                RequestDispatcher view = request.getRequestDispatcher("register.jsp");
                view.forward(request, response);
            }
            else if(ClientService.isExistedUserId(userId) == true) {
                request.setAttribute("message", "Tên đăng nhập đã được sử dụng");
                RequestDispatcher view = request.getRequestDispatcher("register.jsp");
                view.forward(request, response);
            }
            else {
                User user = ClientService.register(fullName, phoneNums, userId, password);
                user.setActiveLoginState();
                request.setAttribute("user", user);
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
            }
        }
    }   

    private boolean isValidPassword(String password) {
        if(password.length() < 4) return false;
        return true;
    }    
}