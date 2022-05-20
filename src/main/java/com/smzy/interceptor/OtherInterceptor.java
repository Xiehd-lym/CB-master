package com.smzy.interceptor;

import com.smzy.pojo.OrderItem;
import com.smzy.pojo.User;
import com.smzy.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class OtherInterceptor extends HandlerInterceptorAdapter {


    @Autowired
    private OrderItemService orderItemService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int cartTotalItemNumber = 0;
        if(null != user) {
            List<OrderItem> ois = orderItemService.findForCart(user.getId());
            for(OrderItem oi : ois) {
                cartTotalItemNumber += oi.getNumber();
            }
        }
        session.setAttribute("cartTotalItemNumber",cartTotalItemNumber);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
