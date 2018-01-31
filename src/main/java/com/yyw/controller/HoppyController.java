package com.yyw.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.yyw.entity.Hoppy;
import com.yyw.service.HobbyService;
import com.yyw.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/26.
 */
@Controller
public class HoppyController {
    @Autowired
    private HobbyService hobbyService;
    @RequestMapping(value = "hoppy")
    public String toHoppy(){
        return "hoppy/hoppy";
    }

    @ResponseBody
    @RequestMapping(value = "toHobby",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String hobby(Integer page, Integer rows){
        PageInfo<Hoppy> pageInfo=hobbyService.queryAll(page,rows);
        Map<String,Object> map=new HashMap();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return JSON.toJSONString(map);
    }
    @ResponseBody
    @RequestMapping(value = "addHobby",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String addHobby(Hoppy hoppy){
        System.out.println(hoppy);
        Integer res=hobbyService.addHobby(hoppy);
        if(res>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
}
