package com.yyw.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.yyw.entity.Grade;
import com.yyw.service.GradeService;
import com.yyw.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/10.
 */
@Controller
@RequestMapping("grade")
public class GradeController {
    @Autowired
    private GradeService gradeService;
    @RequestMapping("toGrade")
    public String toGrade(Integer pageNum, Integer pageSize, Model model){
        PageInfo<Grade> pageInfo=gradeService.getAllGrade(pageNum,2);
        model.addAttribute("pageInfo",pageInfo);
        return "grade/grade";
    }
    /**
     * 查询班级详情
     * */
    @ResponseBody
    @RequestMapping(value = "getGradeById",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String getGradeById(Integer gradeId){
        Grade grade=gradeService.getGradeById(gradeId);
        System.out.println(JSONArray.toJSONString(grade));
        return JSONArray.toJSONString(grade);
    }
    /*
    * 单条删除班级
    * */
    @ResponseBody
    @RequestMapping(value = "deleteGradeById",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    public String deleteGradeById(Integer gradeId){
        Integer res=gradeService.deleteGradeById(gradeId);
        if(res>0){
            return JSONArray.toJSONString(Message.success());
        }
        return JSONArray.toJSONString(Message.error());
    }
    /*
    * 批量删除班级
    * */
    @ResponseBody
    @RequestMapping(value="deleteGradeByIds",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    public String deleteGradeByIds(String gradeIds){
        String[] idsArray=gradeIds.split(",");
        System.out.println(idsArray.toString());
        List<Integer> list=new ArrayList<Integer>();
        if(idsArray!=null){
          for (String s:idsArray){
              list.add(Integer.parseInt(s));
          }
        }
        Integer res=gradeService.deleteGradeByIds(list);
        if(res>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
    /*添加班级*/
    @ResponseBody
    @RequestMapping(value = "addGrade",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String addGrade(Grade grade){
        Integer res=gradeService.addGrade(grade);
        if(res>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());

    }

}
