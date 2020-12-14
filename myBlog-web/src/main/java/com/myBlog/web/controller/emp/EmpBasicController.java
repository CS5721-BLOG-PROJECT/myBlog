package com.myBlog.web.controller.emp;

import com.myBlog.model.*;
import com.myBlog.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/employee/basic")
public class EmpBasicController {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    NationService nationService;
    @Autowired
    PoliticsstatusService politicsstatusService;
    @Autowired
    JobLevelService jobLevelService;
    @Autowired
    PositionService positionService;
    @Autowired
    DepartmentService departmentService;
    @GetMapping("/")
    public RespPageBean getEmployeeByPage(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            Employee employee, Date[] beginDateScope) {
        return employeeService.getEmployeeByPage(page, size, employee,beginDateScope);
    }
    @PostMapping("/")
    public RespBean addEmp(@RequestBody Employee employee) {
        if (employeeService.addEmp(employee) == 1) {
            return RespBean.ok("Added successfully!");
        }
        return RespBean.error("Add failed!");
    }

    @DeleteMapping("/{id}")
    public RespBean deleteEmpByEid(@PathVariable Integer id) {
        if (employeeService.deleteEmpByEid(id) == 1) {
            return RespBean.ok("Deletion succeeded!");
        }
        return RespBean.error("Deletion failed!");
    }

    @PutMapping("/")
    public RespBean updateEmp(@RequestBody Employee employee) {
        if (employeeService.updateEmp(employee) == 1) {
            return RespBean.ok("Update succeeded!");
        }
        return RespBean.error("Update failed!");
    }

    @GetMapping("/nations")
    public List<Nation> getAllNations() {
        return nationService.getAllNations();
    }

    @GetMapping("/politicsstatus")
    public List<Politicsstatus> getAllPoliticsstatus() {
        return politicsstatusService.getAllPoliticsstatus();
    }

    @GetMapping("/joblevels")
    public List<JobLevel> getAllJobLevels() {
        return jobLevelService.getAllJobLevels();
    }

    @GetMapping("/positions")
    public List<Position> getAllPositions() {
        return positionService.getAllPositions();
    }

    @GetMapping("/maxWorkID")
    public RespBean maxWorkID() {
        RespBean respBean = RespBean.build().setStatus(200)
                .setObj(String.format("%08d", employeeService.maxWorkID() + 1));
        return respBean;
    }

    @GetMapping("/deps")
    public List<Department> getAllDepartments() {
        return departmentService.getAllDepartments();
    }
}
