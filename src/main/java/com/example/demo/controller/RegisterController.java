package com.example.demo.controller;

import com.example.demo.entity.TaiKhoan;
import com.example.demo.entity.TaiKhoanDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    private TaiKhoanDao taiKhoanDao = new TaiKhoanDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");

        if (!password.equals(confirm)) {
            request.setAttribute("message", "Mật khẩu không trùng khớp!");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
            return;
        }

        if (taiKhoanDao.exists(username, email)) {
            request.setAttribute("message", "Tên đăng nhập hoặc email đã tồn tại!");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
            return;
        }

        TaiKhoan taiKhoan = new TaiKhoan(username, password, email, "khachhang");
        boolean ok = taiKhoanDao.insertTaiKhoan(taiKhoan);
        if (ok) {
            String msg = URLEncoder.encode("Đăng ký thành công! Vui lòng đăng nhập.", "UTF-8");
            response.sendRedirect(request.getContextPath() + "/login?success=" + msg);
        } else {
            request.setAttribute("message", "Lỗi tạo tài khoản!");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
        }

    }
}
