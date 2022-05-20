package com.smzy.service;

import com.smzy.pojo.Admin;

import java.util.List;

public interface AdminService {

    List<Admin> findAll();

    Admin get(Integer id);

    Admin get(String name, String password);

    boolean isExist(String name);


}
