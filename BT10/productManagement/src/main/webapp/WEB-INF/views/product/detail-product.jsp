<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: BenLaptop
  Date: 11/13/2023
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProductManagement</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
<h1 class="text-center">Thông tin chi tiết</h1>
<div class="container-fluid d-flex gap-3 mt-5">
    <div>
        <img width="170" height="170" style="object-fit: cover" src="data:image/jpeg;base64,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">
    </div>

    <div>
        <div class="d-flex flex-column ">
            <div class="d-flex flex-row justify-content-between gap-5" style="background: aqua" >
                <p><span class="fs-5 fw-bold">Id: </span> ${product.id}</p>
                <p><span class="fs-5 fw-bold">Name: </span> ${product.name}</p>
                <p><span class="fs-5 fw-bold">Price: </span> ${product.price}</p>
                <p><span class="fs-5 fw-bold">Phone: </span> ${product.producer}</p>
            </div>
        </div>
<%--        <div>--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td style="padding-right: 200px"><p><span class="fs-5 fw-bold">Id: </span> ${customer.id}</p></td>--%>
<%--                    <td style="padding-right: 200px"><p><span class="fs-5 fw-bold">Name: </span> ${customer.name}</p></td>--%>
<%--                    <td style="padding-right: 200px"><p><span class="fs-5 fw-bold">Email: </span> ${customer.email}</p></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><p><span class="fs-5 fw-bold">Phone: </span> ${customer.phone}</p></td>--%>
<%--                    <td><p><span class="fs-5 fw-bold">Gender: </span> ${customer.gen ? "Nam" : "Nữ"}</p></td>--%>
<%--                    <td><p><span class="fs-5 fw-bold">Birthday: </span> ${customer.birthday}</p></td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </div>--%>
        <div>
            <p><span class="fs-5 fw-bold">BIOS: </span> ${product.description}</p>
        </div>
    </div>
</div>
<div class="d-flex justify-content-end">
    <a class="btn btn-primary" href="<%=request.getContextPath()%>/">Quay lại</a>
</div>

<jsp:include page="../assets/foot.jsp"></jsp:include>
</body>
</html>
