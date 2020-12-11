package com.myBlog.web.controller.salary;

import com.myBlog.model.EmpSal;
import com.myBlog.model.RespBean;
import com.myBlog.service.EmpSalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/salary/empsal")
public class EmpSalController {

    @Autowired
    EmpSalService empSalService;

    @GetMapping("/")
    public List<EmpSal> getAllSalaries() {
        return empSalService.getAllEmpSal();
    }

    @PostMapping("/")
    public RespBean addSalary(@RequestBody EmpSal empSal) {
        if (empSalService.addEmpSal(empSal) == 1) {
            return RespBean.ok("add success!");
        }
        return RespBean.error("add fail!");
    }

    @DeleteMapping("/{id}")
    public RespBean deleteSalaryById(@PathVariable Integer id) {
        if (empSalService.deleteEmpSalById(id) == 1) {
            return RespBean.ok("delete success！");
        }
        return RespBean.error("delete fail！");
    }

    @PutMapping("/")
    public RespBean updateSalaryById(@RequestBody EmpSal empSal) {
        if (empSalService.updateEmpSalById(empSal) == 1) {
            return RespBean.ok("update success!");
        }
        return RespBean.error("update fail!");
    }
}
