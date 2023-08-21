package com.trip.www.utils;

import cn.hutool.core.util.StrUtil;

public class RegexUtils {
  /**
   * 是否是无效手机格式
   * @param phone 要校验的手机号
   * @return true:符合，false：不符合
   */
  public static boolean isPhoneInvalid(String phone) {
    return mismatch(phone, "^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$");
  }

  // 校验是否不符合正则格式
  private static boolean mismatch(String str, String regex) {
    if (StrUtil.isBlank(str)) {
      return true;
    }
    return !str.matches(regex);
  }
}
