package com.example.demo.controller;

import com.example.demo.entity.TaiKhoan;
import com.example.demo.service.ITaiKhoanService;
import com.example.demo.service.TaiKhoanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet(name = "TaiKhoanController", value = "/tai-khoan")
public class TaiKhoanController extends HttpServlet {
    private ITaiKhoanService taiKhoanService = new TaiKhoanService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                showFormAdd(request, response);
                break;

            case "edit":
                showFormEdit(request, response);
                break;

            case "find":
                findById(request, response);
                break;

            case "search":
                search(request, response);
                break;

            default:
                showList(request, response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<TaiKhoan> taiKhoanList;
        if (keyword != null && !keyword.isEmpty()) {
            taiKhoanList = taiKhoanService.searchByTen(keyword);
        } else {
            taiKhoanList = taiKhoanService.findAll();
        }
        request.setAttribute("taiKhoanList", taiKhoanList);
        request.setAttribute("mess", "Kết quả tìm kiếm cho: " + keyword);
        request.getRequestDispatcher("/view/taikhoan/list.jsp").forward(request, response);
    }

    private void findById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TaiKhoan taiKhoan = taiKhoanService.findById(id);

        if (taiKhoan != null) {
            request.setAttribute("taiKhoanList", List.of(taiKhoan));
            request.setAttribute("mess", "Tìm thấy ID: " + id);
        } else {
            request.setAttribute("taiKhoanList", List.of());
            request.setAttribute("mess", "Không tìm thấy ID: " + id);
        }
        request.getRequestDispatcher("/view/taikhoan/list.jsp").forward(request, response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        TaiKhoan taiKhoan = taiKhoanService.findById(id);
        if (taiKhoan != null) {
            request.setAttribute("taiKhoan", taiKhoan);
            request.getRequestDispatcher("/view/taikhoan/edit.jsp").forward(request, response);
        } else {
            response.sendRedirect("/tai-khoan?mess=" +
                    URLEncoder.encode("Tài khoản không tồn tại", "UTF-8"));
        }
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/taikhoan/add.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TaiKhoan> taiKhoanList = taiKhoanService.findAll();
        request.setAttribute("taiKhoanList", taiKhoanList);
        request.getRequestDispatcher("/view/taikhoan/list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                save(request, response);
                break;

            case "edit":
                update(request, response);
                break;

            case "delete":
                deleteById(request, response);
                break;

            default:
                response.sendRedirect("/tai-khoan");
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TaiKhoan taiKhoan = taiKhoanService.findById(id);

        if (taiKhoan != null) {
            taiKhoan.setUsername(request.getParameter("username"));
            taiKhoan.setPassword(request.getParameter("password"));
            taiKhoan.setEmail(request.getParameter("email"));
            taiKhoan.setRole(request.getParameter("role"));

            boolean isSuccess = taiKhoanService.update(taiKhoan);
            String mess = isSuccess ? "Cập nhật thành công" : "Cập nhật thất bại";
            response.sendRedirect("/tai-khoan?mess=" + URLEncoder.encode(mess, "UTF-8"));
        } else {
            response.sendRedirect("/tai-khoan?mess=" + URLEncoder.encode("Tài khoản không tồn tại", "UTF-8"));
        }
    }

    private void deleteById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean isSuccess = taiKhoanService.deleteById(id);
        String mess = isSuccess ? "Xóa thành công" : "Xóa thất bại";
        response.sendRedirect("/tai-khoan?mess=" +
                URLEncoder.encode(mess, "UTF-8"));
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setUsername(request.getParameter("username"));
        taiKhoan.setPassword(request.getParameter("password"));
        taiKhoan.setEmail(request.getParameter("email"));
        taiKhoan.setRole(request.getParameter("role")); // admin/khachhang

        boolean isSuccess = taiKhoanService.add(taiKhoan);
        String mess = isSuccess ? "Thêm mới thành công" : "Thêm mới thất bại";
        response.sendRedirect("/tai-khoan?mess=" + URLEncoder.encode(mess, "UTF-8"));
    }
}
