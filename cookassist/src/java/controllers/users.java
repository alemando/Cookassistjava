package controllers;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

@WebServlet(urlPatterns = {"/users"})
public class users extends MainServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("users.jsp");
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
            }else if(option.equals("type")){
                if (u.getTypeUser().equals("0")) {
                    u.setTypeUser("1");
                }else{
                    u.setTypeUser("0");
                }
            }
        }
        
        response.sendRedirect("users");
    }

}