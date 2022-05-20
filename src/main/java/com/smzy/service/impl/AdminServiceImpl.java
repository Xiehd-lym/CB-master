package com.smzy.service.impl;

import com.smzy.mapper.AdminMapper;
import com.smzy.pojo.Admin;
import com.smzy.pojo.AdminExample;
import com.smzy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> findAll() {
        AdminExample example = new AdminExample();
        return adminMapper.selectByExample(example);
    }

    public Admin get(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }
    public Admin get(String name,String password) {
        AdminExample example = new AdminExample();
        example.or().andNameEqualTo(name).andPasswordEqualTo(password);
        List<Admin> admins = adminMapper.selectByExample(example);
        if(admins.isEmpty())
            return null;
        return admins.get(0);
    }

    public boolean isExist(String name) {
        AdminExample example = new AdminExample();
        example.or().andNameEqualTo(name);
        List<Admin> result = adminMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;
    }
}
