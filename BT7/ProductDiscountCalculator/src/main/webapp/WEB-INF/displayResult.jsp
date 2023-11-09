<%--
  Created by IntelliJ IDEA.
  User: BenLaptop
  Date: 11/9/2023
  Time: 7:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>


<p>Mô tả sản phẩm: ${discount.description}</p>
<p>Giá bán: ${discount.listPrice} vnđ</p>
<p>Chiết khấu: ${discount.discountPercent}%</p>
<p>Giá giảm: ${discount.discountAmount} vnđ</p>
<p>Giá bán sau cùng: ${discount.discountPrice} vnđ</p>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>
</html>
