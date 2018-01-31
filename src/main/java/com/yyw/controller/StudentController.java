package com.yyw.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.yyw.entity.Grade;
import com.yyw.entity.Student;
import com.yyw.service.GradeService;
import com.yyw.service.StudentService;
import com.yyw.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2017/12/15.
 */
@Controller
@RequestMapping("student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private GradeService gradeService;
    @RequestMapping("toStudent")
    public String toStudent(Integer pageNum, Integer pageSize, Model model){
        PageInfo<Student> pageInfo=studentService.queryAll(pageNum,5);
        model.addAttribute("pageInfo",pageInfo);
        return "student/student";
    }
    /*学生详情*/
    @ResponseBody
    @RequestMapping(value = "detailsStudent",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String detailsStudent(Integer studentId){
        Student student=studentService.queryStudentById(studentId);
        return JSON.toJSONString(student);
    }
    /*查询所有班级*/
    @ResponseBody
    @RequestMapping(value = "queryAllGrade",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String queryAllGrade(){
        List<Grade> list=gradeService.getAllGrade();
        return JSON.toJSONString(list);
    }
    /*添加学生*/
    @ResponseBody
    @RequestMapping(value = "addStudent",method = RequestMethod.POST,produces ={"application/json;charset=utf-8"} )
    public String addStudent(Student student){
        Integer res=studentService.addStudent(student);
        if (res>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
   /*修改学生*/
    @ResponseBody
    @RequestMapping(value = "updateStudent",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String updateStudent(Student student){
        Integer res=studentService.updateStudent(student);
        if (res>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
}
