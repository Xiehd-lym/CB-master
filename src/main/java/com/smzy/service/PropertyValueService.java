package com.smzy.service;

import com.smzy.pojo.Property;
import com.smzy.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {

    void add(PropertyValue propertyValue);

    void delete(Integer id);

    void deleteByProductId(Integer product_id);

    void update(PropertyValue propertyValue);

    List<PropertyValue> findAll(Integer product_id ,Integer category_id);

    PropertyValue get(Integer id);

    List<PropertyValue> findByProductId(Integer product_id);
}
