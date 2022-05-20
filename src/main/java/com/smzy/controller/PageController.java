package com.smzy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/loginPage")
    public String loginPage() {
        return "loginPage";
    }

    @RequestMapping("/registerPage")
    public String registerPage() {
        return "registerPage";
    }

    @RequestMapping("/registerSuccess")
    public String registerSuccess() {
        return "registerSuccess";
    }

    @RequestMapping("/payPage")
    public String payPage() {
        return "payPage";
    }

    @RequestMapping("/admin")
    public String admin() {
        return "admin/adminLogin";
    }

    @RequestMapping("/adminLogin")
    public String adminLogin() {
        return "admin/adminLogin";
    }

    @RequestMapping("/back")
    public String back() {
        return "back";
    }

    @RequestMapping("/knowledge")
    public String knowledge() {
        return "knowledge";
    }

    @RequestMapping("/advert")
    public String advert() {
        return "advert";
    }

    @RequestMapping("/touch")
    public String touch() {
        return "touch";
    }
}
