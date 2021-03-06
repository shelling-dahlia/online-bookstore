/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.sessionmodel;

import java.io.Serializable;

/**
 *
 * @author NHULT
 */
public class CartItem implements Serializable {

    private String id;
    private String productName;
    private double price;
    private int quantity;

    public CartItem(String id, String productName, int quantity, double price) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public String getId() {
        return id;
    }

    public String getProductName() {
        return productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void addQuantity(int quantity) {
        this.quantity += quantity;
    }

    void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
