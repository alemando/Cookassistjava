package controllers;

import java.util.HashMap;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import models.Product;
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
    
}
