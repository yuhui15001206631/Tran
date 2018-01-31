package com.yyw.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yyw.dao.GradeMapper;
import com.yyw.dao.StudentMapper;
import com.yyw.dao.StudentNumMapper;
import com.yyw.entity.Grade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/10.
 */
@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private StudentNumMapper studentNumMapper;
    @Autowired
    private StudentMapper studentMapper;
    public PageInfo<Grade> getAllGrade(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Grade> list=gradeMapper.getAllGrade();
        PageInfo<Grade> pageInfo=new PageInfo<Grade>(list);
        return pageInfo;
    }

    public Grade getGradeById(Integer id) {
        return gradeMapper.getGradeById(id);
    }

    public Integer deleteGradeById(Integer id) {
        studentMapper.deleteStudentBygradeId(id);
        int a=1/0;
        return gradeMapper.deleteGradeById(id);
    }

    public Integer deleteGradeByIds(List<Integer> list) {
        return gradeMapper.deleteGradeByIds(list);
    }

    public List<Grade> getAllGrade() {
        return gradeMapper.getAllGrade();
    }

    public Integer addGrade(Grade grade) {
        gradeMapper.addGrade(grade);
        Integer gradeId=grade.getId();
        return studentNumMapper.addStudentNum(gradeId);
    }
}
