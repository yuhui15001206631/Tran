package com.yyw.dao;

/**
 * Created by Administrator on 2017/12/16.
 */
public interface StudentNumMapper {
    public Integer addStudentNum(Integer gradeId);
    public Integer updateStudentNum(Integer gradeId);
    public Integer queryMaxNumByGradeId(Integer gradeId);
}
