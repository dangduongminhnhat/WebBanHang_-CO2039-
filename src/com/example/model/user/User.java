package com.example.model.user;
import com.example.model.manager.*;
import java.io.*;
import java.util.*;

public class User {
    public User() {}
    public User(String fullName, String phoneNums, String userId, String password) {
        this.fullName = fullName;
        this.phoneNums = phoneNums;
        this.userId = userId;
        this.password = password;
        bankAcc = new BankAccount();
        buyingHistory = new BuyingHistory();
        cartState = new CartState();
        orderState = new OrderState();
    }
    public class BankAccount {
        public BankAccount() {
            this.balance = 50000000;
        }
        public BankAccount(int balance) {
            this.balance = balance;
        }
        private int balance;
        public int getBalance() {return balance;}
        public boolean pay(int money) {
            if(balance - money > 0) {
                balance -= money;
                return true;
            }
            return false;
        }
        public void deposit(int money) {
            balance += money;
        }
    }
    public class CartState {
        public CartState() {
            products = new ArrayList<ProductForSale>();
            quantityEachProduct = new ArrayList<Integer>();
            totalCost = 0;
        }
        /*Product number 1 have quantity is value at index of quantityEachProduct*/
        public ArrayList<ProductForSale> products;
        public ArrayList<Integer> quantityEachProduct;
        public int totalCost;
        public int totalQuantity;
    }
    public class BuyingHistory {
        /*Product number 1 have quantity is value at index of quantityEachProduct*/
        public BuyingHistory() {
            products = new ArrayList<ProductForSale>();
            quantityEachProduct = new ArrayList<Integer>();
            totalCost = 0;
        }
        public ArrayList<ProductForSale> products;
        public ArrayList<Integer> quantityEachProduct;
        public int totalCost;
    }
    public class OrderState {
        public OrderState() {
            products = new ArrayList<ProductForSale>();
            quantityEachProduct = new ArrayList<Integer>();
        }
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
    public BankAccount getBankAcc() {return bankAcc;}
    public boolean getLogInState() {return logInState;}
    public void updateCart(ProductForSale product, int quantity, double saleoff) {
        for(int i = 0; i < cartState.products.size(); i++) {
            if(cartState.products.get(i).getName().equals(product.getName())) {
                if(quantity == 0) {
                    cartState.totalCost -= saleoff * product.getUnitPrice() * cartState.quantityEachProduct.get(i);
                    cartState.totalQuantity -= cartState.quantityEachProduct.get(i);
                    cartState.products.remove(i);
                    cartState.quantityEachProduct.remove(i);
                    return;
                }
                cartState.totalCost -= saleoff * product.getUnitPrice() * (cartState.quantityEachProduct.get(i) - quantity);
                cartState.totalQuantity -= (cartState.quantityEachProduct.get(i) - quantity);
                cartState.quantityEachProduct.set(i, quantity);
                return ;
            }
        }
    }
    public void addToCart(ProductForSale product, int quantity, double saleoff) {
        for(int i = 0; i < cartState.products.size(); i++) {
            if(cartState.products.get(i).getName().equals(product.getName())) {
                cartState.totalCost += saleoff * product.getUnitPrice() * quantity;
                cartState.totalQuantity += quantity;
                cartState.quantityEachProduct.set(i, quantity + cartState.quantityEachProduct.get(i));
                return ;
            }
        }
        cartState.products.add(product);
        cartState.quantityEachProduct.add(quantity);
        cartState.totalCost += saleoff * product.getUnitPrice() * quantity;
        cartState.totalQuantity += quantity;
    }
    public void clearCart() {
        //clear all products and quantity of each product in cartState
        cartState.products.clear();
        cartState.quantityEachProduct.clear();
        cartState.totalCost = 0;
        cartState.totalQuantity = 0;
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