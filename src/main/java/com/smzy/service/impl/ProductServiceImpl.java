package com.smzy.service.impl;

import com.smzy.mapper.ProductMapper;
import com.smzy.pojo.Category;
import com.smzy.pojo.Product;
import com.smzy.pojo.ProductExample;
import com.smzy.service.ProductService;
import com.smzy.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ReviewService reviewService;


    public List<Product> findAll(Integer category_id) {
        ProductExample example = new ProductExample();
        example.or().andCategory_idEqualTo(category_id);
        List<Product> products =  productMapper.selectByExample(example);
        return products;
    }

    public void add(Product product) {
        productMapper.insert(product);
    }

    public void update(Product product) {
        productMapper.updateByPrimaryKey(product);
    }

    public void delete(Integer id) {
        productMapper.deleteByPrimaryKey(id);
    }

    public Product get(Integer id) {
        return productMapper.selectByPrimaryKey(id);
    }

    public void fillAll(List<Category> categories) {
        for(Category category : categories) {
            fill(category);
        }
    }

    public void fill(Category category) {
        List<Product> products = findAll(category.getId());
        category.setProducts(products);
    }

    public void setReviewCount(Product product) {
        int reviewCount = reviewService.getCount(product.getId());
        product.setReviewCount(reviewCount);
    }

    public List<Product> search(String keyword) {
        ProductExample example = new ProductExample();
        example.or().andNameLike("%" + keyword + "%");
        example.or().andSub_titleLike("%" + keyword + "%");
        example.or().andBrandLike("%" + keyword + "%");
        example.setOrderByClause("id desc");
        return productMapper.selectByExample(example);
    }
}
