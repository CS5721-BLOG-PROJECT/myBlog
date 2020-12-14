package com.myBlog.service;

import com.myBlog.mapper.EmpSalMapper;
import com.myBlog.model.EmpSal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpSalService {

    @Autowired
    EmpSalMapper empSalMapper;

    public List<EmpSal> getAllEmpSal() {
        return empSalMapper.getAllEmpSal();
    }

    public Integer addEmpSal(EmpSal empSal) {
        return empSalMapper.insert(empSal);
    }

    public Integer deleteEmpSalById(Integer id) {
        return empSalMapper.deleteByPrimaryKey(id);
    }

    public Integer updateEmpSalById(EmpSal empSal) {
        return empSalMapper.updateByPrimaryKey(empSal);
    }
}
