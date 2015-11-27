package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSONReader;
import com.syzc.sseip.entity.CustomerDto;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class ContactRecordsPractice {
    public static void main(String[] args) throws IOException {
        JSONReader jr = new JSONReader(new BufferedReader(new FileReader("e:/customer-details.json")));
        jr.startArray();
        CustomerDto dto;

        ArrayList<Integer> al = new ArrayList(6900);
        Integer len;
        for (; jr.hasNext(); ) {
            dto = (CustomerDto) jr.readObject(CustomerDto.class);
            if (dto.getContactRecords() != null) {
                if (dto.getContactRecords() == null) {
                    continue;
                }
                len = dto.getContactRecords().length();
                al.add(len);
                System.out.println(len);
            }
        }
        jr.endArray();
        jr.close();

        Collections.sort(al);
        for (int i = al.size() - 30; i < al.size(); i++) {
            System.out.println(al.get(i));
        }

    }
}