package com.yyw.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/12/9.
 */
public class Grade {
    /*
    * id	int
grade_name	varchar
create_date	date
details	varchar
*/
    private int id;
    private String gradeName;
    private String details;
    private Date date;

    @Override
    public String toString() {
        return "GradeController{" +
                "id=" + id +
                ", gradeName='" + gradeName + '\'' +
                ", details='" + details + '\'' +
                ", date=" + date +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
