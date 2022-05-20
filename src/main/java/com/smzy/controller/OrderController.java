package com.smzy.controller;

import com.smzy.pojo.Order;
import com.smzy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/listOrder")
    public String findAll(Model model) {
        List<Order> orders = orderService.findAll();
        model.addAttribute("orders",orders);
        return "admin/listOrder";
    }

    @RequestMapping("/updateOrder")
    public String update(Order order) {
        orderService.update(order);
        return "redirect:listOrder";
    }

    @RequestMapping("/orderDelivery")
    public String delivery(Integer order_id) {
        Order order = orderService.get(order_id);
        order.setDelivery_date(new Date());
        order.setStatus(OrderService.waitConfirm);
        orderService.update(order);
        return "redirect:listOrder";
    }
}
