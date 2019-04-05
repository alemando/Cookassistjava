package controllers;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Bill;
import models.Chef;
import models.Order;
import models.Product;
import models.User;

@WebServlet(urlPatterns = {"/ficticious_data"})
public class ficticious_data extends MainServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String app_path = getServletContext().getRealPath("");
            String  product_path= app_path.substring(0, app_path.length()-10) + "/products.txt";
            FileReader fr = new FileReader(product_path);
            BufferedReader br = new BufferedReader(fr);
            String line;
            int lines = 0;
            while((line = br.readLine()) != null){
                 lines++;
                String [] product = line.split(";");
                MainServlet.insertProduct(request,new Product(Integer.parseInt(product[0]), product[1], product[2], Integer.parseInt(product[3]), product[4], product[5], Boolean.parseBoolean(product[6])));
            }
            br.close();
        }catch(IOException e){
            System.out.println("Error al leer");
        }
        
        //Productos recordar una clase con datos desde txt (Datos manuales por si ocurre algun problema con el txt)
        /*MainServlet.insertProduct(request,new Product(1, "Arroz con pollo", "Arroz con trocitos de pollo, con zanahoria y avichuelas", 9500, "3", "img/id-1.jpg", true));
        MainServlet.insertProduct(request,new Product(2, "Arroz con leche", "Arroz cocinado con dulce y servido con queso", 6000, "3", "img/id-2.jpg", true));
        MainServlet.insertProduct(request,new Product(3, "Jugo de fresa", "Jugo de fresa natural en agua o en leche", 4000, "1", "img/id-3.jpg", true));
        MainServlet.insertProduct(request,new Product(4, "Café", "Delicioso café colombiano", 3000, "1", "img/id-4.jpg", true));
        MainServlet.insertProduct(request,new Product(5, "Sopa de pollo", "Sopa de pollo, con verduras", 8000, "3", "img/id-5.jpg", true));
        MainServlet.insertProduct(request,new Product(6, "Papitas fritas", "Papitas a la francesa", 5000, "3", "img/id-6.jpg", true));
        MainServlet.insertProduct(request,new Product(7, "Pepino", "Delicioso, suculento pepino", 0, "3", "img/id-7.jpg", true));*/
        
        //Usuarios
        User u1 = new User(true, "Alejandro", "a@p.com", "12345", true);
        User u2 = new User(true, "Santiago", "s@p.com", "12345", true);
        User u3 = new User(false, "Daniel", "d@p.com", "12345", true);
        
        //chefs
        Chef u4 = new Chef(true, "Ricardo", "r@p.com", "12345", true, true);
        Chef u5 = new Chef(false, "Mariana", "m@p.com", "12345", true, true);
        
        MainServlet.insertUser(request,u1);
        MainServlet.insertUser(request,u2);
        MainServlet.insertUser(request,u3);
        MainServlet.insertChef(request,u4);
        MainServlet.insertChef(request,u5);
        
        //Pedidos
        HashMap<Integer,Product> ListProducts = MainServlet.getListProducts(request);
        Product arroz_pollo = Product.getProductbycode(ListProducts, 1);
        Product arroz_leche = Product.getProductbycode(ListProducts, 2);
        Product jugo_fresa = Product.getProductbycode(ListProducts, 3);
        Product cafe = Product.getProductbycode(ListProducts, 4);
        Product sopa_pollo = Product.getProductbycode(ListProducts, 5);
        Product papas = Product.getProductbycode(ListProducts, 6);
        Product pepino = Product.getProductbycode(ListProducts, 7);
        
        HashMap<Integer,Object []> ListProducts1 = new HashMap<Integer, Object[]>(){{
            put(arroz_pollo.getCode(), new Object[]{arroz_pollo, 4});
            put(jugo_fresa.getCode(), new Object[]{jugo_fresa, 2});
            put(pepino.getCode(), new Object[]{pepino, 1});
        }};
        
        HashMap<Integer,Object []> ListProducts2 = new HashMap<Integer, Object[]>(){{
            put(arroz_leche.getCode(), new Object[]{arroz_pollo, 2});
            put(sopa_pollo.getCode(), new Object[]{sopa_pollo, 2});
            put(jugo_fresa.getCode(), new Object[]{jugo_fresa, 1});
            put(cafe.getCode(), new Object[]{cafe, 1});
        }};
        
        HashMap<Integer,Object []> ListProducts3 = new HashMap<Integer, Object[]>(){{
            put(arroz_leche.getCode(), new Object[]{arroz_pollo, 2});
            put(papas.getCode(), new Object[]{sopa_pollo, 4});
            put(jugo_fresa.getCode(), new Object[]{jugo_fresa, 4});
            put(cafe.getCode(), new Object[]{cafe, 6});
        }};
        
        
        Order o1 = new Order(0, "Delicioso", u1, ListProducts1, false );
        Order o2 = new Order(0, "Delicioso", u1, ListProducts2, false );
        Order o3 = new Order(0, "Delicioso", u1, ListProducts3, false );
        Order o4 = new Order(0, "Delicioso", u2, ListProducts1, false );
        Order o5 = new Order(0, "Delicioso", u2, ListProducts2, false );
        Order o6 = new Order(0, "Delicioso", u2, ListProducts3, false );
        Order o7 = new Order(0, "Delicioso", u3, ListProducts1, false );
        Order o8 = new Order(0, "Delicioso", u3, ListProducts2, false );
        Order o9 = new Order(0, "Delicioso", u3, ListProducts3, false );
        Order o10 = new Order(0, "Delicioso", u4, ListProducts1, false );
        Order o11 = new Order(0, "Delicioso", u5, ListProducts2, false );
        Order o12 = new Order(0, "Delicioso", u5, ListProducts3, false );
        
        MainServlet.insertOrder(request,o1);
        MainServlet.insertOrder(request,o2);
        MainServlet.insertOrder(request,o3);
        
        MainServlet.insertOrder(request,o4);
        MainServlet.insertOrder(request,o5);
        MainServlet.insertOrder(request,o6);
        
        MainServlet.insertOrder(request,o7);
        MainServlet.insertOrder(request,o8);
        MainServlet.insertOrder(request,o9);
        
        MainServlet.insertOrder(request,o10);
        MainServlet.insertOrder(request,o11);
        MainServlet.insertOrder(request,o12);
        
        o2.setChef(u4);
        o11.setChef(u4);
        
        o9.setChef(u5);
        o9.setReady(true);
        
        o5.setChef(u5);
        o5.setReady(true);
        
        o6.setChef(u4);
        o6.setReady(true);
        
        o1.setChef(u5);
        o1.setReady(true);
        
        o4.setChef(u4);
        o4.setReady(true);
       
        o12.setChef(u5);
        o12.setReady(true);
        
        //Facturas
        HashMap<Integer,Order> ListOrders1 = new HashMap<Integer, Order>(){{
            put(o12.getCode(), o12);
        }};
        HashMap<Integer,Order> ListOrders2 = new HashMap<Integer, Order>(){{
            put(o12.getCode(), o1);
            put(o12.getCode(), o5);
        }};
        MainServlet.insertBill(request, new Bill(0, u1, ListOrders1));
        MainServlet.insertBill(request, new Bill(0, u4, ListOrders2));
        
        response.sendRedirect("");
    }
    

}