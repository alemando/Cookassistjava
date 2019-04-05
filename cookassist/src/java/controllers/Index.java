package controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import models.Chef;

/**
 *
 * @author -Daniel
 */
@WebServlet(urlPatterns = {""})
public class Index extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MainServlet.setMessages(request);
        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        view.forward(request, response);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        if (option !=null){
            if (option.equals("chef")){
                Chef c =(Chef) MainServlet.getUser(request);
                if (c.getStatusChef()){
                    if(MainServlet.getChef(request)){
                        MainServlet.setChef(request, false);
                    }else{
                        MainServlet.setChef(request, true);
                    }
                }
            }
            response.sendRedirect("");
        }else{
            MainServlet.setUser(request, null);
            MainServlet.setListProductTemp(request, null);
            MainServlet.setListOrderTemp(request, null);
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
    }

}
