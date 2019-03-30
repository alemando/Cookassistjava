package models;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Chef extends User {
    private boolean status_chef;
    private Order order_chef;
    private  List<Rating> ListRatingsChef = new ArrayList<Rating>(){};
    private  List<Order> ListOrdersChef = new ArrayList<Order>(){};

    
    Chef(String type_user, String name, String email, Date born_date, boolean status){
        super(type_user, name, email, born_date, status);
    }
    
    public boolean getStatus_chef() {
        return status_chef;
    }

    public void setStatus_chef(boolean status_chef) {
        this.status_chef = status_chef;
    }

    public Order getOrder_chef() {
        return order_chef;
    }

    public void setOrder_chef(Order order_chef) {
        this.order_chef = order_chef;
    }

    public List<Rating> getListRatingsChef() {
        return ListRatingsChef;
    }

    public void setListRatingsChef(List<Rating> ListRatingsChef) {
        this.ListRatingsChef = ListRatingsChef;
    }
    
    public void setRatingChef(Rating rating) {
        this.ListRatingsChef.add(rating);
    }

    public List<Order> getListOrdersChef() {
        return ListOrdersChef;
    }

    public void setListOrdersChef(List<Order> ListOrdersChef) {
        this.ListOrdersChef = ListOrdersChef;
    }
    
    public void setOrderChef(Order order) {
        this.ListOrdersChef.add(order);
    }
    
}
