package com.smzy.service.impl;

import com.smzy.mapper.PropertyMapper;
import com.smzy.pojo.Property;
import com.smzy.pojo.PropertyExample;
import com.smzy.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyServiceImpl implements PropertyService{

    @Autowired
    private PropertyMapper propertyMapper;

    @Override
    public void add(Property property) {
        propertyMapper.insert(property);
    }

    @Override
    public void update(Property property) {
        propertyMapper.updateByPrimaryKey(property);
    }

    @Override
    public void delete(Integer id) {
        propertyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Property get(Integer id) {
        return propertyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Property> findAll(Integer category_id) {
        PropertyExample example = new PropertyExample();
        example.or().andCategory_idEqualTo(category_id);
        List<Property> properties = propertyMapper.selectByExample(example);
        return properties;
    }
}
