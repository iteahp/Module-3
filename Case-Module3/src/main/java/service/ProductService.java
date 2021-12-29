package service;

import dao.ProductDao;
import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
     ProductDao productDao= new ProductDao();
  static List<Product> productList = new ArrayList<>();

    public ProductService() {
        productList = productDao.getAllProduct();
        System.out.println(productList);
    }

    public  List<Product> getProductList() {
        return productList = productDao.getAllProduct();
    }
    public void deleleProduct(int id){
        productDao.deleteProduct(id);
        productList = productDao.getAllProduct();
    }
    public void addProduct(Product product){
        productDao.saveProduct(product);
        productList = productDao.getAllProduct();
    }
    public void updateProduct(int index,Product product){
       productDao.updateProduct(product);
        productList = productDao.getAllProduct();
    }
    public  int findIndexById(int id){
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId()==id){
                return i;
            }
        }
        return -1;
    }
}

