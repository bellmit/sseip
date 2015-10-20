package com.syzc.sseip.pasture.dummy;

import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.util.LocalAcUtil;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class DummyCustomer {
    static SecureRandom r = new SecureRandom();

    public static void main(String[] args) throws IOException {
        CustomerDao s = (CustomerDao) LocalAcUtil.getAc().getBean("customerDao");
        System.out.println(s);
        Customer c;
        System.out.println(new Date());
        ArrayList<Customer> list;
        final int count = 30000;
        list = new ArrayList<>(count);
        for (int i = 0; i < 600000; i++) {
//        for (int i = 0; i < 600; i++) {
            c = gen();
//            System.out.println(JSON.toJSONString(c, true));
            list.add(c);
            if (list.size() >= count - 1) {
                System.out.println(new Date());
                s.addAllDummies(list);
                list.clear();
            }
        }
        s.addAllDummies(list);
        System.out.println(new Date());
    }

    public static Customer gen() throws IOException {
        Customer c;

/*
        Long liaisonCountryId = r.nextInt(498 - 250) + 250L;
        Long patientCountryId = r.nextInt(498 - 250) + 250L;
*/
        Long liaisonCountryId = r.nextInt(249 - 1) + 1L;
        Long patientCountryId = r.nextInt(249 - 1) + 1L;
        String liaisonName = N7ParseNamesSet.parseArr().get(r.nextInt(N7ParseNamesSet.parseArr().size()));
        String patientName = N7ParseNamesSet.parseArr().get(r.nextInt(N7ParseNamesSet.parseArr().size()));
        String liaisonAddress = RandomSimpleCnString.genString(r.nextInt(50) + 16);
        String patientAddress = RandomSimpleCnString.genString(r.nextInt(50) + 16);
        String relationship = RandomSimpleCnString.genString(r.nextInt(10) + 2);
        String symptom = SymptomSetParser.simpleSymptom(r.nextInt(4) + 1);
        HospitalizationType hospitalization = HospitalizationType.values()[r.nextInt(HospitalizationType.values().length)];
        Boolean emergency = r.nextBoolean();
        String email = RandomSimpleEnString.genString(r.nextInt(30) + 2) + "@example.com";
        String tel = String.valueOf(RandomTelNum.genTel());
        Long diseaseTypeId = r.nextInt(42 - 1) + 1L;
        Long websiteId = r.nextInt(24 - 1) + 1L;
        String memo = RandomSimpleCnString.genString(r.nextInt(400) + 5);
        String contactRecoreds = RandomSimpleCnString.genString(r.nextInt(400) + 5);
        Byte stars = (byte) (r.nextInt(5 - 1) + 1);
        Boolean valid = r.nextBoolean();

        Long userId = r.nextInt(50 - 1) + 1L;
        Long groupId = r.nextInt(3) + 1L;

        Sex sex = Sex.values()[r.nextInt(Sex.values().length)];
        Short age = (short) (r.nextInt(73));

        Calendar tm, tmx;
        tm = Calendar.getInstance();
        tmx = Calendar.getInstance();
        tm.set(2010, 0, 1);

        c = new Customer();
        c.setLiaisonCountryId(liaisonCountryId);
        c.setPatientCountryId(patientCountryId);
        c.setLiaisonName(liaisonName);
        c.setPatientName(patientName);
        c.setLiaisonAddress(liaisonAddress);
        c.setPatientAddress(patientAddress);
        c.setRelationship(relationship);
        c.setSymptom(symptom);
        c.setHospitalization(hospitalization);
        c.setEmergency(emergency);
        c.setEmail(email);
        c.setTel(tel);
        c.setDiseaseTypeId(diseaseTypeId);
        c.setWebsiteId(websiteId);
        c.setMemo(memo);
        c.setContactRecoreds(contactRecoreds);
        c.setStars(stars);
        c.setValid(valid);
        c.setUserId(userId);
        c.setGroupId(groupId);

        c.setSex(sex);
        c.setAge(age);

        c.setAdded(RandomDate.gen());

/*
        System.out.println(liaisonCountryId);
        System.out.println(patientCountryId);
        System.out.println(liaisonName);
        System.out.println(patientName);
        System.out.println(liaisonAddress);
        System.out.println(patientAddress);
        System.out.println(relationship);
        System.out.println(symptom);
        System.out.println(hospitalization);
        System.out.println(emergency);
        System.out.println(email);
        System.out.println(tel);
        System.out.println(diseaseTypeId);
        System.out.println(websiteId);
        System.out.println(memo);
        System.out.println(contactRecoreds);
        System.out.println(stars);
        System.out.println(valid);

        System.out.println(userId);
        System.out.println(groupId);
*/

        return c;
    }

    public static Customer gen2() throws IOException {
        Customer c;

        Long liaisonCountryId = r.nextInt(498 - 250) + 250L;
        Long patientCountryId = r.nextInt(498 - 250) + 250L;
        String liaisonName = N7ParseNamesSet.parseArr().get(r.nextInt(N7ParseNamesSet.parseArr().size()));
        String patientName = N7ParseNamesSet.parseArr().get(r.nextInt(N7ParseNamesSet.parseArr().size()));
        String liaisonAddress = RandomSimpleCnString.genString(r.nextInt(80) + 16);
        String patientAddress = RandomSimpleCnString.genString(r.nextInt(80) + 16);
        String relationship = RandomSimpleCnString.genString(r.nextInt(10) + 2);
        String symptom = SymptomSetParser.simpleSymptom(r.nextInt(10) + 1);
        HospitalizationType hospitalization = HospitalizationType.values()[r.nextInt(HospitalizationType.values().length)];
        Boolean emergency = r.nextBoolean();
        String email = RandomSimpleCnString.genString(r.nextInt(30) + 2) + "@example.com";
        String tel = String.valueOf(RandomTelNum.genTel());
        Long diseaseTypeId = r.nextInt(44 - 3) + 3L;
        Long websiteId = r.nextInt(24 - 1) + 1L;
        String memo = RandomSimpleCnString.genString(r.nextInt(400) + 5);
        String contactRecoreds = RandomSimpleCnString.genString(r.nextInt(400) + 5);
        Byte stars = (byte) (r.nextInt(5 - 1) + 1);
        Boolean valid = r.nextBoolean();

        Long userId = r.nextInt(27 - 3) + 3L;
        Long groupId = r.nextInt(2) + 1L;

        Sex sex = Sex.values()[r.nextInt(Sex.values().length)];
        Short age = (short) (r.nextInt(73));

        c = new Customer();
        c.setLiaisonCountryId(liaisonCountryId);
        c.setPatientCountryId(patientCountryId);
        c.setLiaisonName(liaisonName);
        c.setPatientName(patientName);
        c.setLiaisonAddress(liaisonAddress);
        c.setPatientAddress(liaisonAddress);
        c.setRelationship(relationship);
        c.setSymptom(symptom);
        c.setHospitalization(hospitalization);
        c.setEmergency(emergency);
        c.setEmail(email);
        c.setTel(tel);
        c.setDiseaseTypeId(diseaseTypeId);
        c.setWebsiteId(websiteId);
        c.setMemo(memo);
        c.setContactRecoreds(contactRecoreds);
        c.setStars(stars);
        c.setValid(valid);
        c.setUserId(userId);
        c.setGroupId(groupId);

        c.setSex(sex);
        c.setAge(age);

/*
        System.out.println(liaisonCountryId);
        System.out.println(patientCountryId);
        System.out.println(liaisonName);
        System.out.println(patientName);
        System.out.println(liaisonAddress);
        System.out.println(patientAddress);
        System.out.println(relationship);
        System.out.println(symptom);
        System.out.println(hospitalization);
        System.out.println(emergency);
        System.out.println(email);
        System.out.println(tel);
        System.out.println(diseaseTypeId);
        System.out.println(websiteId);
        System.out.println(memo);
        System.out.println(contactRecoreds);
        System.out.println(stars);
        System.out.println(valid);

        System.out.println(userId);
        System.out.println(groupId);
*/

        return c;
    }
}