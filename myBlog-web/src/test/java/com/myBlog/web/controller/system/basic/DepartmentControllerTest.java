package com.myBlog.web.controller.system.basic;

import com.myBlog.model.Department;
import com.myBlog.service.DepartmentService;
import com.myBlog.web.DemoApplication;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = DemoApplication.class)
public class DepartmentControllerTest {
    @Autowired
    DepartmentService departmentService;

    @Before
    public void setUp() throws Exception {
        System.out.println("---------------Before the Junit4 test---------------");
    }

    @After
    public void tearDown() throws Exception {
        System.out.println("---------------After the Junit4 test---------------");
    }

    @Test
    public void getAllDepartments() {
        System.out.println("getAllDepartments() method in the Junit4 test:");
        List<Department> list = departmentService.getAllDepartments();
        for(Department d:list){
            System.out.println(d.getName());
        }
    }
}