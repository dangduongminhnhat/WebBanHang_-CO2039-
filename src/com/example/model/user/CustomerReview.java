package com.example.model.user;

public class CustomerReview {
    public CustomerReview() {
        this.noOfStars = -1;
        this.review = null;
        this.fromUser = null;
    }
    private int noOfStars;
    private String review;
    private String fromUser;
    public int getNoOfStars() {return noOfStars;}
    public String getReview() {return review;}
    public String getFromUser() {return fromUser;}
    public void setNoOfStars(int noOfStars) {this.noOfStars = noOfStars;}
    public void setReview(String review) {this.review = review;}
    public void setFromUser(String fromUser) {this.fromUser = fromUser;}
}