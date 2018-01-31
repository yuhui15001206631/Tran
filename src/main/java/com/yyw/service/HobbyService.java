package com.yyw.service;

import com.github.pagehelper.PageInfo;
import com.yyw.entity.Hoppy;

/**
 * Created by Administrator on 2017/12/28.
 */
public interface HobbyService {
    public PageInfo<Hoppy> queryAll(Integer pageNum, Integer pageSize);
    public Integer addHobby(Hoppy hoppy);
}
