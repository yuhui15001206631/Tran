package com.yyw.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yyw.dao.StudentMapper;
import com.yyw.dao.StudentNumMapper;
import com.yyw.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/15.
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private StudentNumMapper studentNumMapper;
    public PageInfo<Student> queryAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Student> list=studentMapper.queryAll();
        PageInfo<Student> pageInfo=new PageInfo<Student>(list);
        return pageInfo;
    }

    public Student queryStudentById(Integer id) {
        return studentMapper.queryStudentById(id);
    }
/*添加学生*/
    public Integer addStudent(Student student) {
       //修改max_num
        Integer gradeId=student.getGrade().getId();
        studentNumMapper.updateStudentNum(gradeId);
        //查询修改后max_num
        Integer studentNum=studentNumMapper.queryMaxNumByGradeId(gradeId);
        //拼
        String gradeName=student.getGrade().getGradeName();
        String studentGradeNum=gradeName+studentNum;
        for(int i=0;i<(15-studentGradeNum.length());i++){
           gradeName=gradeName+0;
        }
        studentGradeNum=gradeName+studentNum;
        student.setStudentNum(studentGradeNum);
        return studentMapper.addStudent(student);
    }

    public Integer updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }
}
