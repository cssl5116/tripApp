package com.trip.www.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.trip.www.entity.Scenic;
import com.trip.www.mapper.ScenicMapper;
import com.trip.www.service.ScenicService;
import org.springframework.stereotype.Service;

@Service
public class ScenicServiceImpl extends ServiceImpl<ScenicMapper, Scenic> implements ScenicService {
}
