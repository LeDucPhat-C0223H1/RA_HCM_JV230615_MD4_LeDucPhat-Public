package ra.exercise07.controller;

import ra.exercise07.entity.Discount;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "DiscountServlet", value = "/DiscountServlet")
public class DiscountServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // Lấy dữ liệu từ form
        String description = request.getParameter("desc");
        double listPrice = Double.parseDouble(request.getParameter("price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount"));

        // tính toán chiết khấu
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        Discount discount = new Discount(description, listPrice, discountPercent, discountAmount, discountPrice);

        // Hiển thị kết quả
        request.setAttribute("discount", discount);
        request.getRequestDispatcher("/WEB-INF/displayResult.jsp").forward(request, response);

    }
}