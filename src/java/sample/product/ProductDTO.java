/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Date;

/**
 *
 * @author Lenovo Legion
 */
public class ProductDTO {
    private String productID;
    private String productName;
    private String image;
    private int price;
    private int quantity;
    private String categoryID; 
    private Date importDate;
    private Date usingDate;
    private boolean status;

    public ProductDTO() {
        this.productID = "";
        this.productName = "";
        this.image = "";
        this.price = 0;
        this.quantity = 0;
        this.categoryID = "";
        this.importDate = null;
        this.usingDate = null;
        this.status = false;
    }

    public ProductDTO(String productID, String productName, String image, int price, int quantity, String categoryID, Date importDate, Date usingDate, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.status = status;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getcategoryID() {
        return categoryID;
    }

    public void setcategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public Date getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(Date usingDate) {
        this.usingDate = usingDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }  
}
