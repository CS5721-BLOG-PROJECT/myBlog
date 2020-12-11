package com.myBlog.mapper;

import com.myBlog.model.EmpSal;

import java.util.List;

public interface EmpSalMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(EmpSal record);

    EmpSal selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(EmpSal record);

    List<EmpSal> getAllEmpSal();
}
