import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "tinhtylechietkhau", value = "/form")
public class tinhtylechietkhau extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mota = request.getParameter("mota");
        float gia = Float.parseFloat(request.getParameter("gianiemyet"));
        float tyle = Float.parseFloat(request.getParameter("tylechietkhau"));
        float luongchietkhau = gia*tyle*0.01f;
        float discountPrice = gia-luongchietkhau;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Mô tả : "+mota+"<h1><br>");
        writer.println("<h1>Tỷ lệ chiết khấu : "+tyle*0.01f +"<h1><br>");
        writer.println("<h1>Giá sau khi chiết khấu : " +discountPrice+"<h1>");
        writer.println("<html>");
    }
}
