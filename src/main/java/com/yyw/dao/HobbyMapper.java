package com.yyw.dao;

import com.yyw.entity.Hoppy;

import java.util.List;

/**
 * Created by Administrator on 2017/12/28.
 */
public interface HobbyMapper {
    public List<Hoppy> queryAll();
    public Integer addHobby(Hoppy hoppy);
}
