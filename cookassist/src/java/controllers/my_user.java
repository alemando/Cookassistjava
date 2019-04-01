package controllers;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

@WebServlet(urlPatterns = {"/my_user"})
public class my_user extends MainServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("my_user.jsp");
        view.forward(request, response);        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        HttpSession session = request.getSession();  
        User u = (User) session.getAttribute("user");
        if(u != null){
            if(option.equals("status")){
                u.setStatus(false);
                response.sendRedirect("");
                MainServlet.setUser(request, null);
                return;
            }else if(option.equals("name")){
                String name = request.getParameter("name");
                u.setName(name);
            }else if(option.equals("password")){
                String old_password = request.getParameter("old_password");
                String new_password = request.getParameter("new_password");
                if(old_password.equals(u.getPassword())){
                    u.setPassword(new_password);
                }
            }
        }
        
        response.sendRedirect("my_user");
    }

}