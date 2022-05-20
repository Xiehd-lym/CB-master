package com.smzy.controller;

import com.smzy.pojo.Product;
import com.smzy.pojo.Property;
import com.smzy.pojo.PropertyValue;
import com.smzy.service.ProductService;
import com.smzy.service.PropertyService;
import com.smzy.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class PropertyValueController {

    @Autowired
    private PropertyValueService propertyValueService;

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private ProductService productService;


    @RequestMapping("/listPropertyValue")
    public String findAll(Model model ,Integer product_id ,Integer category_id) {
        List<PropertyValue> propertyValues = propertyValueService.findByProductId(product_id);
        model.addAttribute("propertyValues",propertyValues);
        Product product = productService.get(product_id);
        model.addAttribute("product",product);
        List<Property> properties = propertyService.findAll(category_id);
        model.addAttribute("properties",properties);
        return "admin/listPropertyValue";
    }

    @RequestMapping("/addPropertyValueView")
    public String addPropertyValueView(Model model ,Integer product_id,Integer category_id) {
        List<PropertyValue> propertyValues = propertyValueService.findByProductId(product_id);
        model.addAttribute("propertiesValue",propertyValues);
        List<Property> properties = propertyService.findAll(category_id);
        model.addAttribute("properties",properties);
        Product product = productService.get(product_id);
        model.addAttribute("product",product);
        return "admin/addPropertyValueView";
    }

    @RequestMapping("/addPropertyValue")
    public String add(PropertyValue propertyValue ){
        int product_id = propertyValue.getProduct_id();
        int category_id = productService.get(product_id).getCategory_id();
        propertyValueService.add(propertyValue);
        return "redirect:listPropertyValue?product_id=" + product_id + "&category_id=" + category_id;
    }

    @RequestMapping("/deletePropertyValue")
    public String delete(Integer id)  {
        int product_id = propertyValueService.get(id).getProduct_id();
        int category_id = productService.get(product_id).getCategory_id();
        propertyValueService.delete(id);
        return "redirect:listPropertyValue?product_id=" + product_id + "&category_id=" + category_id;
    }

    @RequestMapping("/editPropertyValue")
    public String edit(Integer id ,Model model) {
        PropertyValue propertyValue = propertyValueService.get(id);
        model.addAttribute("propertyValue",propertyValue);
        Product product = productService.get(propertyValue.getProperty_id());
        model.addAttribute("product",product);
        return "admin/editPropertyValue";
    }

    @RequestMapping("/updatePropertyValue")
    public String update(PropertyValue propertyValue) {
        Integer product_id = propertyValue.getProduct_id();
        Integer category_id = productService.get(product_id).getCategory_id();
        propertyValueService.update(propertyValue);
        return "redirect:listPropertyValue?product_id=" + product_id + "&category_id=" + category_id;
    }
}
