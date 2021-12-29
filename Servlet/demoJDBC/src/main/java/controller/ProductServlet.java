package controller;

import model.Product;
import service.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }

            switch (action){
                case "create":{
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("/createProduct.jsp");
                    requestDispatcher.forward(req,resp);
                    break;
                }
                case "edit" :{
                    editProduct(req,resp);
                    break;
                }
                case "delete" : {
                    delete(req,resp);
                    break;
                }
                default: {
                    showProduct(req,resp);
                    break;
                }
            }
        }






    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        try{
            switch (action){
                case "create":{
                    create(req,resp);
                    break;
                }
                case "edit" :{
                    editProduct(req,resp);
                    break;
                }

            }
        }catch (SQLException ex){
            throw new ServletException(ex);
        }


    }
    public void showProduct (HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException {
        ProductDAO productDAO = new ProductDAO();
      List<Product>products = productDAO.selectAllProducts();
        req.setAttribute("products",products);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/product.jsp");
        requestDispatcher.forward(req,resp);
    }

    protected void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
            int id =Integer.parseInt(req.getParameter("id")) ;
            String name = req.getParameter("name");
            float price = Float.parseFloat(req.getParameter("price"));
            Product product = new Product(id,name,price);
            ProductDAO productDAO = new ProductDAO();
            productDAO.insertProduct(product);
            resp.sendRedirect("/product");
    }





}
