package com.smzy.service.impl;

import com.smzy.mapper.OrderMapper;
import com.smzy.pojo.Order;
import com.smzy.pojo.OrderExample;
import com.smzy.pojo.OrderItem;
import com.smzy.service.OrderItemService;
import com.smzy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private OrderItemService orderItemService;


    public List<Order> findAll() {
        OrderExample example = new OrderExample();
        return orderMapper.selectByExample(example);
    }

    @Override
    public Order get(Integer id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Order> list(Integer user_id, String status) {
        OrderExample example = new OrderExample();
        example.or().andUser_idEqualTo(user_id).andStatusNotEqualTo(status);
        example.setOrderByClause("id desc");
        return orderMapper.selectByExample(example);
    }

    @Override
    public List<Order> findByUserId(Integer user_id) {
        OrderExample example = new OrderExample();
        example.or().andUser_idEqualTo(user_id);
        return orderMapper.selectByExample(example);
    }

    @Override
    public void update(Order order) {
        orderMapper.updateByPrimaryKey(order);
    }

    @Override
    public void add(Order order) {
        orderMapper.insert(order);
    }

    @Override
    public float addTotal(Order order, List<OrderItem> orderItems) {
        float total = 0;
        add(order);
        if(false)
            throw new RuntimeException();

        for(OrderItem orderItem : orderItems) {
            orderItem.setOrder_id(order.getId());
            orderItemService.update(orderItem);
            total += orderItem.getProduct().getPrice() * orderItem.getNumber();
        }
        return total;
    }
}
