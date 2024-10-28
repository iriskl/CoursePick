package com.example.mapper;


import com.example.entity.CourseSelection;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CourseSelectionMapper {

    void insert(CourseSelection courseSelection);

    @Select("select course_selection.*, teacher.name as teacherName, student.name as studentName from course_selection " +
            "left join teacher on course_selection.teacher_id = teacher.id " +
            "left join student on course_selection.student_id = student.id ")
    List<CourseSelection> selectAll();

    @Select("select course_selection.*, teacher.name as teacherName, student.name as studentName from course_selection " +
            "left join teacher on course_selection.teacher_id = teacher.id " +
            "left join student on course_selection.student_id = student.id " +
            "where course_selection.name like concat('%', #{name}, '%')")
    List<CourseSelection> selectByName(String name);

    void updateById(CourseSelection courseSelection);

    @Delete("delete from course_selection where id = #{id}")
    void deleteById(Integer id);

    @Select("select * from course_selection where course_id = #{courseId} and student_id = #{studentId}")
    List<CourseSelection> selectByCourseIdAndStudentId(@Param("courseId") Integer courseId, @Param("studentId") Integer studentId);


    @Select("select course_selection.*, teacher.name as teacherName, student.name as studentName from course_selection " +
            "left join teacher on course_selection.teacher_id = teacher.id " +
            "left join student on course_selection.student_id = student.id " +
            "where course_selection.name like concat('%', #{name}, '%') and student_id = #{studentId}")
    List<CourseSelection> selectByNameAndStudentId(@Param("name") String name, @Param("studentId") Integer studentId);

    @Select("select course_selection.*, teacher.name as teacherName, student.name as studentName from course_selection " +
            "left join teacher on course_selection.teacher_id = teacher.id " +
            "left join student on course_selection.student_id = student.id " +
            "where student_id = #{studentId}")
    List<CourseSelection> selectAllByStudentId(Integer studentId);


    @Select("select course_selection.*, teacher.name as teacherName, student.name as studentName from course_selection " +
            "left join teacher on course_selection.teacher_id = teacher.id " +
            "left join student on course_selection.student_id = student.id " +
            "where course_selection.name like concat('%', #{name}, '%') and teacher_id = #{teacherId}")
    List<CourseSelection> selectByNameAndTeacherId(@Param("name") String name, @Param("teacherId") Integer teacherId);

    @Select("select course_selection.*, teacher.name as teacherName, student.name as studentName from course_selection " +
            "left join teacher on course_selection.teacher_id = teacher.id " +
            "left join student on course_selection.student_id = student.id " +
            "where teacher_id = #{teacherId}")
    List<CourseSelection> selectAllByTeacherId(Integer teacherId);

    @Select("select * from course_selection where id = #{id}")
    CourseSelection selectById(Integer id);
}
