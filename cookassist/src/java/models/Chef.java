package models;
import java.util.HashMap;

public class Chef extends User {
    private boolean status_chef;
    private HashMap<Integer,Order> ListOrdersChef = new HashMap<Integer,Order>();

    
    public Chef(boolean admin, String name, String email,String password ,boolean status, boolean status_chef){
        super(admin, name, email, password, status);
        this.status_chef = status_chef;
    }
    
    public boolean getStatusChef() {
        return status_chef;
    }

    public void setStatusChef(boolean status_chef) {
        this.status_chef = status_chef;
    }

    public HashMap<Integer,Order> getListOrdersChef() {
        return ListOrdersChef;
    }

    public void setListOrdersChef(HashMap<Integer,Order> ListOrders) {
        this.ListOrdersChef = ListOrders;
    }
    
    public void setOrderChef(Order order) {
        this.ListOrdersChef.put(order.getCode(), order);
    }
    
}
