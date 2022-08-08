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
public class ProductError {
    private String productIDError;
    private String productNameError;
    private String imageError;
    private int priceError;
    private int quantityError;
    private String categoryIDError; 
    private Date importDateError;
    private Date usingDateError;
    private boolean statusError;

    public ProductError() {
        this.productIDError = "";
        this.productNameError = "";
        this.imageError = "";
        this.priceError = 0;
        this.quantityError = 0;
        this.categoryIDError = "";
        this.importDateError = null;
        this.usingDateError = null;
        this.statusError = false;
    }

    public ProductError(String productIDError, String productNameError, String imageError, int priceError, int quantityError, String categoryIDError, Date importDateError, Date usingDateError, boolean statusError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.imageError = imageError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.categoryIDError = categoryIDError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
        this.statusError = statusError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public int getPriceError() {
        return priceError;
    }

    public void setPriceError(int priceError) {
        this.priceError = priceError;
    }

    public int getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(int quantityError) {
        this.quantityError = quantityError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public Date getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(Date importDateError) {
        this.importDateError = importDateError;
    }

    public Date getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(Date usingDateError) {
        this.usingDateError = usingDateError;
    }

    public boolean isStatusError() {
        return statusError;
    }

    public void setStatusError(boolean statusError) {
        this.statusError = statusError;
    }
    
}
