package com.example.model.user;
import com.example.model.*;
import com.example.model.manager.ManagerService;
import java.util.*;
public class ProductForSale extends Product {
    public ProductForSale() {

    }
    public ProductForSale(ProductForSale product, int size) {
        this.image = product.image;
        this.smallImg1 = product.smallImg1;
        this.smallImg2 = product.smallImg2;
        this.smallImg3 = product.smallImg3;
        this.description = product.description;
        this.name = product.name;
        this.category = product.category;
        this.quantity = product.quantity;
        this.unitPrice = product.unitPrice;
        this.noOfSolds = product.noOfSolds;
        this.saleoff = product.saleoff;
        this.colors = product.colors;
        this.crs = product.crs;
        this.newOrHot = product.newOrHot;
        this.size = size;
    }
    public ProductForSale(String image, String smlImg1, String smlImg2, String smlImg3, String description, String name, String category, int quantity, int unitPrice, boolean newOrHot) {
        this.image = image;
        this.smallImg1 = smlImg1;
        this.smallImg2 = smlImg2;
        this.smallImg3 = smlImg3;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.saleoff = 1.0;
        this.crs = new ArrayList<CustomerReview>();
        this.newOrHot = newOrHot;
    }
    public ProductForSale(String image, String description, String name, String category, int quantity, int unitPrice, boolean newOrHot) {
        this.image = image;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.saleoff = 1.0;
        this.crs = new ArrayList<CustomerReview>();
        this.newOrHot = newOrHot;
    }
    public ProductForSale(String image, String smlImg1, String smlImg2, String smlImg3, String description, String name, String category, int quantity, int unitPrice) {
        this.image = image;
        this.smallImg1 = smlImg1;
        this.smallImg2 = smlImg2;
        this.smallImg3 = smlImg3;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.saleoff = 1.0;
        this.crs = new ArrayList<CustomerReview>();
    }
    public ProductForSale(String image, String description, String name, String category, int quantity, int unitPrice) {
        this.image = image;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.saleoff = 1.0;
        this.crs = new ArrayList<CustomerReview>();
    }
    public ProductForSale(String image, String smlImg1, String smlImg2, String smlImg3, String description, String name, String category, int quantity, int unitPrice, double saleoff) {
        this.image = image;
        this.smallImg1 = smlImg1;
        this.smallImg2 = smlImg2;
        this.smallImg3 = smlImg3;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.saleoff = saleoff;
        this.crs = new ArrayList<CustomerReview>();
    }

    public ProductForSale(String image, String description, String name, String category, int quantity, int unitPrice, double saleoff) {
        this.image = image;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.saleoff = saleoff;
        this.crs = new ArrayList<CustomerReview>();
    }
    
    private int quantity;
    private int unitPrice;
    private ArrayList<CustomerReview> crs;
    private int noOfSolds;
    private double saleoff;
    private boolean newOrHot;//true: new, false: hot
    public int getQuantity() {return quantity;}
    public int getUnitPrice() {return unitPrice;}
    public int getNoOfSolds() {return noOfSolds;}
    public double getSaleoff() {return saleoff;}
    public boolean getNewOrHot() {return newOrHot;}
    public ArrayList<CustomerReview> getCrs() {return crs;}
    // public void setSaleOff(double saleoff) {this.saleoff = saleoff;}
    public void addCustomerReview(int noOfStars, String review, User user) {
        CustomerReview crs = new CustomerReview();
        crs.setReview(review);
        crs.setNoOfStars(noOfStars);
        crs.setFromUser(user.getFullName());
        this.crs.add(crs);
    }
    public void addCustomerReview(String review, User user) {
        CustomerReview crs = new CustomerReview();
        crs.setReview(review);
        crs.setFromUser(user.getFullName());
        this.crs.add(crs);
    }
    public static void updateNoOfSolds(User.CartState cartState) {
        int size = cartState.products.size();
        for(int i = 0; i < size; i++) {
            cartState.products.get(i).noOfSolds += cartState.quantityEachProduct.get(i);
            cartState.products.get(i).quantity -= cartState.quantityEachProduct.get(i);
            for(int j = 0; j < ManagerService.products.size(); j++) {
                if(ManagerService.products.get(j).getName().equals(cartState.products.get(i).getName())) {
                    ManagerService.products.set(j, cartState.products.get(i));
                    break;
                }
            }
        }
    }
    public void updateQuantity(int quantity) {
        this.quantity += quantity;
    }
}