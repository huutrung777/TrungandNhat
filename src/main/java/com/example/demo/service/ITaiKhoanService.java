package com.example.demo.service;

import com.example.demo.entity.TaiKhoan;

import java.util.List;

public interface ITaiKhoanService {
    List<TaiKhoan> findAll();
    boolean add(TaiKhoan taiKhoan);
    boolean deleteById(int id);
    TaiKhoan findById(int id);
    boolean update(TaiKhoan taiKhoan);
    List<TaiKhoan> searchByTen(String username);
}
