package com.yyw.dao;

import com.yyw.entity.Grade;

import java.util.List;

/**
 * Created by Administrator on 2017/12/10.
 */
public interface GradeMapper {
    public List<Grade> getAllGrade();
    public Grade getGradeById(Integer id);
    public Integer deleteGradeById(Integer id);
    public Integer deleteGradeByIds(List<Integer> list);
    public Integer addGrade(Grade grade);
}
