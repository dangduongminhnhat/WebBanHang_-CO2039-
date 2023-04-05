package com.example.model.user;
import com.example.model.manager.*;
import java.io.*;
import java.util.*;

public class User {
    public User(String fullName, String phoneNums, String userId, String password) {
        this.fullName = fullName;
        this.phoneNums = phoneNums;
        this.userId = userId;
        this.password = password;
    }
    class BankAccount {
        private int balance;
        public int getBalance() {return balance;}
        public boolean pay(int money) {
            return balance - money > 0;
        }
        public void deposit(int money) {
            balance += money;
        }
    }
    public class CartState {
        /*Product number 1 have quantity is value at index of quantityEachProduct*/
        public ArrayList<ProductForSale> products;
        public ArrayList<Integer> quantityEachProduct;
        public int totalCost;
    }
    public class BuyingHistory {
        /*Product number 1 have quantity is value at index of quantityEachProduct*/
        public ArrayList<ProductForSale> products;
        public ArrayList<Integer> quantityEachProduct;
        public int totalCost;
    }
    public class OrderState {
        /*Product number 1 have quantity is value at index of quantityEachProduct*/
        public ArrayList<ProductForSale> products;
        public ArrayList<Integer> quantityEachProduct;
        public String state;    
    }
    private boolean logInState;
    private String fullName;
    private String userId;
    private String password;
    private String phoneNums;
    private BankAccount bankAcc;
    private BuyingHistory buyingHistory;
    private OrderState orderState;
    private CartState cartState; 
    
    public void setActiveLoginState() {logInState = true;}
    public void logout() {logInState = false;}
    
    public CartState getCartState() {return cartState;}
    public OrderState getOrderState() {return orderState;}
    public BuyingHistory getbuyingHistory() {return buyingHistory;}
    public String getFullName() {return fullName;}
    public String getPhoneNums() {return phoneNums;}
    public String getUserId() {return userId;}
    public String getPassword() {return password;}
    public boolean getLogInState() {return logInState;}
    public void addToCart(ProductForSale product, int quantity) {
        /*update products and quantity of each product in cartState*/
        cartState.products.add(product);
        cartState.quantityEachProduct.add(quantity);
        cartState.totalCost += product.getUnitPrice() * quantity;
    }
    public void removeFromCart(ProductForSale product, int quantity) {
        /*update products and quantity of each product in cartState*/
        cartState.products.remove(product);
        cartState.quantityEachProduct.remove(quantity);
        cartState.totalCost -= product.getUnitPrice() * quantity;
    }
    public void clearCart() {
        //clear all products and quantity of each product in cartState
        cartState.products.clear();
        cartState.quantityEachProduct.clear();
        cartState.totalCost = 0;
    }
    public void updateOrderState() {
        /*Update orderState based on cartState*/
        orderState.state = "Delivered";
        orderState.products = cartState.products;
        orderState.quantityEachProduct = cartState.quantityEachProduct;
    }
    public void updateBuyingHistory() {
        /*update BuyingHistory based on cartState*/
        for(ProductForSale product : cartState.products) {
            buyingHistory.products.add(product);
        }
        for(int quantity : cartState.quantityEachProduct) {
            buyingHistory.quantityEachProduct.add(quantity);
        }
    }
    public boolean bankPay() {
        //update orderState, bankAccount, buyingHistory, cartState
        if(bankAcc.pay(cartState.totalCost) == true) {
            ManagerService.accounting.updateRevenue(cartState.totalCost);
            ProductForSale.updateNoOfSolds(cartState);
            updateOrderState();
            updateBuyingHistory();
            clearCart();
            return true;
        }
        else return false;
    }
    public void depositToBankAcc(int money) {
        /*deposit to bank account*/
        bankAcc.deposit(money);
    }
    public void addProductReview(ProductForSale product, int noOfStars, String review) {
        product.addCustomerReview(noOfStars, review);
    }
}