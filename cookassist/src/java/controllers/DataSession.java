package controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author -Daniel
 */
@WebServlet(urlPatterns = {"/DataSession"})
public class DataSession extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        
        HttpSession session = request.getSession();        
        List<Product> products = new ArrayList<Product>();        
        if(null != session.getAttribute("Products")){
            products=(ArrayList<Product>) session.getAttribute("Products");
        }
        
        request.setAttribute("products", products);        
        RequestDispatcher view = request.getRequestDispatcher("datasession.jsp");
        view.forward(request, response);        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        
        HttpSession session = request.getSession();        
        List<Product> products = new ArrayList<Product>();
        if(null != session.getAttribute("Products")){
            products=(ArrayList<Product>) session.getAttribute("Products");
        }
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price")); 
        //Product p = new Product(id,name,price);
        //products.add(p);
        
        session.setAttribute("Products", products);
        request.setAttribute("products", products);        
        RequestDispatcher view = request.getRequestDispatcher("datasession.jsp");
        view.forward(request, response);
    }

}
