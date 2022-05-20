package com.smzy.pojo;

import java.util.List;

public class Category {
    private Integer id;

    private String name;

    private String img_url;

    private List<Product> products;

    private List<List<Product>> productByRow;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url == null ? null : img_url.trim();
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<List<Product>> getProductByRow() {
        return productByRow;
    }

    public void setProductByRow(List<List<Product>> productByRow) {
        this.productByRow = productByRow;
    }
}