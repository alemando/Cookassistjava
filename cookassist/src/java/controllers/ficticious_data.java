package controllers;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Product;

@WebServlet(urlPatterns = {"/ficticious_data"})
public class ficticious_data extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();        
        List<Product> products = new ArrayList<Product>();
        if(null != session.getAttribute("Products")){
            products = (ArrayList<Product>) session.getAttribute("Products");
        }
        Product p = new Product(0, "Arroz", "Algo....", 12000, "1", "url", true);
        Product p1 = new Product(0, "Leche", "Algo....", 12000, "1", "url", true);
        products.add(p);
        products.add(p1);
        session.setAttribute("Products", products);
        response.sendRedirect("/");
    }
    

}