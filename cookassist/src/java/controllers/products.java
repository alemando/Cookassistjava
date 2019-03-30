package controllers;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.Product;


@MultipartConfig
@WebServlet(urlPatterns = {"/products"})
public class products extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        RequestDispatcher view;
        if (option == null){
            view = request.getRequestDispatcher("products.jsp");
        }else{
            if(option.equals("new")){
                 view = request.getRequestDispatcher("new_product.jsp");
            }else if(option.equals("show")){
                HttpSession session = request.getSession();        
                List<Product> products = new ArrayList<Product>();
                if(null != session.getAttribute("Products")){
                    products=(ArrayList<Product>) session.getAttribute("Products");
                }
                //request.setAttribute("products", products);     
                 view = request.getRequestDispatcher("show_products.jsp");
            }
            else{
                //error.jsp
                view = request.getRequestDispatcher("products.jsp");
            }
        }
        view.forward(request, response);      
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        RequestDispatcher view;
        
        HttpSession session = request.getSession();        
        List<Product> products = new ArrayList<Product>();
        if(null != session.getAttribute("Products")){
            products = (ArrayList<Product>) session.getAttribute("Products");
        }
            
        if(option.equals("new")){
            
            //Valores y campos
            int id = (Product.cons + 1);
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            int price = Integer.parseInt(request.getParameter("price"));
            Part image = request.getPart("image");
            
            //Url archivo
            
            String applicationPath = getServletContext().getRealPath("");
            String projectPath = applicationPath.substring(0, applicationPath.length()-10);
            
            String uploadPath = projectPath + "/web/img";
            String archive = image.getSubmittedFileName();
            int aux_point = archive.lastIndexOf(".");
            String ext = archive.substring(aux_point, archive.length());
            String image_url = uploadPath+"/id-"+id+ext;
            
            
            //Verifico la carpeta de guardado de las imagenes
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            
            //Validar aca
            try {
                image.write(image_url);
                Product p = new Product(0, name, description, price, category, image_url, true);
                System.out.println("funciono");
                products.add(p);
            } catch (IOException ioObj) {
                System.out.println(ioObj);
                System.out.println("Ocurrio un problema");
            }
            
            
            view = request.getRequestDispatcher("new_product.jsp");
            
        }else{
            view = request.getRequestDispatcher("products.jsp");
        }
        session.setAttribute("Products", products); 
        view.forward(request, response);    
        
      
    }

}
