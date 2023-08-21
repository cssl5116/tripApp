package com.trip.www.controller;

import com.trip.www.entity.User;
import com.trip.www.service.UserService;
import com.trip.www.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
  @Resource
  UserService userService;

  // 生成图形验证码
  @GetMapping("/captcha/{randomId}")
  public void imgCode(HttpServletRequest request, HttpServletResponse response, @PathVariable String randomId) {
    userService.createImgCode(randomId, request, response);
  }

  // 发送手机验证码
  @PostMapping("/code")
  @ResponseBody
  public Result<String> sendCode(@RequestParam String phone, HttpSession session) {
    return userService.sendCode(phone, session);
  }

  // 用户注册
  @PostMapping("/register")
  public String register(User user, String randomId) {
    System.out.println(user + "," + randomId);
    boolean flag = userService.register(user, randomId);
    return "index";
  }
}
