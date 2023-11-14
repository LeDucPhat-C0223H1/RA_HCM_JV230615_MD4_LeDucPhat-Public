<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BenLaptop
  Date: 11/13/2023
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProductManagement</title>
    <%--hiển thị ink css--%>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
    <h1>Danh sách sản phẩm</h1>
    <a class="btn-btn-primary" href="<%=request.getContextPath()%>/ProductController?action=ADD">Thêm mới sản
        phẩm</a>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Description</th>
            <th scope="col">Producer</th>
            <th scope="col" colspan="3">Action</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        <c:forEach items="${list}" var="prod" varStatus="loop">
            <tr>
                <td>${prod.id}</td>
                <td>${prod.name}</td>
                <td>${prod.price}</td>
                <td>${prod.description}</td>
                <td>${prod.producer}</td>
                <td><a href="<%=request.getContextPath()%>/ProductController?action=DETAIL&id=${prod.id}"
                       class="btn btn-info">Detail</a></td>
                <td><a href="<%=request.getContextPath()%>/ProductController?action=EDIT&id=${prod.id}"
                       class="btn btn-warning">Edit</a></td>
                <td><a href="<%=request.getContextPath()%>/ProductController?action=DELETE&id=${prod.id}"
                       onclick="return confirm('Bạn có chắc muốn xóa không?')" class="btn btn-danger">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="d-flex justify-content-end">
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/">Quay lại</a>
    </div>
</div>

<%--hiển thị ink js--%>
<jsp:include page="../assets/foot.jsp"></jsp:include>
</body>
</html>
