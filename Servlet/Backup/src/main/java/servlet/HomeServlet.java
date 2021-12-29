package servlet;

import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet", value = "/login")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductService productService = new ProductService();
        RequestDispatcher requestDispatcher;
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit": {
                int index = Integer.parseInt(getInitParameter("loop"));
                request.setAttribute("productFound",productService.findAll().get(index));
                requestDispatcher = request.getRequestDispatcher("edit.jsp");
                requestDispatcher.forward(request, response);
                break;
            }
            case "delete": {
                int id = Integer.parseInt(request.getParameter("id"));
                 productService = new ProductService();
                productService.delete(productService.findIndexById(id));
                requestDispatcher = request.getRequestDispatcher("products.jsp");
                request.setAttribute("products", productService.findAll());
                requestDispatcher.forward(request, response);
                break;
            }
            case "create": {
                requestDispatcher = request.getRequestDispatcher("create.jsp");
                requestDispatcher.forward(request, response);
                break;
            }
            default: {
                requestDispatcher = request.getRequestDispatcher("login.html");
                requestDispatcher.forward(request, response);
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }else {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("productName");
            String img = request.getParameter("img");
            ProductService productService = new ProductService();
            productService.edit(productService.findIndexById(id),new Product(id,name,img));
            request.setAttribute("products",productService.findAll());
            requestDispatcher =request.getRequestDispatcher("products.jsp");
            requestDispatcher.forward(request,response);
        }

        if (username.equals("admin@gmail.com") && password.equals("admin")) {
            requestDispatcher = request.getRequestDispatcher("products.jsp");
            request.setAttribute("products", new ProductService().findAll());
            requestDispatcher.forward(request, response);

        } else {
            requestDispatcher = request.getRequestDispatcher("login.html");
            requestDispatcher.forward(request, response);
        }

    }
}


