package com.example.model.user;
import com.example.model.manager.*;
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
    }
    public class BankAccount {
        public BankAccount() {
            this.balance = 500000000;
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
    }
    public class CartState {
        public CartState() {
            products = new ArrayList<ProductForSale>();
            quantityEachProduct = new ArrayList<Integer>();
        }
        public ArrayList<ProductForSale> products;
        public ArrayList<Integer> quantityEachProduct;
        public int totalCost;
        public int totalQuantity;
    }
    public class BuyingHistory {
        public BuyingHistory() {
            products = new ArrayList<ProductForSale>();
            quantityEachProduct = new ArrayList<Integer>();
            infoDeliverys = new ArrayList<InfoDelivery>();
            hasAsset = new ArrayList<Boolean>();
            totalCost = 0;
        }
        public ArrayList<ProductForSale> products;
        public ArrayList<Integer> quantityEachProduct;
        public ArrayList<Boolean> hasAsset;
        public int totalCost;
        public ArrayList<InfoDelivery> infoDeliverys;
    }
    private boolean logInState;
    private String fullName;
    private String userId;
    private String password;
    private String phoneNums;
    private BankAccount bankAcc;
    private BuyingHistory buyingHistory;
    private CartState cartState; 
    
    public void setActiveLoginState() {
        logInState = true;
        for(int i = 0; i < ManagerService.noOfUsers; i++) {
            if(this.userId.equals(ManagerService.users.get(i).getUserId())) {
                ManagerService.users.set(i, this);
                return ;
            }
        }
    }
    public void logout() {
        logInState = false;
        for(int i = 0; i < ManagerService.noOfUsers; i++) {
            if(this.userId.equals(ManagerService.users.get(i).getUserId())) {
                ManagerService.users.set(i, this);
                return ;
            }
        }
    }
    public CartState getCartState() {return cartState;}
    public BuyingHistory getbuyingHistory() {return buyingHistory;}
    public String getFullName() {return fullName;}
    public String getPhoneNums() {return phoneNums;}
    public String getUserId() {return userId;}
    public String getPassword() {return password;}
    public BankAccount getBankAcc() {return bankAcc;}
    public boolean getLogInState() {return logInState;}
    public void updateCart(ProductForSale product, int quantity, double saleoff, int size) {
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
                cartState.products.set(i, new ProductForSale(product, size));
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
                cartState.products.set(i, product);
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
    public void updateBuyingHistory(String fullName, String phoneNums, String address, String email, String note) {
        /*update BuyingHistory based on cartState*/
        ArrayList<ProductForSale> products = new ArrayList<ProductForSale>();
        for(ProductForSale product : cartState.products) {
            buyingHistory.products.add(product);
            products.add(product);
            buyingHistory.hasAsset.add(false);
        }
        ArrayList<Integer> quantityEachProduct = new ArrayList<Integer>();
        for(int quantity : cartState.quantityEachProduct) {
            buyingHistory.quantityEachProduct.add(quantity);
            quantityEachProduct.add(quantity);
        }
        buyingHistory.totalCost += cartState.totalCost;
        buyingHistory.infoDeliverys.add(new InfoDelivery(fullName, phoneNums, address, email, note, products, quantityEachProduct, cartState.totalCost));
        for(int i = 0; i < ManagerService.users.size(); i++) {
            if(ManagerService.users.get(i).getUserId().equals(this.userId)) {
                ManagerService.users.set(i, this);
                return ;
            }
        }
    }
    public boolean bankPay(String fullName, String phoneNums, String address, String email, String note) {
        //update orderState, bankAccount, buyingHistory, cartState
        if(bankAcc.pay(cartState.totalCost) == true) {
            ManagerService.accounting.updateRevenue(cartState.totalCost);
            ProductForSale.updateNoOfSolds(cartState);
            updateBuyingHistory(fullName, phoneNums, address, email, note);
            clearCart();
            return true;
        }
        else return false;
    }
    public void addProductReview(ProductForSale product, int noOfStars, String review, User user) {
        product.addCustomerReview(noOfStars, review, user);
        for(int i = 0; i < buyingHistory.products.size(); i++) {
            if(buyingHistory.products.get(i).getName().equals(product.getName())) {
                buyingHistory.products.set(i, product);
                buyingHistory.hasAsset.set(i, true);
            }
        }
        for(int i = 0; i < ManagerService.products.size(); i++) {
            if(ManagerService.products.get(i).getName().equals(product.getName())) {
                ManagerService.products.set(i, product);    
                return;
            }
        }
    }
}