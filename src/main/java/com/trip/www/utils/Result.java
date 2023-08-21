package com.trip.www.utils;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Result<T> {
  private String code;

  private String msg;

  private T data;

  public Result(T data) {
    this.data = data;
  }

  public static <T> Result<T> success() {
    Result<T> result = new Result<>();
    result.setCode("200");
    result.setMsg("success");
    return result;
  }

  public static <T> Result<T> success(T data) {
    Result<T> result = new Result<>(data);
    result.setCode("200");
    result.setMsg("success");
    return result;
  }

  public static <T> Result<T> fail(String code, String msg) {
    Result<T> result = new Result<>();
    result.setCode(code);
    result.setMsg(msg);
    return result;
  }

  public static <T> Result<T> fail(String code, String msg, T data) {
    Result<T> result = new Result<>(data);
    result.setCode(code);
    result.setMsg(msg);
    return result;
  }
}

