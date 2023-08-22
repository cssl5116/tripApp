package com.trip.www.controller;

import com.trip.www.entity.Scenic;
import com.trip.www.entity.ScenicWay;
import com.trip.www.service.ScenicService;
import com.trip.www.service.ScenicWayService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
public class ScenicController {
    @Resource
    ScenicService scenicService;
    @Resource
    ScenicWayService scenicWayService;

    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable(name = "id") String id, ModelAndView mv) {
        ScenicWay scenicWay = scenicWayService.getById(id);
        Scenic scenic = scenicService.getById(scenicWay.getScenicId());
        mv.addObject("scenic", scenic);
        mv.setViewName("detail");
        return mv;
    }
}
