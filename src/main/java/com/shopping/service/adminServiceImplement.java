package com.shopping.service;

import com.shopping.dao.*;
import com.shopping.entity.admin;
import com.shopping.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class adminServiceImplement implements adminService {

    @Autowired
    private adminDao adminDao;

    @Override
    public admin getUser(int id) {
        return adminDao.getUser(id);
    }

    @Override
    public admin getUser(String nameOrEmail) {
        return adminDao.getUser(nameOrEmail);
    }

    @Override
    public void addUser(admin user) {
        adminDao.addUser(user);
    }


    @Override
    public boolean updateUser(admin user) {
        return adminDao.updateUser(user);
    }

    @Override
    public List<admin> getAllUser() {
        return adminDao.getAllUser();
    }
}
