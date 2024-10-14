package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.entity.Student;
import com.example.exception.CustomException;
import com.example.mapper.StudentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学生信息业务层处理
 */
@Service
public class StudentService {

    @Resource
    private StudentMapper studentMapper;

    public void add(Student student) {
        // 做一些逻辑处理
        Student dbStudent = studentMapper.selectByUsername(student.getUsername());
        if (ObjectUtil.isNotEmpty(dbStudent)) {
            throw new CustomException("用户名已存在");
        }
        if (ObjectUtil.isEmpty(student.getPassword())) {
            student.setPassword("123456");
        }
        student.setRole("STUDENT");
        student.setScore(0);
        studentMapper.insert(student);
    }

    public PageInfo<Student> selectPage(Student student, Integer pageNum, Integer pageSize) {
        List<Student> list;
        PageHelper.startPage(pageNum, pageSize);
        if (ObjectUtil.isNotEmpty(student.getName())) {
            list = studentMapper.selectByName(student.getName());
        } else {
            list = studentMapper.selectAll();
        }
        return PageInfo.of(list);
    }

    public void updateById(Student student) {
        studentMapper.updateById(student);
    }

    public void deleteById(Integer id) {
        studentMapper.deleteById(id);
    }
}