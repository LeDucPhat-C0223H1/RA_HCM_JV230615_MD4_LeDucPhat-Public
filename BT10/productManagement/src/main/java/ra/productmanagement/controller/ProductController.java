package ra.productmanagement.controller;

import ra.productmanagement.model.Product;
import ra.productmanagement.service.IProductService;
import ra.productmanagement.serviceImpl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "ProductController", value = "/ProductController")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request,response);
        } else {
            switch (action) {
                case "FINDALL":
                    showListProcuct(productService.findALl(),request,response);
                    break;
                case "ADD":
                    request.getRequestDispatcher("/WEB-INF/views/product/add-product.jsp").forward(request, response);
                    break;
                case "EDIT":
                    long idEdit = Long.parseLong(request.getParameter("id"));
                    Optional<Product> optionalCustomerEdit = productService.findbyId(idEdit);
                    optionalCustomerEdit.ifPresent(prod -> {
                        request.setAttribute("product", prod);
                        try {
                            request.getRequestDispatcher("/WEB-INF/views/product/edit-product.jsp").forward(request, response);
                        } catch (ServletException | IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
                    break;
                case "DETAIL":
                    long idDetail = Long.parseLong(request.getParameter("id"));
                    Optional<Product> optionalCustomerDetail = productService.findbyId(idDetail);
                    optionalCustomerDetail.ifPresent( prod-> {
                        request.setAttribute("product", prod);
                        try {
                            request.getRequestDispatcher("/WEB-INF/views/product/detail-product.jsp").forward(request,response);
                        } catch (ServletException e) {
                            throw new RuntimeException(e);
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
                case "DELETE":
                    long idDel = Long.parseLong(request.getParameter("id"));
                    productService.deleteById(idDel);
                    showListProcuct(productService.findALl(),request,response);
                    break;
            }
        }
    }

    protected  void showListProcuct(List<Product> list, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list" ,list);
        request.getRequestDispatcher("/WEB-INF/views/product/list-product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null){
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request,response);
        } else {
            switch (action) {
                case "ADD":
                    // lấy ra toàn bộ thông tin nhập vào
                    long idNew = Long.parseLong(request.getParameter("id"));
                    String newName = request.getParameter("name");
                    Double newPrice = Double.parseDouble(request.getParameter("price"));
                    String newDesc = request.getParameter("desc");
                    String newProducer = request.getParameter("producer");

                    Product newProduct = new Product(idNew, newName, newPrice, newDesc, newProducer);
                    productService.save(newProduct);
                    showListProcuct(productService.findALl(),request, response);
                    break;
            }
        }
    }
}
 
