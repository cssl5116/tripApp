package com.trip.www.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户信息表
 */
@TableName("user")
@Data
public class User implements Serializable {
  /**
   * 主键编号
   */
  private Integer id;
  /**
   * 用户名
   */
  private String username;
  /**
   * 用户密码
   */
  private String userPass;
  /**
   * 真实姓名
   */
  private String realName;
  /**
   * 手机号码
   */
  private String iphone;
}
