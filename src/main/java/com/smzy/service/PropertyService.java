package com.smzy.service;

import com.smzy.pojo.Property;

import java.util.List;

public interface PropertyService {
    void add(Property property);

    void update(Property property);

    void delete(Integer id);

    Property get(Integer id);

    /**
     * 返回分类下的所有属性
     * @param category_id
     * @return
     */
    List<Property> findAll(Integer category_id);

}
