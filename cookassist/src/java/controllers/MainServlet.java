package controllers;

import java.util.HashMap;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    
    public static void setUser(HttpServletRequest request, User u){
        HttpSession session = request.getSession();
        session.setAttribute("user", u);
    }
    
    public static HashMap<String, User> getListUsers(HttpServletRequest request){
        HttpSession session = request.getSession();        
        HashMap<String,User> users = new HashMap<String,User>();
        if(null != session.getAttribute("ListUsers")){
            users = (HashMap<String,User>) session.getAttribute("ListUsers");
        }
        return users;
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
