package com.trip.www.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Scenic {
    private Integer id;
    private String scenicName;
    private String address;
    private String province;
    private String city;
    private Integer hintId;
    private Integer titleId;
    private String introduce;
    private Integer floor_price;
    private String headline;
    private String coverImage;
    private Integer attractionsId;
}
