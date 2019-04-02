package controllers;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;
import models.Product;
import models.User;

@WebServlet(urlPatterns = {"/orders"})
public class orders extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        String id = request.getParameter("id");
        RequestDispatcher view;
        if (option == null){
            if (id != null){
                //Debo verificar que me manden un numero
                HashMap<Integer,Order> orders = MainServlet.getListOrders(request);
                //verificar que no sea null
                Order o = Order.getOrderbycode(orders, Integer.parseInt(id));
                request.setAttribute("order", o);
                view = request.getRequestDispatcher("selected_order.jsp");
                view.forward(request, response);
            }else{
                view = request.getRequestDispatcher("orders.jsp");
                view.forward(request, response);
            }
        }else{
            if(option.equals("new")){
                view = request.getRequestDispatcher("new_order.jsp");
                view.forward(request, response);
            }else if(option.equals("show")){ 
                 view = request.getRequestDispatcher("orders.jsp");
                 view.forward(request, response);
            }else{
                //error.jsp
                view = request.getRequestDispatcher("orders.jsp");
                view.forward(request, response);
            }
        }
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        String id = request.getParameter("id");
        RequestDispatcher view;
        
        if(option.equals("add")){
            if(id != null){
                String quantity = request.getParameter("quantity");
                HashMap <Integer, Product> products = MainServlet.getListProducts(request);
                Product p = Product.getProductbycode(products, Integer.parseInt(id));
                MainServlet.insertOrderProductTemp(request, p, Integer.parseInt(quantity));
            }
            response.sendRedirect("products");
            
        }else if(option.equals("new")){
            
            //Valores y campos
            User u = MainServlet.getUser(request);
            HashMap<Integer, Object []> listProducts = MainServlet.getListProductTemp(request);
            String description = request.getParameter("description");
            Order o = new Order(0,description, u, listProducts);
            MainServlet.insertOrder(request, o);
            MainServlet.setListProductTemp(request, null);
            response.sendRedirect("orders");
            
        }else if(option.equals("remove")){
            if(id != null){
                HashMap <Integer, Product> products = MainServlet.getListProducts(request);
                Product p = Product.getProductbycode(products, Integer.parseInt(id));
                MainServlet.removeItemListProductTemp(request, p);
            }
            response.sendRedirect("orders?option=new");
            
        }else{
            
            view = request.getRequestDispatcher("products.jsp");
            view.forward(request, response);  
        }
        
          
        
    }

}