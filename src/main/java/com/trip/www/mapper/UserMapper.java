package com.trip.www.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.trip.www.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {
}
