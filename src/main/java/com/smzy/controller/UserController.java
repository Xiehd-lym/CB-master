package com.smzy.controller;

import com.smzy.pojo.User;
import com.smzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.plugin2.message.Message;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/listUser")
    public String findAll(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users",users);
        return "admin/listUser";
    }
    @RequestMapping("/editUser")
    public String edit(Model model ,Integer id) {
        User user = userService.get(id);
        model.addAttribute("user",user);
        return "admin/editUser";
    }

    @RequestMapping("/updateUser")
    public String update(Integer id,String password) {
        userService.updatePassword(id,password);
        return "redirect:listUser";
    }


}
