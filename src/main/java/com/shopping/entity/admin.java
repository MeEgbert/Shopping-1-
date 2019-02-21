package com.shopping.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;



@Entity
@Table(name="user_admin")
public class admin {

    private int id;
    private String nickName;
    private String password;
    private int role;

    @Id
    @GenericGenerator(name = "generator", strategy = "increment") //设置主键自增
    @GeneratedValue(generator = "generator")

    @Column(name="id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name="nickName")
    public String getNickName() {
        return nickName;
    }

    public void setNickName(String name) {
        this.nickName = name;
    }

    @Column(name="password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name="role")
    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
