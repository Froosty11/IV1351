package model;

public class InstrumentItem {  
    private String serial_number;
    private int price;
    private String description; 
    private int lease_id;
    private String brand;
    private boolean isAvailable;

    public InstrumentItem(String serial, int cost, String brand){
        this.serial_number = serial;
        this.price = cost;
        //this.description = description;
        //this.lease_id = lease;
        this.brand = brand;
        //this.isAvailable = isAval;
    }
    //Automatically generated getters. 
    public String getBrand() {
        return brand;
    }
    public String getDescription() {
        return description;
    }
    public int getLease_id() {
        return lease_id;
    }
    public int getPrice() {
        return price;
    }
    public String getSerial_number() {
        return serial_number;
    }
    public boolean getAvaliable(){
        return isAvailable;
    }
    @Override
    public String toString() {
        // TODO Auto-generated method stub
        StringBuilder str = new StringBuilder();
        str.append('[');
        str.append(serial_number);
        str.append(" | ");
        str.append(price);
        str.append(" kr | ");
        str.append(brand);
        str.append(']');
        return str.toString();

    }

}