<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký tài khoản</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Poppins", sans-serif; }

        body {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background: rgba(255,255,255,0.1);
            padding: 50px 40px;
            border-radius: 25px;
            width: 380px;
            text-align: center;
            color: white;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.3);
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

        a.back-btn {
            display: inline-block;
            margin-top: 15px;
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        a.back-btn:hover {
            color: #e0f0ff;
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="avatar">
        <img src="https://img.icons8.com/ios-filled/100/add-user-group-man-man.png" alt="Avatar"/>
    </div>
    <div class="tag">Register</div>
    <h2>Đăng ký tài khoản</h2>

    <c:if test="${not empty message}">
        <p class="error">${message}</p>
    </c:if>

    <form id="registerForm" action="${pageContext.request.contextPath}/register" method="post">
        <input type="text" name="username" placeholder="Tên đăng nhập" value="${param.username}" required />
        <input type="email" name="email" placeholder="Email" value="${param.email}" required />
        <input type="password" name="password" placeholder="Mật khẩu" required />
        <input type="password" name="confirm" placeholder="Nhập lại mật khẩu" required />
        <button type="submit">Đăng ký</button>
    </form>
    <a href="${pageContext.request.contextPath}/login" class="back-btn">← Quay lại Đăng nhập</a>
    <p><a href="${pageContext.request.contextPath}/trang-chu">← Quay về Trang chủ</a></p>
</div>

<script>
    const form = document.getElementById('registerForm');
    form.addEventListener('submit', function(e) {
        const username = form.username.value.trim();
        const email = form.email.value.trim();
        const password = form.password.value.trim();
        const confirm = form.confirm.value.trim();
        let message = '';
        if (username.length < 4) message = 'Tên đăng nhập phải có ít nhất 4 ký tự.';
        else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) message = 'Email không hợp lệ.';
        else if (password.length < 6) message = 'Mật khẩu phải có ít nhất 6 ký tự.';
        else if (password !== confirm) message = 'Mật khẩu xác nhận không khớp.';
        if (message) {
            e.preventDefault();
            let errorElement = document.querySelector('.error');
            if (!errorElement) {
                errorElement = document.createElement('p');
                errorElement.classList.add('error');
                form.prepend(errorElement);
            }
            errorElement.textContent = message;
        }
    });
</script>
</body>
</html>
