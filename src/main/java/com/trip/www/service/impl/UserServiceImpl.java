package com.trip.www.service.impl;

import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.code.kaptcha.Producer;
import com.trip.www.entity.User;
import com.trip.www.mapper.UserMapper;
import com.trip.www.service.UserService;
import com.trip.www.utils.RedisConstant;
import com.trip.www.utils.RegexUtils;
import com.trip.www.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
  @Resource
  private Producer captchaProducer;
  @Resource
  private StringRedisTemplate stringRedisTemplate;

  @Override
  public boolean register(User user, String randomId) {
    // 1. 校验手机号
    if (RegexUtils.isPhoneInvalid(user.getIphone())) {
      // 2. 如果不符合,返回错误信息
      return false;
    }
    String imgCodeKey = RedisConstant.IMG_CODE + randomId;
    String phoneCodeKey = RedisConstant.PHONE_CODE + user.getIphone();
    String imgCode = stringRedisTemplate.opsForValue().get(imgCodeKey);
//    if (imgCode == null || imgCode.equals())
    String phoneCode = stringRedisTemplate.opsForValue().get(phoneCodeKey);
    return false;
  }

  @Override
  public void createImgCode(String randomId, HttpServletRequest request, HttpServletResponse response) {
    String captchaText = captchaProducer.createText();
    log.info("验证码内容: {}", captchaText);
    // 保存验证码到redis
    String key = RedisConstant.IMG_CODE + randomId;
    stringRedisTemplate.opsForValue().set(key, captchaText);
    stringRedisTemplate.expire(key, RedisConstant.CODE_TTL, TimeUnit.MINUTES);
    // 输出图片
    BufferedImage image = captchaProducer.createImage(captchaText);
    try {
      ServletOutputStream outputStream = response.getOutputStream();
      ImageIO.write(image, "jpg", outputStream);
      outputStream.flush();
      outputStream.close();
    } catch (IOException e) {
      log.error("获取输出流错误: {}", e.getMessage());
    }
  }

  @Override
  public Result<String> sendCode(String phone, HttpSession session) {
    // 1. 校验手机号
    if (RegexUtils.isPhoneInvalid(phone)) {
      // 2. 如果不符合,返回错误信息
      return Result.fail("-1001", "手机号格式错误!");
    }
    // 3. TODO:符合,模拟生成验证码
    String code = RandomUtil.randomNumbers(6);
    // 4. 保存验证码到redis
    stringRedisTemplate.opsForValue()
        .set(RedisConstant.PHONE_CODE + phone, code, RedisConstant.CODE_TTL, TimeUnit.MINUTES);
    // 5. 发送验证码
    log.info("发送短信验证码成功,验证码: {}", code);
    return Result.success();
  }
}
