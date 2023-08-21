package com.trip.www.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.trip.www.entity.User;
import com.trip.www.utils.Result;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface UserService extends IService<User> {
  boolean register(User user, String randomId);

  void createImgCode(String randomId, HttpServletRequest request, HttpServletResponse response);

  Result<String> sendCode(String phone, HttpSession session);
}
