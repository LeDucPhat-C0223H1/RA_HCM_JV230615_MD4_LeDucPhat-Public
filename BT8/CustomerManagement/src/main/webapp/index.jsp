<%@ page import="java.util.List" %>
<%@ page import="ra.customermanagement.entity.Customer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>BT8_Customer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%
  List<Customer> customers = new ArrayList<>();
  SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
  try {
    customers.add(new Customer(1, "An Huy",formatter.parse("20/04/2000"),"Bình Định","https://giaydantuonganhtuan.vn/upload_images/images/ANI%20-%20073.jpg"));
    customers.add(new Customer(2, "Tài Đạt",formatter.parse("26/05/2000"),"Phú Yên","https://giaydantuonganhtuan.vn/upload_images/images/ANI%20-%20073.jpg"));
    customers.add(new Customer(3, "Quốc Khanh",formatter.parse("15/03/2000"),"Nghệ An","https://cdn1.tuoitre.vn/zoom/600_315/2022/10/22/cao-16664411860481249693502-crop-16664505252431862463468.jpg"));
    customers.add(new Customer(4, "Đức Quốc",formatter.parse("17/07/2000"),"Cà Mau","https://giaydantuonganhtuan.vn/upload_images/images/ANI%20-%20073.jpg"));
    customers.add(new Customer(5, "Quốc Phong",formatter.parse("19/011/2000"),"Đồng Tháp","https://giaydantuonganhtuan.vn/upload_images/images/ANI%20-%20073.jpg"));
  } catch (ParseException e) {
    throw new RuntimeException(e);
  }
%>


<h1><%= "Danh sách khách hàng" %></h1>
<table class="table">
  <thead>
  <tr>
    <th scope="col">Tên</th>
    <th scope="col">Ngày sinh</th>
    <th scope="col">Địa chỉ</th>
    <th scope="col">Ảnh</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="<%=customers%>" var="c">
    <tr>
      <th>${c.name}</th>
      <td>${c.birthday}</td>
      <td>${c.address}</td>
      <td><img width="80" height="80" style="object-fit: cover" src="${c.img}"></td>
    </tr>
  </c:forEach>

  </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>
</html>
