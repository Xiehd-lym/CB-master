package com.smzy.service.impl;

import com.smzy.mapper.ProductImageMapper;
import com.smzy.pojo.ProductImage;
import com.smzy.pojo.ProductImageExample;
import com.smzy.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImageServiceImpl implements ProductImageService {

    @Autowired
    private ProductImageMapper productImageMapper;

    @Override
    public void add(ProductImage image) {
         productImageMapper.insert(image);
    }

/*    public void deleteByProductId(Integer product_id) {
        ProductImageExample example = new ProductImageExample();
        example.or().andProduct_idEqualTo(product_id);
        List<ProductImage> productImages = findAll(product_id);
        for(int i = 0;i < productImages.size() ; i++) {
            productImageMapper.deleteByPrimaryKey(productImages.get(i).getProduct_id());
        }
    }*/

    @Override
    public void update(ProductImage image) {
        productImageMapper.updateByPrimaryKey(image);
    }

    @Override
    public ProductImage get(Integer id) {
        return productImageMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<ProductImage> findAll(Integer product_id) {
        ProductImageExample example = new ProductImageExample();
        example.or().andProduct_idEqualTo(product_id);
        List<ProductImage> productImages = productImageMapper.selectByExample(example);
        return productImages;
    }
}
