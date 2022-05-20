package com.smzy.controller;

import com.smzy.pojo.Category;
import com.smzy.service.CategoryService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/listCategory")
    public String findAll(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "admin/listCategory";
    }

    @RequestMapping("/editCategory")
    public String edit(Category category , Model model) {
        model.addAttribute("category",category);
        return "admin/editCategory";
    }

    @RequestMapping("/updateCategory")
    public String update(Category category) {
        categoryService.update(category);
        return "redirect:listCategory";
    }
}
