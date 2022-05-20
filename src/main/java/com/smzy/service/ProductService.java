package com.smzy.service;

import com.smzy.pojo.Category;
import com.smzy.pojo.Product;

import java.util.List;

public interface ProductService {

    /**
     * 查找某分类id下的所有化妆品
     * @return
     */
    List<Product> findAll(Integer category_id);

    /**
     * 添加商品
     * @param product
     */
    void add(Product product);


    /**
     * 更新商品
     * @param product
     */
    void update(Product product);

    /**
     * 删除商品
     * @param id
     */
    void delete(Integer id);

    /**
     * 根据商品ID查询商品
     * @param id
     * @return
     */
    Product get(Integer id);

    /**
     * 为多个分类填充产品
     * @param categories
     */
    void fillAll(List<Category> categories);


    /**
     * 为一个分类填充产品
     * @param category
     */
    void fill(Category category);


    /**
     * 为产品添加评论数
     * @param product
     */
    void setReviewCount(Product product);

    /**
     * 通过关键字获取产品集合
     * @param keyword
     * @return
     */
    List<Product> search(String keyword);
}
