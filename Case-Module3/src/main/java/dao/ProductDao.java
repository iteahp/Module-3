package dao;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private  Connection connection = ConnectMySql.getConnection();

    public ProductDao() {
    }

    public  List<Product> getAllProduct() {
        String sqlGetAll = "SELECT * FROM product";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlGetAll);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Product> listProduct = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String img = resultSet.getString("img");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                long quantity = resultSet.getLong("quantity");
//                int categoryId = resultSet.getInt("categoryId");

                listProduct.add(new Product(id, name,  price,description,quantity,img));
            }
            return listProduct;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public  void updateProduct(Product product) {
        String saveSQl = "UPDATE product SET  name = ?, price = ?, quantity = ?, description = ?, img = ? WHERE (id = ?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(saveSQl);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setLong(3,product.getQuantity());
            preparedStatement.setString(4,product.getDescription());
            preparedStatement.setString(5,product.getImg());
            preparedStatement.setInt(6,product.getId());
            preparedStatement.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public  void saveProduct(Product product) {
        String saveSQl = "INSERT INTO product VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(saveSQl);
            preparedStatement.setInt(1,product.getId());
            preparedStatement.setString(2,product.getName());
            preparedStatement.setDouble(3,product.getPrice());
            preparedStatement.setLong(4,product.getQuantity());
            preparedStatement.setString(5,product.getDescription());
            preparedStatement.setString(6,product.getImg());
            preparedStatement.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public  void deleteProduct(int id){
        String deleteSQL = "DELETE from product where id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setInt(1,id);
            preparedStatement.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
