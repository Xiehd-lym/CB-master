package com.smzy.service;

import com.smzy.pojo.Order;
import com.smzy.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {

    OrderItem get(Integer id);

    void add(OrderItem orderItem);

    List<OrderItem> findByOrderId(Integer order_id);

    void update(OrderItem orderItem);

    List<OrderItem> findByUserId(Integer user_id);

    List<OrderItem> findForCart(Integer user_id);

    void delete(Integer id);

    void fill(List<Order> orders);

    void fill(Order order);

}
