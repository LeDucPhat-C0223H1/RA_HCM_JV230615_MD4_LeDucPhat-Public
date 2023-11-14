<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>ProductManagement</title>
</head>
<body>
<h1><%= "Hello!" %></h1>
<br/>
<a href="<%=request.getContextPath()%>/ProductController?action=FINDALL">Danh sách sản phẩm</a>
</body>
</html>