package com.smzy.controller;

import com.github.pagehelper.PageHelper;
import com.smzy.pojo.*;
import com.smzy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ForeController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @Autowired
    private PropertyValueService propertyValueService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/home")
    public String home(Model model) {
        List<Category> categories = categoryService.findAll();
        productService.fillAll(categories);
        model.addAttribute("categories", categories);
        return "index";
    }

    @RequestMapping("/showProduct")
    public String showProduct(Model model, Integer product_id) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        Product product = productService.get(product_id);
        productService.setReviewCount(product);
        model.addAttribute("product", product);
        List<PropertyValue> propertyValues = propertyValueService.findByProductId(product_id);
        model.addAttribute("propertyValues", propertyValues);
        List<Review> reviews = reviewService.findByProductId(product_id);
        model.addAttribute("reviews", reviews);
        return "detail";
    }

    @RequestMapping("/searchProduct")
    public String searchProduct(Model model, String keyword) {
        PageHelper.offsetPage(0, 20);
        List<Product> products = productService.search(keyword);
        for (Product product: products) {
            product.setReviewCount(reviewService.getCount(product.getId()));
        }
        model.addAttribute("products", products);
        return "searchPage";
    }


    @RequestMapping("sortProduct")
    public String sortProduct(Model model, String sort, String keyword) {
        List<Product> products = productService.search(keyword);
        for (Product product : products) {
            product.setReviewCount(reviewService.getCount(product.getId()));
        }
        if (sort != null) {
            switch (sort) {
                case "all":
                    Collections.sort(products, Comparator.comparing(Product::getId));
                    break;
                case "sale":
                    Collections.sort(products, Comparator.comparing(Product::getSale));
                    break;
                case "price":
                    Collections.sort(products, Comparator.comparing(Product::getPrice));
            }
        }
        model.addAttribute("products", products);
        return "searchPage";
    }
//----------------------------------------------登录、注册-------------------------------------------------


    @RequestMapping("/login")
    public String login(Model model, @RequestParam("name") String name,
                        @RequestParam("password") String password,
                        HttpSession session) {
        User user = userService.get(name, password);
        if (null == user) {
            model.addAttribute("msg", "用户名或密码错误");
            return "loginPage";
        }
        session.setAttribute("user", user);
        return "redirect:home";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:home";
    }

    @RequestMapping("/register")
    public String register(Model model, User user) {
        String name = user.getName();
        boolean exist = userService.isExist(name);
        if (exist) {
            String msg = "用户名已存在";
            model.addAttribute("msg", msg);
            model.addAttribute("username", user.getName());
            return "registerPage";
        }
        userService.add(user);
        return "redirect:registerSuccess";
    }

    //----------------------------------------------立即购买-------------------------------------------------

    @RequestMapping("/buyOne")
    public String buyOne(Integer product_id, Integer number, HttpSession session) {
        Product product = productService.get(product_id);
        int orderItemId = 0;

        User user = (User) session.getAttribute("user");
        boolean found = false;
        List<OrderItem> orderItems = orderItemService.findByUserId(user.getId());
        for (OrderItem orderItem : orderItems) {
            if (orderItem.getProduct_id().intValue() == product.getId().intValue()) {
                orderItem.setNumber(orderItem.getNumber() + number);
                orderItemService.update(orderItem);
                orderItemId = orderItem.getId();
                break;
            }
        }

        if (!found) {
            OrderItem orderItem = new OrderItem();
            orderItem.setUser_id(user.getId());
            orderItem.setNumber(number);
            orderItem.setProduct_id(product_id);
            orderItemService.add(orderItem);
            orderItemId = orderItem.getId();
        }
        return "redirect:buy?orderItemId=" + orderItemId;
    }

    @RequestMapping("/buy")
    public String buy(Model model, String[] orderItemId, HttpSession session) {
        List<OrderItem> orderItems = new ArrayList<>();
        float total = 0;
        for (String strId : orderItemId) {
            int id = Integer.parseInt(strId);
            OrderItem orderItem = orderItemService.get(id);
            total += orderItem.getProduct().getPrice() * orderItem.getNumber();
            orderItems.add(orderItem);
        }
        session.setAttribute("orderItems", orderItems);
        model.addAttribute("total", total);
        return "buyPage";
    }

    @RequestMapping("/createOrder")
    public String createOrder(Model model, Order order, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        order.setOrder_code(orderCode);
        order.setCreate_date(new Date());
        order.setUser_id(user.getId());
        order.setStatus(OrderService.waitPay);
        List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
        float total = orderService.addTotal(order, orderItems);
        return "redirect:payPage?order_id=" + order.getId() + "&total=" + total;
    }

    @RequestMapping("/payed")
    public String payed(int order_id, float total, Model model) {
        Order order = orderService.get(order_id);
        order.setStatus(OrderService.waitDelivery);
        order.setPay_date(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "payed";
    }


    //---------------------------------------------加入购物车------------------------------------------------
    @RequestMapping("addCart")
    @ResponseBody
    public String addCart(int product_id,int num,Model model,HttpSession session) {
        Product p = productService.get(product_id);
        User user = (User) session.getAttribute("user");
        boolean found = false;
        List<OrderItem> ois = orderItemService.findByUserId(user.getId());
        for(OrderItem oi :ois) {
            if(oi.getProduct().getId().intValue() == p.getId().intValue()) {
                oi.setNumber(oi.getNumber() + num);
                orderItemService.update(oi);
                found = true;
                break;
            }
        }
        if(!found) {
            OrderItem oi = new OrderItem();
            oi.setUser_id(user.getId());
            oi.setNumber(num);
            oi.setProduct_id(product_id);
            orderItemService.add(oi);
        }
        return "success";
    }

    @RequestMapping("/cart")
    public String cart(Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        List<OrderItem> orderItems = orderItemService.findForCart(user.getId());
        model.addAttribute("orderItems",orderItems);
        return "cart";
    }

    @RequestMapping("/checkLogin")
    @ResponseBody
    public String checkLogin(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(null != user)
            return "success";
        return "fail";
    }

    @RequestMapping("/changeOrderItem")
    @ResponseBody
    public String changeOrderItem(Model model,HttpSession session,int product_id,int number) {
        User user = (User)session.getAttribute("user");
        if(null == user)
            return "fail";

        List<OrderItem> ois = orderItemService.findByUserId(user.getId());
        for(OrderItem oi : ois) {
            if(oi.getProduct().getId().intValue() == product_id) {
                oi.setNumber(number);
                orderItemService.update(oi);
                break;
            }
        }
        return "success";
    }

    @RequestMapping("deleteOrderItem")
    @ResponseBody
    public String deleteOrderItem(Model model,HttpSession session,Integer orderItemId) {
        User user = (User) session.getAttribute("user");
        if(null == user)
            return "fail";
        orderItemService.delete(orderItemId);
        return "success";
    }

    @RequestMapping("bought")
    public String bought(Model model,HttpSession session) {
        User user =(User) session.getAttribute("user");
        List<Order> orders = orderService.list(user.getId(),OrderService.delete);
        orderItemService.fill(orders);
        model.addAttribute("orders",orders);
        return "bought";
    }

    @RequestMapping("confirmPay")
    public String confirmPay(Model model,Integer order_id) {
        Order order = orderService.get(order_id);
        orderItemService.fill(order);
        model.addAttribute("order",order);
        return "confirmPay";
    }

    @RequestMapping("/orderConfirmed")
    public String orderConfirmed(Model model,Integer order_id) {
        Order order = orderService.get(order_id);
        order.setStatus(OrderService.waitReview);
        order.setConfirm_date(new Date());
        orderService.update(order);
        return "orderConfirmedPage";
    }

    @RequestMapping("deleteOrder")
    public String deleteOrder(Model model,Integer order_id) {
        Order order = orderService.get(order_id);
        order.setStatus(OrderService.delete);
        orderService.update(order);
        return "success";
    }

    @RequestMapping("review")
    public String review(Model model,Integer order_id) {
        Order order = orderService.get(order_id);
        orderItemService.fill(order);
        Product product = order.getOrderItems().get(0).getProduct();
        List<Review> reviews = reviewService.findByProductId(product.getId());
        productService.setReviewCount(product);
        model.addAttribute("product",product);
        model.addAttribute("order",order);
        model.addAttribute("reviews",reviews);
        return "reviewPage";
    }


    @RequestMapping("doReview")
    public String deReview(Model model,HttpSession session,
                           @RequestParam("order_id") Integer order_id,
                           @RequestParam("product_id") Integer product_id,
                           String content) {
        Order order = orderService.get(order_id);
        order.setStatus(OrderService.finish);
        orderService.update(order);

        User user = (User) session.getAttribute("user");
        Review review = new Review();
        review.setContent(content);
        review.setProduct_id(product_id);
        review.setCreateDate(new Date());
        review.setUser_id(user.getId());
        reviewService.add(review);
        return "redirect:review?order_id=" + order_id + "&showonly=true";
    }
}
