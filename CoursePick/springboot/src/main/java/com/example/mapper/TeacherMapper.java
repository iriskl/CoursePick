package com.example.mapper;


import com.example.entity.Teacher;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TeacherMapper {

    void insert(Teacher teacher);

    @Select("select * from teacher where username = #{username}")
    Teacher selectByUsername(String username);

    @Select("select * from teacher")
    List<Teacher> selectAll();

    @Select("select * from teacher where name like concat('%', #{name}, '%')")
    List<Teacher> selectByName(String name);
}
