package com.example.controller;

import com.example.common.Result;
import com.example.entity.Course;
import com.example.entity.CourseSelection;
import com.example.service.CourseSelectionService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 选课信息模块前端请求接口的入口
 */
@RestController
@RequestMapping("/courseSelection")
public class CourseSelectionController {

    @Resource
    private CourseSelectionService courseSelectionService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Course course) {
        courseSelectionService.add(course);
        return Result.success();
    }

    /**
     * 编辑（更新）
     */
    @PutMapping("/update")
    public Result update(@RequestBody CourseSelection courseSelection) {
        courseSelectionService.updateById(courseSelection);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/deleteById/{id}")
    public Result deleteById(@PathVariable Integer id) {
        courseSelectionService.deleteById(id);
        return Result.success();
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(CourseSelection courseSelection,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<CourseSelection> pageInfo = courseSelectionService.selectPage(courseSelection, pageNum, pageSize);
        return Result.success(pageInfo);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll() {
        List<CourseSelection> list = courseSelectionService.selectAll();
        return Result.success(list);
    }
}
