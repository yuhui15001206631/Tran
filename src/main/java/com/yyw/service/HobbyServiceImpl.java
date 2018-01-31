package com.yyw.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yyw.dao.HobbyMapper;
import com.yyw.entity.Hoppy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/28.
 */
@Service
public class HobbyServiceImpl implements HobbyService {
    @Autowired
    private HobbyMapper hobbyMapper;
    public PageInfo<Hoppy> queryAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Hoppy> list=hobbyMapper.queryAll();
        return new PageInfo<Hoppy>(list);
    }

    @Override
    public Integer addHobby(Hoppy hoppy) {
        return hobbyMapper.addHobby(hoppy);
    }
}
