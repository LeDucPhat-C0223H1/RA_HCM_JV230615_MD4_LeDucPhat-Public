<%--
  Created by IntelliJ IDEA.
  User: BenLaptop
  Date: 11/13/2023
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProductManagement</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
<h1>Thêm mới sản phẩm</h1>

<form action="<%=request.getContextPath()%>/ProductController" method="post">
    <div class="mb-3">
        <label for="id" class="form-label">ID: </label>
        <input type="number" min="1" class="form-control" id="id" name="id">
    </div>
    <div class="mb-3">
        <label for="name" class="form-label">Name: </label>
        <input type="text" class="form-control" id="name" name="name" placeholder="tivi">
    </div>
    <div class="mb-3">
        <label for="price" class="form-label">Price: </label>
        <input type="number" class="form-control" id="price" name="price" rows="3" placeholder="1000000">
    </div>
    <div class="mb-3">
        <label for="desc" class="form-label">Description: </label>
        <textarea class="form-control" id="desc" name="desc" rows="3" placeholder="tivi siêu mỏng thế hệ mới"></textarea>
    </div>
    <div class="mb-3">
        <label for="producer" class="form-label">Producer: </label>
        <input type="text" class="form-control" id="producer" name="producer">
    </div>
    <input class="btn btn-success" type="submit" value="ADD" name="action">
</form>


<jsp:include page="../assets/foot.jsp"></jsp:include>
</body>
</html>
