package com.smzy.service;

import com.smzy.pojo.ProductImage;

import java.util.List;

public interface ProductImageService {

    void add(ProductImage image);

//    void deleteByProductId(Integer product_id);

    void update(ProductImage image);

    ProductImage get(Integer id);

    List<ProductImage> findAll(Integer product_id);

}
