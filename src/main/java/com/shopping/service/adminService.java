package com.shopping.service;

import com.shopping.entity.admin;
import com.shopping.utils.Response;

import java.util.List;


public interface adminService {
    admin getUser(int id);

    admin getUser(String nameOrEmail);

    void addUser(admin user);


    boolean updateUser(admin user);

    List<admin> getAllUser();
}
