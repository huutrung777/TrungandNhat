<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Danh sách tài khoản</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f6fa;
      margin: 20px;
      color: #333;
    }

    h2 { color: #2f3640; }

    .message { color: green; font-weight: bold; margin-bottom: 15px; }

    a.add-btn {
      display: inline-block;
      margin: 10px 0;
      padding: 8px 15px;
      background-color: #4cd137;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: 0.3s;
    }

    a.add-btn:hover { background-color: #44bd32; }

    form.search-form { margin-bottom: 15px; }

    form.search-form input[type="text"] {
      padding: 7px; width: 250px;
      border: 1px solid #ccc; border-radius: 4px;
    }

    form.search-form button {
      padding: 7px 12px;
      background-color: #273c75; color: #fff;
      border: none; border-radius: 4px;
      cursor: pointer; transition: 0.3s;
    }

    form.search-form button:hover { background-color: #192a56; }

    table {
      width: 100%; border-collapse: collapse;
      background-color: #fff; box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    th, td { padding: 12px 15px; text-align: left; }
    th { background-color: #273c75; color: #fff; }
    tr:nth-child(even) { background-color: #f1f2f6; }
    tr:hover { background-color: #dcdde1; }

    td a { margin-right: 5px; }
  </style>
</head>
<body>
<div class="container mt-4">
  <h2>Danh sách Tài khoản</h2>
  
  <c:if test="${not empty mess}">
    <p class="message">${mess}</p>
  </c:if>
  <a class="btn btn-primary mb-3" href="/view/admin/home.jsp">🏠 Trang chủ</a>

  <form action="/tai-khoan" method="get" class="search-form">
    <input type="hidden" name="action" value="search"/>
    <input type="text" name="keyword" placeholder="Tìm theo username" />
    <button type="submit">Tìm kiếm</button>
  </form>

  <a class="add-btn" href="/tai-khoan?action=add">➕ Thêm mới</a>

  <table class="table table-striped mt-3">
    <thead>
    <tr>
      <th>ID</th>
      <th>Username</th>
      <th>Password</th>
      <th>Email</th>
      <th>Role</th>
      <th>Edit</th>
      <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="taikhoan" items="${taiKhoanList}">
      <tr>
        <td>${taikhoan.id}</td>
        <td>${taikhoan.username}</td>
        <td>${taikhoan.password}</td>
        <td>${taikhoan.email}</td>
        <td>${taikhoan.role}</td>
        <td>
          <a href="/tai-khoan?action=edit&id=${taikhoan.id}" class="btn btn-warning btn-sm">Edit</a>
        </td>
        <td>
          <button type="button" class="btn btn-danger btn-sm"
                  data-bs-toggle="modal" data-bs-target="#deleteModal"
                  onclick="setDeleteInfo('${taikhoan.id}','${taikhoan.username}')">
            Delete
          </button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="/tai-khoan" method="post">
        <input type="hidden" name="action" value="delete"/>
        <input type="hidden" id="deleteId" name="deleteId"/>
        <div class="modal-header">
          <h5 class="modal-title">Xác nhận xóa</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          Bạn có chắc muốn xóa tài khoản <strong id="deleteName"></strong>?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-danger">Delete</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function setDeleteInfo(id, username){
    document.getElementById("deleteId").value = id;
    document.getElementById("deleteName").innerText = username;
  }
</script>
</body>
</html>
