package com.example.model.user;
import java.util.*;
import java.time.*;
public class InfoDelivery {
    public InfoDelivery() {}
    public InfoDelivery(String fullName, String phoneNums, String address, String email, String note, ArrayList<ProductForSale> products, ArrayList<Integer> quantityEachProduct, int totalCost) {
        this.fullName = fullName;
        this.phoneNums = phoneNums;
        this.address= address;
        this.email = email;
        this.note = note;
        this.totalCost = totalCost;
        this.products = new ArrayList<ProductForSale>(products);
        this.quantityEachProduct = new ArrayList<Integer>(quantityEachProduct);
        this.orderDate = LocalTime.now().getHour()+ ":" + LocalTime.now().getMinute() + ":" + LocalTime.now().getSecond() + " " + LocalDate.now().toString();
    }
    private String fullName;
    private String phoneNums;
    private String address;
    private String email;
    private String note;
    private String orderDate;
    public ArrayList<ProductForSale> products;
    public ArrayList<Integer> quantityEachProduct;
    public int totalCost;
    public String getFullName() {
        return fullName;
    }
    public String getPhoneNums() {
        return phoneNums;
    }
    public String getAddress() {
        return address;
    }
    public String getEmail() {
        return email;
    }
    public String getNote() {
        return note;
    }
    public String getOrderDate() {
        return orderDate;
    }
}