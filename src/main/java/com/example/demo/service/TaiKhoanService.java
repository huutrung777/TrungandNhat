package com.example.demo.service;

import com.example.demo.entity.TaiKhoan;
import com.example.demo.repository.ITaiKhoanRepository;
import com.example.demo.repository.TaiKhoanRepository;

import java.util.List;
public class TaiKhoanService implements ITaiKhoanService {

    private ITaiKhoanRepository taiKhoanRepository = new TaiKhoanRepository();

    @Override
    public List<TaiKhoan> findAll() {
        return taiKhoanRepository.findAll();
    }

    @Override
    public boolean add(TaiKhoan taiKhoan) {
        return taiKhoanRepository.add(taiKhoan);
    }

    @Override
    public boolean deleteById(int id) {
        return taiKhoanRepository.deleteById(id);
    }

    @Override
    public TaiKhoan findById(int id) {
        return taiKhoanRepository.findById(id);
    }

    @Override
    public boolean update(TaiKhoan taiKhoan) {
        return taiKhoanRepository.update(taiKhoan);
    }

    @Override
    public List<TaiKhoan> searchByTen(String username) {
        return taiKhoanRepository.searchByTen(username);
    }
}

