package vn.edu.hcmuaf.fit.webbanquanao.model;

import java.io.Serializable;

public class CartProduct implements Serializable {
     private int id;
     private String name;
     private double unitPrice;
     private String img;
     private int quantity;
     private String size;
     private String color;

     public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    public double getUnitPrice() {return unitPrice;}
    public void setUnitPrice(double unitPrice) {this.unitPrice = unitPrice;}
    public int getQuantity() {return quantity;}
    public void setQuantity(int quantity) {this.quantity = quantity;}
    public String getImg() {return img;}
    public void setImg(String img) {this.img = img;}
    public String getSize() {return size;}
    public void setSize(String size) {this.size = size;}
    public String getColor() {return color;}
    public void setColor(String color) {this.color = color;}

}
