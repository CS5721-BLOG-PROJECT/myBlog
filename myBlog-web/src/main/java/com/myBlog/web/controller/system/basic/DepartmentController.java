package com.myBlog.web.controller.system.basic;

import com.myBlog.model.Department;
import com.myBlog.model.RespBean;
import com.myBlog.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/system/basic/department")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
    @GetMapping("/")
    public List<Department> getAllDepartments() {
        return departmentService.getAllDepartments();
    }
    @PostMapping("/")
    public RespBean addDep(@RequestBody Department dep) {
        departmentService.addDep(dep);
        if (dep.getResult() == 1) {
            return RespBean.ok("add success", dep);
        }
        return RespBean.error("add fail");
    }

    @DeleteMapping("/{id}")
    public RespBean deleteDepById(@PathVariable Integer id) {
        Department dep = new Department();
        dep.setId(id);
        departmentService.deleteDepById(dep);
        if (dep.getResult() == -2) {
            return RespBean.error("the dep has sub dep，delete fail");
        } else if (dep.getResult() == -1) {
            return RespBean.error("the dep have employee，delete fail");
        } else if (dep.getResult() == 1) {
            return RespBean.ok("delete success");
        }
        return RespBean.error("delete fail");
    }
}
