package com.smzy.service.impl;

import com.smzy.mapper.PropertyValueMapper;
import com.smzy.pojo.Property;
import com.smzy.pojo.PropertyValue;
import com.smzy.pojo.PropertyValueExample;
import com.smzy.service.ProductService;
import com.smzy.service.PropertyService;
import com.smzy.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PropertyValueServiceImpl implements PropertyValueService{

    @Autowired
    private PropertyValueMapper propertyValueMapper;

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private ProductService productService;

    @Override
    public void add(PropertyValue propertyValue) {
        propertyValueMapper.insert(propertyValue);
    }

    @Override
    public void delete(Integer id) {
        propertyValueMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteByProductId(Integer product_id) {
        PropertyValueExample example = new PropertyValueExample();
        example.or().andProduct_idEqualTo(product_id);
        Integer category_id = productService.get(product_id).getCategory_id();
        List<PropertyValue> propertyValues = findAll(product_id, category_id);
        for(int i = 0;i < propertyValues.size();i++) {
            propertyValueMapper.deleteByPrimaryKey(propertyValues.get(i).getId());
        }
    }

    @Override
    public void update(PropertyValue propertyValue) {
        propertyValueMapper.updateByPrimaryKey(propertyValue);
    }

    @Override
    public List<PropertyValue> findAll(Integer product_id, Integer category_id) {
        PropertyValueExample example = new PropertyValueExample();
        List<PropertyValue> propertyValues = new ArrayList<>();
        List<Property> properties = propertyService.findAll(category_id);
        for(Property property : properties) {
            example.or().andProperty_idEqualTo(property.getId()).andProduct_idEqualTo(product_id);
            propertyValues.addAll(propertyValueMapper.selectByExample(example));
        }
        return propertyValues;
    }

    @Override
    public PropertyValue get(Integer id) {
        return propertyValueMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<PropertyValue> findByProductId(Integer product_id) {
        PropertyValueExample example = new PropertyValueExample();
        example.or().andProduct_idEqualTo(product_id);
        List<PropertyValue> propertyValues = propertyValueMapper.selectByExample(example);
        for(PropertyValue propertyValue : propertyValues) {
            Property property = propertyService.get(propertyValue.getProperty_id());
            propertyValue.setProperty(property);
        }
        return propertyValues;
    }
}
