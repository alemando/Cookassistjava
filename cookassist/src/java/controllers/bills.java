package controllers;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Bill;
import models.Order;
import models.User;

@WebServlet(urlPatterns = {"/bills"})
public class bills extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        String id = request.getParameter("id");
        User u = MainServlet.getUser(request);
        boolean chef = MainServlet.getChef(request);
        RequestDispatcher view;
        if(option != null){
            if(u!=null){
                if(u.getAdmin() && !chef){
                    if(option.equals("new")){
                    view = request.getRequestDispatcher("new_bill.jsp");
                    }else if(option.equals("show")){
                        view = request.getRequestDispatcher("bills.jsp");
                    }else{
                        view = request.getRequestDispatcher("error.jsp");
                    }
                }else{
                    view = request.getRequestDispatcher("error.jsp");
                }
            }else{
                view = request.getRequestDispatcher("error.jsp");
            }
        }else{
            if(u!=null){
                if (id != null){
                    //Debo verificar que me manden un numero
                    HashMap<Integer,Bill> bills = MainServlet.getListBills(request);
                    //verificar que no sea null
                    Bill bill = Bill.getBillbycode(bills, Integer.parseInt(id));

                    request.setAttribute("bill", bill);
                    view = request.getRequestDispatcher("selected_bill.jsp");
                    
                }else{
                    view = request.getRequestDispatcher("my_bills.jsp");
                }
            }else{
                view = request.getRequestDispatcher("error.jsp");
            }
            
        }
        view.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        String id = request.getParameter("id");
        RequestDispatcher view;
        
        if(option.equals("add")){
            if(id != null){
                HashMap <Integer, Order> orders = MainServlet.getListOrders(request);
                Order o = Order.getOrderbycode(orders, Integer.parseInt(id));
                MainServlet.insertOrderOrderTemp(request, o);
            }
            response.sendRedirect("bills?option=new");
            
        }else if(option.equals("new")){
            
            //Valores y campos
            HashMap<String, User> ListUsers = MainServlet.getListUsers(request);
            String email_user = request.getParameter("user");
            User u = User.getUserbyEmail(ListUsers, email_user);
            HashMap<Integer, Order> ListOrders = MainServlet.getListOrderTemp(request);
            Bill b = new Bill(0, u, ListOrders);
            MainServlet.insertBill(request, b);
            MainServlet.setListOrderTemp(request, null);
            response.sendRedirect("bills?option=show");
            
        }else if(option.equals("remove")){
            if(id != null){
                HashMap <Integer, Order> orders = MainServlet.getListOrders(request);
                Order o = Order.getOrderbycode(orders, Integer.parseInt(id));
                MainServlet.removeItemListOrderTemp(request, o);
            }
            response.sendRedirect("bills?option=new");
            
        }else{
            view = request.getRequestDispatcher("orders.jsp");
            view.forward(request, response);  
        }
        
          
        
    }
}