package controllers;

import java.util.HashMap;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import models.Chef;
import models.Order;
import models.Product;
import models.User;
import util.Messages;

public class MainServlet extends HttpServlet  {
    
    public static void setMessages(HttpServletRequest request){
        request.setAttribute("messages", Messages.list_texts);
    }
    
    public static void insertProduct(HttpServletRequest request, Product p){
        HttpSession session = request.getSession();        
        HashMap<Integer,Product> products = new HashMap<Integer,Product>();
        if(null != session.getAttribute("ListProducts")){
            products = (HashMap<Integer,Product>) session.getAttribute("ListProducts");
        }
        products.put(p.getCode(), p);
        session.setAttribute("ListProducts", products);
    }
    
    public static HashMap<Integer, Product> getListProducts(HttpServletRequest request){
        HttpSession session = request.getSession();        
        HashMap<Integer,Product> products = new HashMap<Integer,Product>();
        if(null != session.getAttribute("ListProducts")){
            products = (HashMap<Integer,Product>) session.getAttribute("ListProducts");
        }
        return products;
    }
    
    public static void insertUser(HttpServletRequest request, User u){
        HttpSession session = request.getSession();        
        HashMap<String,User> users = new HashMap<String,User>();
        if(null != session.getAttribute("ListUsers")){
            users = (HashMap<String,User>) session.getAttribute("ListUsers");
        }
        users.put(u.getEmail(), u);
        session.setAttribute("ListUsers", users);
    }
    
    public static void insertChef(HttpServletRequest request, Chef c){
        MainServlet.insertUser(request, c);
        HttpSession session = request.getSession();        
        HashMap<String,Chef> chefs = new HashMap<String,Chef>();
        if(null != session.getAttribute("ListChefs")){
            chefs = (HashMap<String,Chef>) session.getAttribute("ListChefs");
        }
        chefs.put(c.getEmail(), c);
        session.setAttribute("ListChefs", chefs);
    }
    
    public static HashMap<String, Chef> getListChefs(HttpServletRequest request){
        HttpSession session = request.getSession();        
        HashMap<String,Chef> chefs = new HashMap<String,Chef>();
        if(null != session.getAttribute("ListChefs")){
            chefs = (HashMap<String,Chef>) session.getAttribute("ListChefs");
        }
        return chefs;
    }
    
    public static void setUser(HttpServletRequest request, User u){
        HttpSession session = request.getSession();
        session.setAttribute("user", u);
    }
    
    public static void setChef(HttpServletRequest request, boolean status_chef){
        HttpSession session = request.getSession();
        session.setAttribute("chef", status_chef);
    }
    
    public static boolean getChef(HttpServletRequest request){
        HttpSession session = request.getSession();
        return (boolean) session.getAttribute("chef");
    }
    
    public static Boolean userSession(HttpServletRequest request){
        HttpSession session = request.getSession();
        User u =(User) session.getAttribute("user");
        if(u != null){
            return true;
        }
        return false;
    }
    
    public static HashMap<String, User> getListUsers(HttpServletRequest request){
        HttpSession session = request.getSession();        
        HashMap<String,User> users = new HashMap<String,User>();
        if(null != session.getAttribute("ListUsers")){
            users = (HashMap<String,User>) session.getAttribute("ListUsers");
        }
        return users;
    }
    
    public static HashMap<Integer, Order> getListOrders(HttpServletRequest request){
        HttpSession session = request.getSession();        
        HashMap<Integer,Order> orders = new HashMap<Integer,Order>();
        if(null != session.getAttribute("ListOrders")){
            orders = (HashMap<Integer,Order>) session.getAttribute("ListOrders");
        }
        return orders;
    }
    
    public static void insertOrder(HttpServletRequest request, Order o){
        HttpSession session = request.getSession();        
        HashMap<Integer,Order> orders = new HashMap<Integer,Order>();
        if(null != session.getAttribute("ListOrders")){
            orders = (HashMap<Integer,Order>) session.getAttribute("ListOrders");
        }
        orders.put(o.getCode(), o);
        session.setAttribute("ListOrders", orders);
    }
    
    public static User getUser(HttpServletRequest request){
        HttpSession session = request.getSession();        
        User user = (User)session.getAttribute("user");
        return user;
    }
    
    public static HashMap<Integer,Object []> getListProductTemp(HttpServletRequest request){
        HttpSession session = request.getSession();        
        HashMap<Integer,Object []> product_temp = new HashMap<Integer,Object []>();
        if(null != session.getAttribute("ListProductTemp")){
            product_temp = (HashMap<Integer,Object []>) session.getAttribute("ListProductTemp");
        }
        return product_temp;
    }
    
    public static void setListProductTemp(HttpServletRequest request, HashMap<Integer,Object []> products){
        HttpSession session = request.getSession();        
        session.setAttribute("ListProductTemp", products);
    }
    
    public static void removeItemListProductTemp(HttpServletRequest request, Product p){
        HttpSession session = request.getSession();        
        HashMap<Integer,Object []> product_temp = (HashMap<Integer,Object []>) session.getAttribute("ListProductTemp");
        product_temp.remove(p.getCode());
    }
    
    public static void insertOrderProductTemp(HttpServletRequest request, Product p, int quantity){
        HttpSession session = request.getSession();        
        HashMap<Integer,Object []> product_temp = new HashMap<Integer,Object []>();
        if(null != session.getAttribute("ListProductTemp")){
            product_temp = (HashMap<Integer,Object []>) session.getAttribute("ListProductTemp");
        }
        
        Object [] array = new Object[2];
        array[0] = p;
        array [1] = quantity;
        product_temp.put(p.getCode(), array);
        
        session.setAttribute("ListProductTemp", product_temp);
    }
    
    
    
    public static void loadProductCategories(HttpServletRequest request){
        HttpSession session = request.getSession();        
        HashMap<String, String> categories = Product.categories;
        if(null != session.getAttribute("productCategories")){
            categories = (HashMap<String,String>) session.getAttribute("productCategories");
        }
        session.setAttribute("productCategories", categories);
    }
    
}
