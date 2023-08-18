package com.trip.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 主要编写页面跳转相关代码
 */
@Controller
public class CommonController {
  @GetMapping("/")
  public String index() {
    return "index";
  }
}
