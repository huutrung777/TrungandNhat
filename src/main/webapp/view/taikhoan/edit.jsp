<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Cập nhật Tài khoản</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="card shadow-sm mx-auto" style="max-width: 600px;">
    <div class="card-header bg-primary text-white">
      <h4 class="mb-0">Cập nhật thông tin Tài khoản</h4>
    </div>

    <div class="card-body">
      <form action="/tai-khoan" method="post">
        <input type="hidden" name="action" value="edit"/>
        <input type="hidden" name="id" value="${taiKhoan.id}"/>

        <div class="mb-3">
          <label class="form-label">Username</label>
          <input type="text" class="form-control" value="${taiKhoan.username}" disabled/>
        </div>

        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email" name="email" class="form-control"
                 value="${taiKhoan.email}" required/>
        </div>

        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="text" name="password" class="form-control"
                 value="${taiKhoan.password}" required/>
        </div>

        <div class="mb-3">
          <label class="form-label">Role</label>
          <input type="text" class="form-control" value="${taiKhoan.role}" disabled/>
        </div>

        <button type="submit" class="btn btn-success w-100 mb-2">Cập nhật</button>
        <a href="/tai-khoan" class="btn btn-secondary w-100">Quay về danh sách</a>
      </form>

    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
