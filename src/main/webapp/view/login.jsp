<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Poppins", sans-serif; }

        body {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: rgba(255,255,255,0.1);
            padding: 50px 40px;
            border-radius: 25px;
            width: 380px;
            text-align: center;
            color: white;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.3);
            position: relative;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: white;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px auto;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .avatar img {
            width: 60%;
        }

        .tag {
            display: inline-block;
            padding: 5px 20px;
            background: #0d6efd;
            border-radius: 25px;
            font-weight: 600;
            letter-spacing: 1px;
            margin-bottom: 15px;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 600;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
            outline: none;
            font-size: 16px;
            background: rgba(255,255,255,0.9);
            transition: 0.3s;
        }

        input:focus {
            box-shadow: 0 0 10px rgba(13,110,253,0.5);
        }

        button {
            width: 100%;
            padding: 12px;
            background: #0d6efd;
            border: none;
            color: white;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s;
        }

        button:hover {
            background: #0b5ed7;
            transform: scale(1.02);
        }

        .error {
            color: #ffd700;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .success {
            color: #0b5ed7;
            margin-bottom: 15px;
            background: #e9f1ff;
            border-radius: 8px;
            padding: 10px;
            font-size: 14px;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        a:hover {
            color: #e0f0ff;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="avatar">
        <img src="https://img.icons8.com/ios-filled/100/user-shield.png" alt="Avatar"/>
    </div>
    <div class="tag">Login</div>
    <h2>Đăng nhập</h2>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <c:if test="${not empty param.success}">
        <p class="success">${param.success}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <input type="text" name="username" placeholder="Tên đăng nhập" required />
        <input type="password" name="password" placeholder="Mật khẩu" required />
        <button type="submit">Đăng nhập</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/register">Đăng ký tài khoản</a></p>
    <p><a href="${pageContext.request.contextPath}/trang-chu">← Quay về Trang chủ</a></p>
</div>
</body>
</html>
