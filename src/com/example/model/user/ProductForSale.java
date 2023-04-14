package com.example.model.user;
import com.example.model.*;

import java.security.Timestamp;
import java.util.*;
public class ProductForSale extends Product {
    public ProductForSale() {}
    public ProductForSale(String image, String description, String name, String category, int quantity, int unitPrice) {
        this.image = image;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        saleoff = 1.0;
    }
    public ProductForSale(String image, String description, String name, String category, int quantity, int unitPrice, double saleoff) {
        this.image = image;
        this.description = description;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.saleoff = saleoff;
    }
    public class CustomerReview {
        public CustomerReview(int noOfStarts, String review) {
            this.noOfStars = noOfStarts;
            this.review = review;
        }
        private int noOfStars;
        private String review;
        public int getNoOfStarts() {return noOfStars;}
        public String getReview() {return review;}
    }
    private int quantity;
    private int unitPrice;
    private ArrayList<CustomerReview> crs;
    private int noOfSolds;
    private double saleoff;
    public int getQuantity() {return quantity;}
    public int getUnitPrice() {return unitPrice;}
    public int getNoOfSolds() {return noOfSolds;}
    public double getSaleoff() {return saleoff;}
    // public void setSaleOff(double saleoff) {this.saleoff = saleoff;}
    public ArrayList<CustomerReview> getReviews() {return crs;}
    public void addCustomerReview(int noOfStars, String review) {
        this.crs.add(new CustomerReview(noOfStars, review));
    }
    public static void updateNoOfSolds(User.CartState cartState) {
        int size = cartState.products.size();
        for(int i = 0; i < size; i++) {
            cartState.products.get(i).noOfSolds += cartState.quantityEachProduct.get(i);
            cartState.products.get(i).quantity -= cartState.quantityEachProduct.get(i);
        }
    }
    public void updateQuantity(int quantity) {
        this.quantity += quantity;
    }
}