package com.example.mapper;


import com.example.entity.Teacher;
import org.apache.ibatis.annotations.Select;

public interface TeacherMapper {

    void insert(Teacher teacher);

    @Select("select * from teacher where username = #{username}")
    Teacher selectByUsername(String username);
}
