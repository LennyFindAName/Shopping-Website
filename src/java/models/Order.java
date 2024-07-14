/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author legion
 */
public class Order extends Product {

    private int orderID;
    private int uID;
    private int totalPrice;
    private String date;
    private boolean isCancel; //isDeleted in DB
    private String address;
    private boolean isOrdering;
    private boolean isArrived;

    public Order() {
    }

    public Order(int orderID, int uID, String date, int totalPrice, boolean isCancel, String address, boolean isOrdering, boolean isArrived) {
        this.orderID = orderID;
        this.uID = uID;
        this.totalPrice = totalPrice;
        this.date = date;
        this.isCancel = isCancel;
        this.address = address;
        this.isOrdering = isOrdering;
        this.isArrived = isArrived;
    }

    public boolean isIsOrdering() {
        return isOrdering;
    }

    public void setIsOrdering(boolean isOrdering) {
        this.isOrdering = isOrdering;
    }

    public boolean isIsArrived() {
        return isArrived;
    }

    public void setIsArrived(boolean isArrived) {
        this.isArrived = isArrived;
    }

    public boolean isIsCancel() {
        return isCancel;
    }

    public void setIsCancel(boolean isCancel) {
        this.isCancel = isCancel;
    }
    
    


    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
