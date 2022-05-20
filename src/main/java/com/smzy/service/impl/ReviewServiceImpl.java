package com.smzy.service.impl;

import com.smzy.mapper.ReviewMapper;
import com.smzy.pojo.Review;
import com.smzy.pojo.ReviewExample;
import com.smzy.pojo.User;
import com.smzy.service.ReviewService;
import com.smzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService{

    @Autowired
    private ReviewMapper reviewMapper;

    @Autowired
    private UserService userService;

    @Override
    public void add(Review review) {
        reviewMapper.insert(review);
    }

    @Override
    public void delete(Integer id) {
        reviewMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Review review) {
        reviewMapper.updateByPrimaryKeySelective(review);
    }

    @Override
    public Review get(Integer id) {
        return reviewMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Review> findByProductId(Integer product_id) {
        ReviewExample example = new ReviewExample();
        example.or().andProduct_idEqualTo(product_id);
        example.setOrderByClause("id desc");
        List<Review> reviews = reviewMapper.selectByExample(example);
        setUser(reviews);
        return reviews;
    }

    public void setUser(List<Review> reviews) {
        for(Review review : reviews) {
            setUser(review);
        }
    }

    public void setUser(Review review) {
        int user_id = review.getUser_id();
        User user = userService.get(user_id);
        review.setUser(user);
    }

    @Override
    public int getCount(Integer product_id) {
        return findByProductId(product_id).size();
    }
}
