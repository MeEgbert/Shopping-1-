package com.shopping.dao;

import com.shopping.entity.admin;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;


@Repository
public class adminDaoImplement implements adminDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public admin getUser(int id) {
        String hql = "from admin where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, id);
        return (admin)query.uniqueResult();
    }

    @Override
    public admin getUser(String name) {
        String hql = "from admin where nickName=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, name);
        if(query.uniqueResult() == null){
            hql = "from admin where nickName=?";
            query = sessionFactory.getCurrentSession().createQuery(hql);
            query.setParameter(0, name);
        }
        return (admin)query.uniqueResult();
    }

    @Override
    public void addUser(admin user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public boolean deleteUser(int id) {
        String hql = "delete admin where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, id);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateUser(admin user) {
        String hql = "update admin set nickName = ?,password=? where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,user.getNickName());
        query.setParameter(1,user.getPassword());
        query.setParameter(3,user.getId());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<admin> getAllUser() {
        String hql = "from admin";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
