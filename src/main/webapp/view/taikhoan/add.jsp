<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới Tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0">Thêm mới Tài khoản</h4>
        </div>
        <div class="card-body">
            <form action="/tai-khoan" method="post">
                <input type="hidden" name="action" value="add"/>

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="text" name="password" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select" required>
                        <option value="admin">Admin</option>
                        <option value="khachhang" selected>Khách hàng</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success w-100 mb-2">Thêm mới</button>
                <a href="/tai-khoan" class="btn btn-secondary w-100">Quay về danh sách</a>
            </form>
        </div>
    </div>
</div>
<script>
    function validateForm() {
        const username = document.forms["addForm"]["username"].value.trim();
        const email = document.forms["addForm"]["email"].value.trim();
        const password = document.forms["addForm"]["password"].value.trim();

        if (username.length < 3) {
            alert("Username phải có ít nhất 3 ký tự");
            return false;
        }

        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$/;
        if (!emailPattern.test(email)) {
            alert("Email không hợp lệ");
            return false;
        }

        if (password.length < 6) {
            alert("Password phải có ít nhất 6 ký tự");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
