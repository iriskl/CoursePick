package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.entity.Teacher;
import com.example.exception.CustomException;
import com.example.mapper.TeacherMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public PageInfo<Teacher> selectPage(Teacher teacher, Integer pageNum, Integer pageSize) {
        List<Teacher> list;
        PageHelper.startPage(pageNum, pageSize);
        if (ObjectUtil.isNotEmpty(teacher.getName())) {
            list = teacherMapper.selectByName(teacher.getName());
        } else {
            list = teacherMapper.selectAll();
        }
        return PageInfo.of(list);
    }
}
