package com.example.mapper;


import com.example.entity.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface StudentMapper {

    void insert(Student student);

    @Select("select * from student where username = #{username}")
    Student selectByUsername(String username);

    @Select("select * from student")
    List<Student> selectAll();

    @Select("select * from student where name like concat('%', #{name}, '%')")
    List<Student> selectByName(String name);

    void updateById(Student student);

    @Delete("delete from student where id = #{id}")
    void deleteById(Integer id);
}
