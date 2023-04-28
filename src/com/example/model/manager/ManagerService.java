package com.example.model.manager;
import com.example.model.Product;
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
            if(ManagerService.products.get(i).getImage().equals(image)) {
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
        ManagerService.newProducts.add(productForSale);
        accounting.updateExpense(quantity * initPrice);
        return productForSale;
    }
    public static void removeProduct(ProductForSale product) {
        for(int i = 0; i < ManagerService.products.size(); i++) {
            if(product.getImage().equals(ManagerService.products.get(i).getImage())) {
                if(product.getSaleoff() < 1.0) {
                    for(int j = 0; j < ManagerService.saleOffProducts.size(); j++) {
                        if(ManagerService.saleOffProducts.get(j).getImage().equals(product.getImage())) {
                            ManagerService.saleOffProducts.remove(j);
                            break;
                        }
                    }
                }
                else if(product.getNewOrHot() == true) {
                    for(int j = 0; j < ManagerService.newProducts.size(); j++) {
                        if(ManagerService.newProducts.get(j).getImage().equals(product.getImage())) {
                            ManagerService.newProducts.remove(j);
                            break;
                        }
                    }
                }
                else {
                    for(int j = 0; j < ManagerService.hotProducts.size(); j++) {
                        if(ManagerService.hotProducts.get(j).getImage().equals(product.getImage())) {
                            ManagerService.hotProducts.remove(j);
                            break;
                        }
                    }
                } 
                ManagerService.products.remove(i);
                ManagerService.productsName.remove(i);
            }
        }
    }
    public static void updateProduct(String image, String description, String name, String category, int quantity, int unitPrice, int initPrice) {
        for(int i = 0; i < ManagerService.products.size(); i++) {
            if(image.equals(ManagerService.products.get(i).getImage())) {
                ProductForSale product = null;
                if(ManagerService.products.get(i).getSaleoff() < 1.0) {
                    product = new ProductForSale(image, description, name, category, quantity, unitPrice, initPrice, ManagerService.products.get(i).getSaleoff(), ManagerService.products.get(i).getNoOfSolds(), ManagerService.products.get(i).getCrs());
                    for(int j = 0; j < ManagerService.saleOffProducts.size(); j++) {
                        if(ManagerService.saleOffProducts.get(j).getImage().equals(product.getImage())) {
                            ManagerService.saleOffProducts.set(j, product);
                            break;
                        }
                    }
                }
                else if(ManagerService.products.get(i).getNewOrHot() == true) {
                    product = new ProductForSale(image, description, name, category, quantity, unitPrice, initPrice, true, ManagerService.products.get(i).getNoOfSolds(), ManagerService.products.get(i).getCrs());
                    for(int j = 0; j < ManagerService.newProducts.size(); j++) {
                        if(ManagerService.newProducts.get(j).getImage().equals(product.getImage())) {
                            ManagerService.newProducts.set(j, product);
                            break;
                        }
                    }
                }
                else {
                    product = new ProductForSale(image, description, name, category, quantity, unitPrice, initPrice, ManagerService.products.get(i).getNoOfSolds(), ManagerService.products.get(i).getCrs());
                    for(int j = 0; j < ManagerService.hotProducts.size(); j++) {
                        if(ManagerService.hotProducts.get(j).getImage().equals(product.getImage())) {
                            ManagerService.newProducts.set(j, product);
                            break;
                        }
                    }
                }
                ManagerService.products.set(i, product);
                ManagerService.productsName.set(i, name);
                return ;
            }
        }
    }
}