package com.trip.www.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScenicWay {
    private String id;
    private String way;
    private String scenicDay;
    private String description;
    private String endPath;
    private String startPath;
    private String status;
    private String floorPrice;
    private String titleId;
    private String mealId;
    private String attractionsId;
    private String scenicWayImage;
    private String minimumGroupSize;
    private String introduce;
    private String scenicId;
}
