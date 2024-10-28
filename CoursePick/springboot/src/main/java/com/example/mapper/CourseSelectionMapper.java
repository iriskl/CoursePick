package com.example.mapper;


import com.example.entity.CourseSelection;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CourseSelectionMapper {

    void insert(CourseSelection courseSelection);

    @Select("select * from course_selection")
    List<CourseSelection> selectAll();

    @Select("select * from course_selection where name like concat('%', #{name}, '%')")
    List<CourseSelection> selectByName(String title);

    void updateById(CourseSelection courseSelection);

    @Delete("delete from course_selection where id = #{id}")
    void deleteById(Integer id);

    @Select("select * from course_selection where course_id = #{courseId} and student_id = #{studentId}")
    List<CourseSelection> selectByCourseIdAndStudentId(@Param("courseId") Integer courseId, @Param("studentId") Integer studentId);

    List<CourseSelection> selectByNameAndTeacherId(String name, Integer teacherId);

    List<CourseSelection> selectAllByTeacherId(Integer teacherId);
}
