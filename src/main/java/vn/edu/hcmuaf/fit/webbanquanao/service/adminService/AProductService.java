package vn.edu.hcmuaf.fit.webbanquanao.service.adminService;

import vn.edu.hcmuaf.fit.webbanquanao.dao.adminDAO.AProductDao;
import vn.edu.hcmuaf.fit.webbanquanao.model.modelAdmin.AProduct;
import vn.edu.hcmuaf.fit.webbanquanao.model.modelAdmin.AProductDetails;


import java.sql.Date;
import java.util.Map;

public class AProductService {
    AProductDao productDao;

    public AProductService() {
        productDao = new AProductDao();
    }

    public Map<Integer, AProduct> showProduct() {
        return productDao.listProduct;
    }

    public Map<Integer, AProductDetails> showProductDetails(Integer id) {
        if(!productDao.listProduct.containsKey(id)) return null;
        return productDao.getAllProductDetails(id);
    }

    public AProduct getProductById(Integer id) {
        if (!productDao.listProduct.containsKey(id)) return null;
        return productDao.listProduct.get(id);
    }

    public boolean updateProduct(Integer id, AProduct product) {
        if (!productDao.listProduct.containsKey(id)) return false;
        return productDao.update(product, id);
    }

    public boolean updateProductDetails(AProductDetails productDetails, Integer id, Integer productId) {
        if (!productDao.listProduct.containsKey(productId)) return false;
        return productDao.updateProductDetails(productDetails, id, productId);
    }

    public boolean delete(Integer id) {
        if (!productDao.listProduct.containsKey(id)) return false;
        return productDao.delete(id);
    }

    public boolean createProduct(AProduct product) {
        if (productDao.listProduct.containsKey(product.getId())) return false;
        return productDao.create(product);
    }

    public boolean createProductDetails(AProductDetails productDetails) {
        if(!productDao.listProduct.containsKey(productDetails.getProductId())) return false;
        return productDao.createProductDetails(productDetails);
    }

    public static void main(String[] args) {
        AProductService a = new AProductService();
       System.out.println(a.showProductDetails(5));

    }


}
