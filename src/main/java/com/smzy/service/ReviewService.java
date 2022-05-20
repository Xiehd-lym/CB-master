package com.smzy.service;

import com.smzy.pojo.Review;

import java.util.List;

public interface ReviewService {

    void add(Review review);

    void delete(Integer id);

    void update(Review review);

    Review get(Integer id);

    /**
     * 查询产品下的所有评价
     * @param product_id
     * @return
     */
    List<Review> findByProductId(Integer product_id);

    /**
     * 获取产品下的所有评论数
     * @param product_id
     * @return
     */
    int getCount(Integer product_id);
}
