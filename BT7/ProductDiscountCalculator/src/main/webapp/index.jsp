<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%response.sendRedirect("/CalculateServlet?action=CALCULATE");%>--%>

<!DOCTYPE html>
<html>
<head>
  <title>Product Discount Calculator</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

<h1>Tính Chiết Khấu</h1>
<form action="/DiscountServlet" method="post">
  <div class="mb-3">
    <label for="formGroupExampleInput" class="form-label">Product Description</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="product description" name="desc">
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput2" class="form-label">List Price</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="list price" name="price">
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput3" class="form-label">Discount Percent</label>
    <input type="text" class="form-control" id="formGroupExampleInput3" placeholder="discount percent" name="discount">
  </div>
  <input type="submit" value="CALCULATE">
  <%--  <button type="submit" name="action">Add</button>--%>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>
</html>