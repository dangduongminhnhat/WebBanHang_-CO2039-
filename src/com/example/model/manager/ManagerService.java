package com.example.model.manager;
import com.example.model.*;
import com.example.model.user.*;
import java.util.*;
public class ManagerService extends Service {
    public static ArrayList<User> users;
    public static int noOfUsers;
    public static ArrayList<Provider> providers;
    public static Accounting accounting;
    public ArrayList<Provider> getListProviders() {return providers;}
    public static void importProduct(Provider provider, int quantity) {
        if(!providers.contains(provider)) {
            ProductFromProvider product = provider.getProduct();
            ProductForSale productForSale = new ProductForSale(product.getImage(),
                                                                product.getDescription(),
                                                                product.getName(),
                                                                product.getCategory(),
                                                                quantity,
                                                                product.getInitPrice());
            providers.add(provider);
            products.add(productForSale);
            newProducts.add(productForSale);
        }
        else products.get(providers.indexOf(provider)).updateQuantity(quantity);
        accounting.updateExpense(quantity * provider.getProduct().getInitPrice());
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
    public static void clearNewProductsList() {
        newProducts.clear();
    }
}