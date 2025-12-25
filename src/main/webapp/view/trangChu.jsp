<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>TechStore - Trang chủ</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f7fc;
        }

        /* NAVBAR */
        .navbar {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
        }

        /* BANNER */
        .banner {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
            color: white;
            padding: 90px 20px;
            text-align: center;
            border-radius: 0 0 45px 45px;
        }

        .banner h1 {
            font-weight: 700;
        }

        /* SECTION */
        .intro-box {
            background: white;
            border-radius: 18px;
            padding: 40px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .intro-icon {
            font-size: 45px;
            color: #0d6efd;
        }

        .footer {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
            color: #e6ecff;
            padding: 50px 0 20px;
            margin-top: 80px;
        }

        .footer a {
            color: #e6ecff;
            text-decoration: none;
            font-size: 14px;
        }

        .footer a:hover {
            color: #ffffff;
            text-decoration: underline;
        }

        .social-icons a {
            display: inline-block;
            width: 36px;
            height: 36px;
            line-height: 36px;
            text-align: center;
            border-radius: 50%;
            background: rgba(255,255,255,0.15);
            margin-right: 8px;
            transition: 0.3s;
        }

        .social-icons a:hover {
            background: #ffffff;
            color: #0d6efd;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold fs-4" href="#">TechStore</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Giới thiệu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Liên hệ</a>
                </li>
            </ul>

            <a href="/login" class="btn btn-outline-light me-2">
                <i class="bi bi-box-arrow-in-right"></i> Đăng nhập
            </a>
            <a href="/register" class="btn btn-light">
                <i class="bi bi-person-plus"></i> Đăng ký
            </a>
        </div>
    </div>
</nav>

<div class="banner">
    <h1>Chào mừng đến với TechStore</h1>
    <p class="fs-5 mt-3">
        Nền tảng mua sắm & quản lý công nghệ hiện đại
    </p>
    <a href="login.jsp" class="btn btn-light btn-lg mt-4">
        <i class="bi bi-arrow-right-circle"></i> Bắt đầu ngay
    </a>
</div>

<!-- ===== GIỚI THIỆU ===== -->
<div class="container mt-5">
    <div class="intro-box">
        <h3 class="text-center fw-bold mb-4">Về chúng tôi</h3>
        <p class="text-center text-muted mb-5">
            TechStore là hệ thống quản lý và kinh doanh sản phẩm công nghệ
            được xây dựng nhằm phục vụ học tập và phát triển kỹ năng lập trình Web Java.
        </p>

        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="intro-icon mb-3">
                    <i class="bi bi-shield-check"></i>
                </div>
                <h5 class="fw-bold">Uy tín</h5>
                <p class="text-muted">
                    Hệ thống rõ ràng, phân quyền minh bạch, bảo mật thông tin người dùng.
                </p>
            </div>

            <div class="col-md-4 mb-4">
                <div class="intro-icon mb-3">
                    <i class="bi bi-lightning-charge"></i>
                </div>
                <h5 class="fw-bold">Hiện đại</h5>
                <p class="text-muted">
                    Giao diện thân thiện, sử dụng Bootstrap 5 và chuẩn MVC.
                </p>
            </div>

            <div class="col-md-4 mb-4">
                <div class="intro-icon mb-3">
                    <i class="bi bi-people"></i>
                </div>
                <h5 class="fw-bold">Dễ sử dụng</h5>
                <p class="text-muted">
                    Phù hợp cho sinh viên học JSP – Servlet – JDBC.
                </p>
            </div>
        </div>
    </div>
</div>

<!-- ===== FOOTER ===== -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5 class="fw-bold">TechStore</h5>
                <p>Website giới thiệu hệ thống quản lý</p>
                <p>Dành cho đồ án Java Web</p>
            </div>

            <div class="col-md-4">
                <h5 class="fw-bold">Liên kết</h5>
                <p><a href="#">Trang chủ</a></p>
                <p><a href="#">Đăng nhập</a></p>
                <p><a href="#">Đăng ký</a></p>
            </div>

            <div class="col-md-4">
                <h5 class="fw-bold">Liên hệ</h5>
                <div class="social-icons mb-2">
                    <a href="#"><i class="bi bi-facebook"></i></a>
                    <a href="#"><i class="bi bi-instagram"></i></a>
                    <a href="#"><i class="bi bi-youtube"></i></a>
                </div>
                <p>Email: support@techstore.vn</p>
            </div>
        </div>

        <hr style="border-color: rgba(255,255,255,0.2)">
        <p class="text-center mb-0">© 2025 TechStore</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
