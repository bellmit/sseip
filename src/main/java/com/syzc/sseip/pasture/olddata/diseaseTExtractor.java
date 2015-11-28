package com.syzc.sseip.pasture.olddata;

import java.util.HashMap;
import java.util.Map;

public class DiseaseTExtractor {
    public static Map<String, Long> diseaseTMap = new HashMap<>();

    static {
        diseaseTMap.put("肾衰竭", 44L);
        diseaseTMap.put("肾囊肿", 24L);
        diseaseTMap.put("尿毒症", 38L);
        diseaseTMap.put("IGA", 40L);
        diseaseTMap.put("紫癜肾", 7L);
        diseaseTMap.put("肾功能不全", 39L);
        diseaseTMap.put("糖尿病", 43L);
        diseaseTMap.put("高血压肾病", 29L);
        diseaseTMap.put("其他", 45L);
        diseaseTMap.put("肾炎", 46L);
        diseaseTMap.put("肾综", 4L);
        diseaseTMap.put("多囊肾", 23L);
        diseaseTMap.put("狼疮肾", 6L);
        diseaseTMap.put("糖尿病肾病", 9L);
    }

    public static void main(String[] args) {
        System.out.println(diseaseTMap.get("糖尿病肾病"));
    }
}