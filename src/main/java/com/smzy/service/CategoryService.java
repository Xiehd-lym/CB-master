package com.smzy.service;

import com.smzy.pojo.Category;

import java.util.List;

public interface CategoryService {

    List<Category> findAll();

    Category get(Integer id);

    void update(Category category);
}
