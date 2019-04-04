package controllers;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Chef;
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
        User u = MainServlet.getUser(request);
        boolean chef = MainServlet.getChef(request);
        RequestDispatcher view;
        if (option != null){
            if(u != null){
                if(option.equals("new") && !chef){
                    view = request.getRequestDispatcher("new_order.jsp");
                }else if(option.equals("show") && u.getAdmin() && !chef){
                     view = request.getRequestDispatcher("orders.jsp");
                }else if(option.equals("show_orders") && chef){
                    request.setAttribute("ListChefOrders",((Chef) u).getListOrdersChef());
                    view = request.getRequestDispatcher("show_orders.jsp");
                }else if(option.equals("need_chef") &&(u.getAdmin() || chef)){
                    view = request.getRequestDispatcher("order_need_chef.jsp");
                }else if(option.equals("show_bill") && !chef){
                    HashMap <Integer, Order> user_orders = u.getListOrders();
                    request.setAttribute("ListOrdersUser", user_orders);
                    view = request.getRequestDispatcher("my_orders_bill.jsp");
                }else if(option.equals("need_ready")  && u.getAdmin() && !chef){
                    view = request.getRequestDispatcher("order_need_ready.jsp");
                }else if(option.equals("need_bill")  && u.getAdmin() && !chef){
                    view = request.getRequestDispatcher("order_need_bill.jsp");
                }else{
                    view = request.getRequestDispatcher("error.jsp");
                }
            }else{
                view = request.getRequestDispatcher("error.jsp");
                
            }
            view.forward(request, response);
            
        }else{
            if (id != null){
                if(u != null){
                    //Debo verificar que me manden un numero
                    HashMap<Integer,Order> orders = MainServlet.getListOrders(request);
                    //verificar que no sea null
                    Order o = Order.getOrderbycode(orders, Integer.parseInt(id));
                    if(u.getAdmin() || (u.getEmail().equals(o.getUser().getEmail())) || chef){
                        request.setAttribute("order", o);
                        view = request.getRequestDispatcher("selected_order.jsp");
                    }else{
                        view = request.getRequestDispatcher("error.jsp");
                    }
                }else{
                    view = request.getRequestDispatcher("error.jsp");
                }
                view.forward(request, response);
                
            }else{
                if(MainServlet.getChef(request)){
                    response.sendRedirect("orders?option=show_orders");
                }else{
                    if(u != null){
                        HashMap <Integer, Order> user_orders = u.getListOrders();
                        request.setAttribute("ListOrdersUser", user_orders);
                        view = request.getRequestDispatcher("my_orders.jsp");
                    }else{
                         view = request.getRequestDispatcher("error.jsp");
                    }
                    view.forward(request, response);
                    
                }
                
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
            Order o = new Order(0,description, u, listProducts, false);
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
            
        }else if(option.equals("take")){
            HashMap<Integer,Order> orders = MainServlet.getListOrders(request);
            Order o = Order.getOrderbycode(orders, Integer.parseInt(id));
            User u = MainServlet.getUser(request);
            o.setChef((Chef)u);
            response.sendRedirect("orders?option=show_orders");
        }else if(option.equals("status") && (id!=null)){
            HashMap<Integer,Order> orders = MainServlet.getListOrders(request);
            Order o = Order.getOrderbycode(orders, Integer.parseInt(id));
            o.setReady(!o.getReady());
            response.sendRedirect("orders?option=show_orders");
        
        }else{
            
            view = request.getRequestDispatcher("products.jsp");
            view.forward(request, response);  
        }
        
          
        
    }

}