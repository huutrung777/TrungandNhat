package com.example.demo.entity;

import com.example.demo.util.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TaiKhoanDao {

    // Thêm tài khoản mới
    public boolean insertTaiKhoan(TaiKhoan taiKhoan) {
        String sql = "INSERT INTO tai_khoan(username, email, password, role) VALUES (?,?,?,?)";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, taiKhoan.getUsername());
            ps.setString(2, taiKhoan.getEmail());
            ps.setString(3, taiKhoan.getPassword());
            ps.setString(4, taiKhoan.getRole());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Kiểm tra username/email đã tồn tại chưa
    public boolean exists(String username, String email) {
        String sql = "SELECT id FROM tai_khoan WHERE username=? OR email=?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Kiểm tra login
    public TaiKhoan checkLogin(String username, String password) {
        String sql = "SELECT id, username, password, email, role FROM tai_khoan WHERE username=? AND password=?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                TaiKhoan tk = new TaiKhoan();
                tk.setId(rs.getInt("id"));
                tk.setUsername(rs.getString("username"));
                tk.setEmail(rs.getString("email"));
                tk.setPassword(rs.getString("password"));
                tk.setRole(rs.getString("role"));
                return tk;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
