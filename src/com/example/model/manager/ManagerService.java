package com.example.model.manager;
import com.example.model.user.*;
import java.util.*;

public class ManagerService {
    public static ArrayList<User> users;
    public static ArrayList<ProductForSale> products;//list of all products in store
    public static ArrayList<String> productsName;//list of all products name in store
    public static ArrayList<Integer> noOfSolds;//list of all products name in store
    public static ArrayList<ProductForSale> newProducts;//list of new products
    public static ArrayList<ProductForSale> hotProducts;//list of new products
    public static ArrayList<ProductForSale> saleOffProducts;//list of saleOffProducts
    public static int noOfUsers;
    public static int noOfOrders;
    public static Accounting accounting;
    public static ProductForSale importProduct(String image, String description, String name, String category, int quantity, int unitPrice, int initPrice) {
        for(int i = 0; i < ManagerService.products.size(); i++) {
            if(ManagerService.products.get(i).getName().equals(name)) {
                ProductForSale productForSale = new ProductForSale(image, description, name, category, quantity + ManagerService.products.get(i).getQuantity(), unitPrice, initPrice, true, ManagerService.products.get(i).getNoOfSolds(), ManagerService.products.get(i).getCrs());
                ManagerService.products.set(i, productForSale);
                accounting.updateExpense(quantity * initPrice);
                return productForSale;
            }
        }
        ProductForSale productForSale = new ProductForSale(image, description, name, category, quantity, unitPrice, initPrice, true);
        ManagerService.products.add(productForSale);
        ManagerService.productsName.add(productForSale.getName());
        ManagerService.noOfSolds.add(productForSale.getNoOfSolds());
        newProducts.add(productForSale);
        accounting.updateExpense(quantity * initPrice);
        return productForSale;
    }
    public static void addSaleOffProducts(ProductForSale product) {
        saleOffProducts.add(product);
    }
    public static void removeSaleOffProducts(ProductForSale product) {
        saleOffProducts.remove(product);
    }
    public static void clearSaleOffProducts() {
        saleOffProducts.clear();
    }
    public static void addHotOffProducts(ProductForSale product) {
        hotProducts.add(product);
    }
    public static void removeHotProducts(ProductForSale product) {
        hotProducts.remove(product);
    }
    public static void clearHotProducts() {
        hotProducts.clear();
    }
    public static void clearNewProductsList() {
        newProducts.clear();
    }
}