package com.example.demo.repository;

import com.example.demo.entity.TaiKhoan;
import com.example.demo.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaiKhoanRepository implements ITaiKhoanRepository {
    private static final String login = "SELECT id, username, password, email, role FROM tai_khoan WHERE username = ?";
    private final String SELECT_ALL = "select * from tai_khoan;";
    private final String INSERT_INTO = "INSERT INTO tai_khoan(username,password,email,role) VALUES(?,?,?,?)";
    private final String DELETE_BY_ID = "delete from tai_khoan where id = ?;";
    private final String SELECT_BY_ID = "select * from tai_khoan where id = ?;";
    private final String UPDATE_TAIKHOAN = "UPDATE tai_khoan SET username=?, password=?, email=?, role=? WHERE id=?";
    private static final String SEARCH_BY_USERNAME = "SELECT * FROM tai_khoan WHERE username LIKE ?;";

    @Override
    public List<TaiKhoan> findAll() {
        List<TaiKhoan> taiKhoanList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");

                TaiKhoan taiKhoan = new TaiKhoan(id, username, password, email, role);
                taiKhoanList.add(taiKhoan);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu");
        }

        return taiKhoanList;

    }
    @Override
    public boolean add(TaiKhoan taiKhoan) {
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(INSERT_INTO)) {

            ps.setString(1, taiKhoan.getUsername());
            ps.setString(2, taiKhoan.getPassword());
            ps.setString(3, taiKhoan.getEmail());
            ps.setString(4, taiKhoan.getRole());
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);

            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (deleteById)");
        }
        return false;

    }
    @Override
    public TaiKhoan findById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");

                return new TaiKhoan(id, username, password, email, role);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (findById)");
        }
        return null;
    }
    @Override
    public boolean update(TaiKhoan taiKhoan) {

        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(UPDATE_TAIKHOAN)) {

            ps.setString(1, taiKhoan.getUsername());
            ps.setString(2, taiKhoan.getPassword());
            ps.setString(3, taiKhoan.getEmail());
            ps.setString(4, taiKhoan.getRole());
            ps.setInt(5, taiKhoan.getId());

            int rows = ps.executeUpdate();
            System.out.println("Updated rows: " + rows);
            return rows == 1;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public List<TaiKhoan> searchByTen(String username) {
        List<TaiKhoan> list = new ArrayList<>();
        try (
                Connection connection = ConnectDB.getConnectDB();
                PreparedStatement ps = connection.prepareStatement(SEARCH_BY_USERNAME)
        ) {
            ps.setString(1, "%" + username + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TaiKhoan tk = new TaiKhoan();
                tk.setId(rs.getInt("id"));
                tk.setUsername(rs.getString("username"));
                tk.setPassword(rs.getString("password"));
                tk.setEmail(rs.getString("email"));
                tk.setRole(rs.getString("role"));
                list.add(tk);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi truy vấn dữ liệu (searchByTen)");
            e.printStackTrace();
        }
        return list;
    }
}
