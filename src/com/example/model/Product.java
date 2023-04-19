package com.example.model;

public abstract class Product {
    protected String image;//a hyperlink to image
    protected String smallImg1;//a hyperlink to small image1
    protected String smallImg2;//a hyperlink to small image2
    protected String smallImg3;//a hyperlink to small image3
    protected String description;
    protected String name;
    protected String category;
    protected int size;
    protected String colors;
    public String getName() {return name;}
    public String getCategory() {return category;}
    public String getImage() {return image;}
    public String getSmallImg1() {return smallImg1;}
    public String getSmallImg2() {return smallImg2;}
    public String getSmallImg3() {return smallImg3;}
    public String getDescription() {return description;}
    public int getSize() {return size;}
    public String getColors() {return colors;}
}