package com.shopping.dao;

import com.shopping.entity.admin;

import java.util.List;


public interface adminDao {

    public admin getUser(int id);

    public admin getUser(String nameOrEmail);

    public void addUser(admin user);

    public boolean deleteUser(int id);

    public boolean updateUser(admin user);

    public List<admin> getAllUser();
}
