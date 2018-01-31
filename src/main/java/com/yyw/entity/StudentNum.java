package com.yyw.entity;

/**
 * Created by Administrator on 2017/12/16.
 */
public class StudentNum {
    private int id;
    private int gradeId;
    private int maxNum;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGradeId() {
        return gradeId;
    }

    public void setGradeId(int gradeId) {
        this.gradeId = gradeId;
    }

    public int getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(int maxNum) {
        this.maxNum = maxNum;
    }

    @Override
    public String toString() {
        return "StudentNum{" +
                "id=" + id +
                ", gradeId=" + gradeId +
                ", maxNum=" + maxNum +
                '}';
    }
}
