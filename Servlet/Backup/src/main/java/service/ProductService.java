package service;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
 static    List<Product> products  = new ArrayList<>();
    static {
        products.add(new Product(1,"IphoneX","https://cdn.tgdd.vn/Products/Images/42/114115/iphone-x-64gb-hh-600x600.jpg"));
        products.add(new Product(2,"Iphone12","https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-trang-13-600x600.jpg"));
        products.add(new Product(3,"Iphone13","https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-family-select-2021?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1629842667000"));

    }
   public Product create(int id, String name, String img){
        return new Product(id,name,img);
    }
  public   List<Product> findAll(){
        return products;
    }
   public void add(Product product){
        products.add(product);
    }
    public void delete(int index){
        products.remove(index);
    }
    public void edit(int index,Product product){
        products.set(index,product);
    }
    public int findIndexById(int id){
        for (int i = 0; i < products.size(); i++) {
            if (id==products.get(i).getId()){
                return i;
            }
        }
        return -1;
    }

}
