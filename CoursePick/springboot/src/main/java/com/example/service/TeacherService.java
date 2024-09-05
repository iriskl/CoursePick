package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.entity.Teacher;
import com.example.exception.CustomException;
import com.example.mapper.TeacherMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * 教师信息业务层处理
 */
@Service
public class TeacherService {

    @Resource
    private TeacherMapper teacherMapper;

    public void add(Teacher teacher) {
        // 做一些逻辑处理
        Teacher dbTeacher = teacherMapper.selectByUsername(teacher.getUsername());
        if (ObjectUtil.isNotEmpty(dbTeacher)) {
            throw new CustomException("用户名已存在");
        }
        if (ObjectUtil.isEmpty(teacher.getPassword())) {
            teacher.setPassword("123456");
        }
        teacher.setRole("TEACHER");
        teacherMapper.insert(teacher);
    }
}
