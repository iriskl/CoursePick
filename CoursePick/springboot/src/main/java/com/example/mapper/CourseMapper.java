package com.example.mapper;


import com.example.entity.Course;
import com.example.entity.Course;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CourseMapper {

    void insert(Course course);

    @Select("select course.*, college.name as collegeName, teacher.name as teacherName from course " +
            "left join college on course.college_id = college.id " +
            "left join teacher on course.teacher_id = teacher.id")
    List<Course> selectAll();

    @Select("select course.*, college.name as collegeName, teacher.name as teacherName from course " +
            "left join college on course.college_id = college.id " +
            "left join teacher on course.teacher_id = teacher.id " +
            "where course.name like concat('%', #{name}, '%')")
    List<Course> selectByName(String name);

    void updateById(Course course);

    @Delete("delete from course where id = #{id}")
    void deleteById(Integer id);
}
