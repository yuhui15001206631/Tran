package com.yyw.service;

import com.yyw.dao.TUserMapper;
import com.yyw.entity.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/10.
 */
@Service
public class TUserServiceImpl implements TUserService {
    @Autowired
    private TUserMapper tUserMapper;
    public TUser login(TUser tUser) {
        return tUserMapper.login(tUser);
    }
}
