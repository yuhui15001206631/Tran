package com.yyw.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/12/27.
 */
public class Hoppy {
    /*
    * id	int
hobby_name	varchar
create_time	datetime
*/
    public int id;
    private String hobbyName;
    private Date createTime;

    @Override
    public String toString() {
        return "Hoppy{" +
                "id=" + id +
                ", hobbyName='" + hobbyName + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHobbyName() {
        return hobbyName;
    }

    public void setHobbyName(String hobbyName) {
        this.hobbyName = hobbyName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
