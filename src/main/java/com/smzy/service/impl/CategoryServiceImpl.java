package com.smzy.service.impl;

import com.smzy.mapper.CategoryMapper;
import com.smzy.pojo.Category;
import com.smzy.pojo.CategoryExample;
import com.smzy.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService{

    @Autowired
    private CategoryMapper categoryMapper;

    public List<Category> findAll() {
        CategoryExample example = new CategoryExample();
        List<Category> categories = categoryMapper.selectByExample(example);
        return categories;
    }

    @Override
    public Category get(Integer id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Category category) {
        categoryMapper.updateByPrimaryKey(category);
    }
}
