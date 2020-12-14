package com.myBlog.service;

import com.myBlog.mapper.RoleMapper;
import com.myBlog.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//this is role service

@Service
public class RoleService {
    @Autowired
    RoleMapper roleMapper;
    public List<Role> getAllRoles() {
        return roleMapper.getAllRoles();
    }

    public Integer addRole(Role role) {
        if (!role.getName().startsWith("ROLE_")) {
            role.setName("ROLE_" + role.getName());
        }
        return roleMapper.insert(role);
    }

    public Integer deleteRoleById(Integer rid) {
        return roleMapper.deleteByPrimaryKey(rid);
    }
}
