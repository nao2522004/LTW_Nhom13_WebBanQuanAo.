package vn.edu.hcmuaf.fit.webbanquanao.service;

import vn.edu.hcmuaf.fit.webbanquanao.dao.ProductDAO;
import vn.edu.hcmuaf.fit.webbanquanao.dao.model.Product;

import java.util.List;

public class ProductService {
    ProductDAO dao = new ProductDAO();

    public List<Product> getListOfProducts() {
        return dao.getListProducts();
    }
}
