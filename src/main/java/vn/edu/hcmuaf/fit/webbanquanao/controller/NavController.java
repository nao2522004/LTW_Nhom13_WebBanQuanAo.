package vn.edu.hcmuaf.fit.webbanquanao.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.webbanquanao.model.Product;
import vn.edu.hcmuaf.fit.webbanquanao.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NavController", value = "/navController")
public class NavController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        List<Product> products = (List<Product>) request.getAttribute("allProducts");

        if(products == null) {
            ProductService productService = new ProductService();
            products = productService.getProductsByCategory(category);
        }

        request.setAttribute("allProducts", products);
        String page = "/".concat(category.toLowerCase()).concat(".jsp");
        request.getRequestDispatcher(page).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}