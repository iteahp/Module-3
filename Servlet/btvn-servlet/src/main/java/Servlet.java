import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet", urlPatterns = "/demo")

public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewService newService = new NewService();
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        RequestDispatcher requestDispatcher;

        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
       switch (action){
           case "1" :{
               System.out.println(" chay vao day");
               requestDispatcher = request.getRequestDispatcher("chuyendaigia.html");
               requestDispatcher.forward(request,response);
               break;
           }
           case "2" :{
               requestDispatcher = request.getRequestDispatcher("giavang.html");
               requestDispatcher.forward(request,response);
               break;
           }
           case "3" :{
               requestDispatcher = request.getRequestDispatcher("sotdat.html");
               requestDispatcher.forward(request,response);
               break;
           }
           default:{
               requestDispatcher = request.getRequestDispatcher("home.jsp");
               request.setAttribute("news",newService.findAll());
               requestDispatcher.forward(request,response);
               break;
           }
       }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
