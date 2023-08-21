package com.trip.www.controller;

import cn.hutool.core.util.RandomUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 主要编写页面跳转相关代码
 */
@Controller
public class CommonController {
  @GetMapping("/")
  public String index() {
    return "index";
  }

  @GetMapping("/login.html")
  public String login() {
    return "login";
  }

  @GetMapping("/register.html")
  public String register(HttpServletRequest request) {
    request.setAttribute("randomId", RandomUtil.randomNumbers(8));
    return "register";
  }
}
