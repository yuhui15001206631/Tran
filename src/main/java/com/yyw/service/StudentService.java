package com.yyw.service;

import com.github.pagehelper.PageInfo;
import com.yyw.entity.Student;

/**
 * Created by Administrator on 2017/12/15.
 */
public interface StudentService {
    public PageInfo<Student> queryAll(Integer pageNum,Integer pageSize);
    public Student queryStudentById(Integer id);
    public Integer addStudent(Student student);
    public Integer updateStudent(Student student);
}
