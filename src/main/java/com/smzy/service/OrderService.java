package com.smzy.service;


import com.smzy.pojo.Order;
import com.smzy.pojo.OrderItem;

import java.util.List;

public interface OrderService {

    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";

    List<Order> findAll();

    Order get(Integer id);

    /**
     * 根据用户、订单状态查询订单
     * @param user_id
     * @param status
     * @return
     */
    List<Order> list(Integer user_id , String status);

    /**
     * 查询用户下的所有订单
     * @param user_id
     * @return
     */
    List<Order> findByUserId(Integer user_id);


    /**
     * 更新订单
     * @param order
     */
    void update(Order order);


    /**
     * 增加订单
     * @param order
     */
    void add(Order order);


    float addTotal(Order order,List<OrderItem> orderItems);
}
