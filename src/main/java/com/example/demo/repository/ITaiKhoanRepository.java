package com.example.demo.repository;

import com.example.demo.entity.TaiKhoan;

import java.util.List;

public interface ITaiKhoanRepository {
    List<TaiKhoan> findAll();
    boolean add(TaiKhoan taiKhoan);
    boolean deleteById(int id);
    TaiKhoan findById(int id);
    boolean update(TaiKhoan taiKhoan);
    List<TaiKhoan> searchByTen(String username);
}
