package com.myBlog.service;


import com.myBlog.mapper.NationMapper;
import com.myBlog.model.Nation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//this is nationservice

@Service
public class NationService {
    @Autowired
    NationMapper nationMapper;
	
    public List<Nation> getAllNations() {
        return nationMapper.getAllNations();
    }
}
