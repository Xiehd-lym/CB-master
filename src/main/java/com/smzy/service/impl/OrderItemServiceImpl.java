package com.smzy.service.impl;

import com.smzy.mapper.OrderItemMapper;
import com.smzy.pojo.Order;
import com.smzy.pojo.OrderItem;
import com.smzy.pojo.OrderItemExample;
import com.smzy.pojo.Product;
import com.smzy.service.OrderItemService;
import com.smzy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private ProductService productService;

    @Override
    public OrderItem get(Integer id) {
        OrderItem orderItem = orderItemMapper.selectByPrimaryKey(id);
        setProduct(orderItem);
        return orderItem;
    }


    @Override
    public void add(OrderItem orderItem) {
        orderItemMapper.insert(orderItem);
    }

    @Override
    public List<OrderItem> findByOrderId(Integer order_id) {
        OrderItemExample example = new OrderItemExample();
        example.or().andOrder_idEqualTo(order_id);
        List<OrderItem> orderItems = orderItemMapper.selectByExample(example);
        setProduct(orderItems);
        return orderItems;
    }

    @Override
    public void update(OrderItem orderItem) {
        orderItemMapper.updateByPrimaryKey(orderItem);
    }

    @Override
    public List<OrderItem> findByUserId(Integer user_id) {
        OrderItemExample example = new OrderItemExample();
        example.or().andUser_idEqualTo(user_id);
        List<OrderItem> orderItems  = orderItemMapper.selectByExample(example);
        setProduct(orderItems);
        return orderItems;
    }

    @Override
    public List<OrderItem> findForCart(Integer user_id) {
        OrderItemExample example = new OrderItemExample();
        example.or().andUser_idEqualTo(user_id).andOrder_idIsNull();
        List<OrderItem> orderItems = orderItemMapper.selectByExample(example);
        setProduct(orderItems);
        return orderItems;
    }

    public void setProduct(List<OrderItem> orderItems) {
        for (OrderItem orderItem : orderItems) {
            setProduct(orderItem);
        }
    }

    private void setProduct(OrderItem orderItem) {
        Product p = productService.get(orderItem.getProduct_id());
        orderItem.setProduct(p);
    }

    @Override
    public void delete(Integer id) {
        orderItemMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void fill(List<Order> orders) {
        for(Order order : orders) {
            fill(order);
        }
    }

    @Override
    public void fill(Order order) {
        OrderItemExample example = new OrderItemExample();
        example.or().andOrder_idEqualTo(order.getId());
        example.setOrderByClause("id desc");
        List<OrderItem> orderItems = orderItemMapper.selectByExample(example);
        setProduct(orderItems);

        float total = 0;
        int totalNumber = 0;
        for(OrderItem orderItem : orderItems) {
            total += orderItem.getNumber() * orderItem.getProduct().getPrice();
            totalNumber += orderItem.getNumber();
        }

        order.setTotal(total);
        order.setTotalNumber(totalNumber);
        order.setOrderItems(orderItems);
    }
}
