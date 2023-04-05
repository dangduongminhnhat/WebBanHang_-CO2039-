package com.example.model;
public abstract class Product {
    protected String image;//a hyperlink to image
    protected String description;
    protected String name;
    protected String category;
    public String getName() {return name;}
    public String getCategory() {return category;}
    public String getImage() {return image;}
    public String getDescription() {return description;}
}