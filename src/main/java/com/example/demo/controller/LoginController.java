package com.example.demo.controller;

import com.example.demo.entity.TaiKhoan;
import com.example.demo.entity.TaiKhoanDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private TaiKhoanDao taiKhoanDao = new TaiKhoanDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        TaiKhoan taiKhoan = taiKhoanDao.checkLogin(username, password);
        if (taiKhoan == null) {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("taiKhoan", taiKhoan);

        switch (taiKhoan.getRole()) {
            case "admin":
                response.sendRedirect(request.getContextPath() + "/view/admin/home.jsp");
                break;
            case "khachhang":
                response.sendRedirect(request.getContextPath() + "/view/khachhang/home.jsp");
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
