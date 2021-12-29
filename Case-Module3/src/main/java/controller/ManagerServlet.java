package controller;

import dao.ProductDao;
import model.Product;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/managerProduct")
public class ManagerServlet extends HttpServlet {
    ProductService productService = new ProductService();
    List<Product> productList = productService.getProductList();
    RequestDispatcher requestDispatcher;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "delete": {
                deleteProduct(req,resp);
                break;
            }
            case "update": {
                showUpdateForm(req,resp);
                break;
            }
            default: {
                showProductList(req,resp);
                break;
            }
        }
    }

    private void showUpdateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productList.get(productService.findIndexById(id));
        req.setAttribute("productUpdate",product);
        requestDispatcher = req.getRequestDispatcher("/manager/updateProduct.jsp");
        requestDispatcher.forward(req,resp);
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.deleleProduct(id);
        resp.sendRedirect("/managerProduct");
    }

    private void showProductList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("productList",productService.getProductList());
        requestDispatcher = req.getRequestDispatcher("/manager/managerProduct.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "create": {
                createProduct(req,resp);
                break;
            }
            default: {
                showProductList(req,resp);
                break;
            }
        }
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id;
        if (productList.size()<1){
             id = 1;
        }else {
            id = productList.get(productList.size()-1).getId()+1;
        }
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String description = req.getParameter("description");
        long quantity = Long.parseLong(req.getParameter("quantity"));
        String img = req.getParameter("img");
        Product product = new Product(id,name,price,description,quantity,img);
        productService.addProduct(product);
        resp.sendRedirect("/managerProduct");
    }
}
