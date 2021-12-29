package servlet;

import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/create")
public class CreateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        create(request,response);
    }
    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        String img = request.getParameter("img");
        ProductService productService = new ProductService();
        productService.add(productService.create(id,name,img));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("products.jsp");
        request.setAttribute("products",new ProductService().findAll());
        requestDispatcher.forward(request, response);
    }
}

