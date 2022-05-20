package com.smzy.controller;

import com.smzy.pojo.Admin;
import com.smzy.pojo.User;
import com.smzy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/aLogin")
    public String login(Model model, @RequestParam("name") String name,
                        @RequestParam("password") String password,
                        HttpSession session2) {
        Admin admin = adminService.get(name, password);
        if (null == admin) {
            model.addAttribute("msg", "用户名或密码错误");
            return "admin/adminLogin";
        }
        session2.setAttribute("admin", admin);
        return "redirect:admin/listCategory";
    }

    @RequestMapping("/adminLogout")
    public String logout(HttpSession session2) {
        session2.removeAttribute("admin");
        return "redirect:admin";
    }
}
