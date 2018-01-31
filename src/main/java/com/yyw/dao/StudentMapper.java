package com.yyw.dao;

import com.yyw.entity.Student;

import java.util.List;

/**
 * Created by Administrator on 2017/12/15.
 */
public interface StudentMapper {
    public List<Student> queryAll();
    public Student queryStudentById(Integer id);
    public Integer addStudent(Student student);
    public Integer updateStudent(Student student);
    public Integer deleteStudentBygradeId(Integer gradeid);
}
