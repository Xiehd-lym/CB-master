package com.smzy.controller;

import com.smzy.pojo.Category;
import com.smzy.pojo.Product;
import com.smzy.pojo.ProductImage;
import com.smzy.service.CategoryService;
import com.smzy.service.ProductImageService;
import com.smzy.service.ProductService;
import com.smzy.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductImageService productImageService;

    @Autowired
    private PropertyValueService propertyValueService;

    @RequestMapping("/listProduct")
    public String findAll(Model model,Integer category_id) {
        List<Product> products = productService.findAll(category_id);
        model.addAttribute("products",products);
        Category category = categoryService.get(category_id);
        model.addAttribute("category",category);
        return "admin/listProduct";
    }

    @RequestMapping("/addProductView")
    public String addView(Model model,Integer category_id) {
        Category category = categoryService.get(category_id);
        model.addAttribute("category",category);
        return "admin/addProductView";
    }
    @RequestMapping("/addProduct")
    public String add(Product product) {
        productService.add(product);
        ProductImage productImage = new ProductImage();
        productImage.setProduct_id(product.getId());
        for(int i = 1;i <= 5 ;i++) {
            productImageService.add(productImage);
        }
        return "redirect:listProduct?category_id=" + product.getCategory_id();
    }

   /*  @RequestMapping("/deleteProduct")
   public String delete(Integer id,HttpServletRequest request) {
        productImageService.deleteByProductId(id);
        String path = request.getSession().getServletContext().getRealPath("" + id);
        deleteDir(new File(path));
        propertyValueService.deleteByProductId(id);
        int category_id = productService.get(id).getCategory_id();
        productService.delete(id);
        return "redirect:listProduct?category_id=" + category_id;
    }*/

/*    public static boolean deleteDir(File dir) {
        if(dir.isDirectory()){
            String[] children = dir.list();
            for(int i = 0 ;i < children.length;i++ ) {
                boolean success = deleteDir(new File(dir, children[i]));
                if(!success) {
                    return false;
                }
            }
        }
        return dir.delete();
    }*/
    @RequestMapping("/editProduct")
    public String edit(Integer id, Model model) {
        Product product = productService.get(id);
        model.addAttribute("product",product);
        Category category = categoryService.get(product.getCategory_id());
        model.addAttribute("category",category);
        return "admin/editProduct";
    }

    @RequestMapping("/updateProduct")
    public String update(Product product) {
        productService.update(product);
        return "redirect:listProduct?category_id=" + product.getCategory_id();
    }
}
