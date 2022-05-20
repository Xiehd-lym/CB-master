package com.smzy.controller;

import com.smzy.pojo.Category;
import com.smzy.pojo.Property;
import com.smzy.service.CategoryService;
import com.smzy.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class PropertyController {

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/listProperty")
    public String findAll(Model model , Integer category_id) {
        List<Property> properties = propertyService.findAll(category_id);
        model.addAttribute("properties",properties);
        Category category = categoryService.get(category_id);
        model.addAttribute("category",category);
        return "admin/listProperty";
    }

    @RequestMapping("/addPropertyView")
    public String addPropertyView(Model model,Integer category_id) {
        Category category = categoryService.get(category_id);
        model.addAttribute("category" , category);
        return "admin/addPropertyView";
    }
    @RequestMapping("/addProperty")
    public String add(Property property) {
        propertyService.add(property);
        return "redirect:listProperty?category_id=" + property.getCategory_id();
    }

    @RequestMapping("/deleteProperty")
    public String delete(Integer id) {
        Integer category_id = propertyService.get(id).getCategory_id();
        propertyService.delete(id);
        return "redirect:listProperty?category_id=" + category_id;
    }

    @RequestMapping("/editProperty")
    public String edit(Integer id,Model model) {
        Property property = propertyService.get(id);
        model.addAttribute("property",property);
        Category category = categoryService.get(property.getCategory_id());
        model.addAttribute("category",category);
        return "admin/editProperty";
    }

    @RequestMapping("/updateProperty")
    public String update(Property property) {
        propertyService.update(property);
        return "redirect:listProperty?category_id=" + property.getCategory_id();
    }
}
