package com.smzy.service;

import com.smzy.pojo.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User get(Integer id);

    void updatePassword (Integer id ,String password);

    User get(String name,String password);

    boolean isExist(String name);

    void add(User user);
}
