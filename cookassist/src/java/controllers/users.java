package controllers;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Chef;
import models.User;

@WebServlet(urlPatterns = {"/users"})
public class users extends MainServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u = MainServlet.getUser(request);
        RequestDispatcher view;
        if(u != null){
            if(u.getAdmin()){
                view = request.getRequestDispatcher("users.jsp");
            }else{
                view = request.getRequestDispatcher("error.jsp");
            }
        }else{
            view = request.getRequestDispatcher("error.jsp");
        }
        
        view.forward(request, response);        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        String email = request.getParameter("email");
        HashMap <String, User> ListUsers = MainServlet.getListUsers(request);
        User u = User.getUserbyEmail(ListUsers, email);
        
        if(u != null){
            if(option.equals("status")){
                u.setStatus(!u.getStatus());
                if(u instanceof Chef){
                    ((Chef) u).setStatusChef(false);
                }
            }else if(option.equals("type")){
                u.setAdmin(!u.getAdmin());
            }
        }
        
        response.sendRedirect("users");
    }

}