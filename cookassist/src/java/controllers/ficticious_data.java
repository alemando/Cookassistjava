package controllers;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;

@WebServlet(urlPatterns = {"/ficticious_data"})
public class ficticious_data extends MainServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MainServlet.insertProduct(request,new Product(0, "Arroz con pollo", "Arroz con trocitos de pollo, con zanahoria y avichuelas", 9500, "3", "img/id-1.jpg", true));
        MainServlet.insertProduct(request,new Product(0, "Arroz con leche", "Arroz cocinado con dulce y servido con queso", 6000, "3", "img/id-2.jpg", true));
        MainServlet.insertProduct(request,new Product(0, "Jugo de fresa", "Jugo de fresa natural en agua o en leche", 4000, "1", "img/id-3.jpg", true));
        MainServlet.insertProduct(request,new Product(0, "Café", "Delicioso café colombiano", 3000, "1", "img/id-4.jpg", true));
        MainServlet.insertProduct(request,new Product(0, "Sopa de pollo", "Sopa de pollo, con verduras", 8000, "3", "img/id-5.jpg", true));
        MainServlet.insertProduct(request,new Product(0, "Papitas fritas", "Papitas a la francesa", 5000, "3", "img/id-6.jpg", true));
        
        response.sendRedirect("");
    }
    

}