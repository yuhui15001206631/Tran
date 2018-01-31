package com.yyw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/12/26.
 */
@Controller
public class ScoreController {
    @RequestMapping(value = "score")
    public String toScore(){
        return "score/score";
    }
}
