package com.example.model.manager;
import com.example.model.user.*;

public class BestSeller {
    public BestSeller(ProductForSale product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
    private ProductForSale product;
    private int quantity;
    public ProductForSale getProduct() {return product;}
    public int getQuantity() {return quantity;}
}