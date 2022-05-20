package com.smzy.service.impl;

import com.smzy.mapper.UserMapper;
import com.smzy.pojo.User;
import com.smzy.pojo.UserExample;
import com.smzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    public List<User> findAll() {
        UserExample example = new UserExample();
        return userMapper.selectByExample(example);
    }

    public User get(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public void updatePassword (Integer id ,String password) {
        User user = get(id);
        user.setPassword(password);
         userMapper.updateByPrimaryKey(user);
    }

    public User get(String name,String password) {
        UserExample example = new UserExample();
        example.or().andNameEqualTo(name).andPasswordEqualTo(password);
        List<User> result = userMapper.selectByExample(example);
        if(result.isEmpty())
            return null;
        return result.get(0);
    }

    public boolean isExist(String name) {
        UserExample example = new UserExample();
        example.or().andNameEqualTo(name);
        List<User> result = userMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;
    }

    public void add(User user) {
        userMapper.insert(user);
    }
}
