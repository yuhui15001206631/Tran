package com.yyw.service;

import com.github.pagehelper.PageInfo;
import com.yyw.entity.Grade;

import java.util.List;

/**
 * Created by Administrator on 2017/12/10.
 */
public interface GradeService {
    public PageInfo<Grade> getAllGrade(Integer pageNum,Integer pageSize);
    public Grade getGradeById(Integer id);
    public Integer deleteGradeById(Integer id);
    public Integer deleteGradeByIds(List<Integer> list);
    public List<Grade> getAllGrade();
    public Integer addGrade(Grade grade);
}
