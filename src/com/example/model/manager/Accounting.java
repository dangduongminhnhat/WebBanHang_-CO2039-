package com.example.model.manager;
public class Accounting {
    private int expense;
    private int revenue;
    public void updateExpense(int value) {
        expense += value;
    }
    public void updateRevenue(int value) {
        revenue += value;
    }
    public int getExpense() {
        return expense;
    }
    public int getRevenue() {
        return revenue;
    }
    public int getProfit() {
        return revenue - expense;
    }
}