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
import models.User;

@WebServlet(urlPatterns = {"/chefs"})
public class chefs extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        RequestDispatcher view;
        if (option != null){
            if(option.equals("new")){
                view = request.getRequestDispatcher("new_chef.jsp");
            }else{
                view = request.getRequestDispatcher("chefs.jsp");
            }
            
        }else{
            view = request.getRequestDispatcher("chefs.jsp");
        }
        
        view.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        RequestDispatcher view;
        if (option != null){
            if(option.equals("new")){
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                Chef c = new Chef(false, name, email, password, true, true);
                MainServlet.insertChef(request, c);
                response.sendRedirect("chefs");
            }else if(option.equals("status")){
                String email = request.getParameter("email");
                HashMap <String, User> ListUsers = MainServlet.getListUsers(request);
                Chef u =(Chef) User.getUserbyEmail(ListUsers, email);
                if(u != null){
                    if(option.equals("status")){
                        u.setStatusChef(!u.getStatusChef());
                    }
                }
                response.sendRedirect("chefs");
            }else{
                view = request.getRequestDispatcher("chefs.jsp");
                view.forward(request, response);
            }
            
        }else{
            view = request.getRequestDispatcher("chefs.jsp");
            view.forward(request, response);
        }
        
        
        //validar datos recuerde mensajes tanto de confirmacion como de todo el programa
        
    }

}