package com.smzy.controller;

import com.smzy.pojo.Product;
import com.smzy.pojo.ProductImage;
import com.smzy.service.ProductImageService;
import com.smzy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ProductImageController {

    @Autowired
    private ProductImageService productImageService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/editProductImage")
    public String edit(Model model,Integer product_id) {
        List<ProductImage> productImages = productImageService.findAll(product_id);
        model.addAttribute("productImages",productImages);
        Product product = productService.get(product_id);
        model.addAttribute("product",product);
        return "admin/editProductImage";
    }

    @RequestMapping(value = "/updateProductImage",method = RequestMethod.POST)
    public String update(HttpServletRequest request, Integer product_id , Integer id, @RequestParam("picture") MultipartFile picture) {
        String filePath = request.getSession().getServletContext().getRealPath("img/product/" + product_id);
        String fileName = (id % 5 == 0 ? 5 : id % 5) + ".jpg";
        File uploadPicture = new File(filePath,fileName);
        if(!uploadPicture.exists()) {
            uploadPicture.mkdirs();
        }
        try {
            picture.transferTo(uploadPicture);
        }catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:editProductImage?product_id=" + product_id;
    }

/*    @RequestMapping("/deleteProductImage")
    public String delete(Integer id ,Integer product_id ,HttpServletRequest request) {
        String filePath = request.getSession().getServletContext().getRealPath("img/product/" + product_id);
        String fileName = id + ".jpg";
        new File(filePath,fileName).delete();
        return "redirect:editProductImage?product_id=" + product_id;
    }*/
}
