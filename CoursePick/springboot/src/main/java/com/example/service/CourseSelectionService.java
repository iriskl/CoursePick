package com.example.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.example.entity.Course;
import com.example.entity.CourseSelection;
import com.example.exception.CustomException;
import com.example.mapper.CourseMapper;
import com.example.mapper.CourseSelectionMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.util.List;

/**
 * 选课信息业务层处理
 */
@Service
public class CourseSelectionService {

    @Resource
    private CourseSelectionMapper courseSelectionMapper;
    @Resource
    private CourseMapper courseMapper;

    public void add(Course course) {
        // 1. 先判断这个课程有没有满员
        if (course.getNum().equals(course.getAlreadyNum())) {
            throw new CustomException("该门课已经满员，请选择其他课程");
        }
        // 2. 判断该学生有没有选过该门课
        List<CourseSelection> list = courseSelectionMapper.selectByCourseIdAndStudentId(course.getId(), course.getStudentId());
        if (CollectionUtil.isNotEmpty(list)) {
            throw new CustomException("您已经选过该门课了，请给其他小伙伴留点机会吧！");
        }
        // 3. 往选课信息表里面插入一条选课记录
        CourseSelection courseSelection = new CourseSelection();
        courseSelection.setName(course.getName());
        courseSelection.setTeacherId(course.getTeacherId());
        courseSelection.setStudentId(course.getStudentId());
        courseSelection.setCourseId(course.getId());
        courseSelectionMapper.insert(courseSelection);
        // 4. 该门课的已选人数要+1
        course.setAlreadyNum(course.getAlreadyNum() + 1);
        courseMapper.updateById(course);
    }

    public PageInfo<CourseSelection> selectPage(CourseSelection courseSelection, Integer pageNum, Integer pageSize) {
        List<CourseSelection> list;
        PageHelper.startPage(pageNum, pageSize);
        if (ObjectUtil.isNotEmpty(courseSelection.getTeacherId())) {
            //表示当前登录的是教师角色
            if (ObjectUtil.isNotEmpty(courseSelection.getName())) {
                list = courseSelectionMapper.selectByNameAndTeacherId(courseSelection.getName(), courseSelection.getTeacherId());
            } else {
                list = courseSelectionMapper.selectAllByTeacherId(courseSelection.getTeacherId());
            }
        } else {
            if (ObjectUtil.isNotEmpty(courseSelection.getName())) {
                list = courseSelectionMapper.selectByName(courseSelection.getName());
            } else {
                list = courseSelectionMapper.selectAll();
            }
        }

        return PageInfo.of(list);
    }

    public void updateById(CourseSelection courseSelection) {
        courseSelectionMapper.updateById(courseSelection);
    }

    public void deleteById(Integer id) {
        courseSelectionMapper.deleteById(id);
    }

    public List<CourseSelection> selectAll() {
        return courseSelectionMapper.selectAll();
    }
}
