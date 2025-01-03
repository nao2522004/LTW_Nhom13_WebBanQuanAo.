package vn.edu.hcmuaf.fit.webbanquanao.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.webbanquanao.dao.model.Role;
import vn.edu.hcmuaf.fit.webbanquanao.dao.model.User;
import vn.edu.hcmuaf.fit.webbanquanao.service.AuthService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AuthService service = new AuthService();

        User user = service.checkLogin(username, password, 1);


        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("auth", user); // Lưu người dùng vào session với tên 'auth'

            if (user.getRoleName().equalsIgnoreCase("ADMIN")) {
                response.sendRedirect("./index.jsp");
            } else if (user.getRoleName().equalsIgnoreCase("USER")) {
                response.sendRedirect("./index.jsp");
            }
        } else {
            request.setAttribute("error", "Dang Nhap Khong Thanh Cong");
            request.getRequestDispatcher("./login.jsp").forward(request, response);
        }



    }
}