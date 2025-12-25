<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06/12/2025
  Time: 6:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hệ thống Quản Lý CLB</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            background: #f4f7fc;
            color: #333;
        }

        header {
            background: #1565c0;
            color: white;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        nav {
            background: #0d47a1;
            text-align: center;
            padding: 10px 0;
        }

        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        nav a:hover {
            color: #ffeb3b;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
            text-align: center;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: 0.3s;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            color: #333;
            display: block;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .card h3 {
            color: #1565c0;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .card p {
            color: #666;
        }

        .card-icon {
            font-size: 40px;
            margin-bottom: 20px;
            color: #1565c0;
        }

        .logout-btn {
            background: #d32f2f;
            color: white;
            padding: 8px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<header>
    <h1>🎓 Quản Trị Hệ Thống </h1>
</header>
<nav>
    <a href="/home">Trang chủ</a>
    <a href="/logout">Đăng xuất</a>
</nav>
<div class="container">
    <h2>Chào mừng Admin!</h2>
    <p>Chọn chức năng quản lý bên dưới:</p>

    <div class="dashboard-grid">
        <a href="" class="card">
            <div class="card-icon">📂</div>
            <h3>Quản Lý Sản phẩm </h3>
            <p>Thêm, sửa, xóa </p>
        </a>

        <a href="" class="card">
            <div class="card-icon">📅</div>
            <h3>Quản Lý Đơn Hàng </h3>
            <p>Thêm, sửa, xóa .</p>
        </a>

        <a href="/tai-khoan" class="card">
            <div class="card-icon">📊</div>
            <h3>Quản lý tài khoản</h3>
            <p>Thêm, sửa, xóa các tài khoản đang hoạt động</p>
        </a>
    </div>
</div>

</body>
</html>


