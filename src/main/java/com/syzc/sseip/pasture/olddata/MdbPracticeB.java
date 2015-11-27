package com.syzc.sseip.pasture.olddata;

import java.sql.*;

public class MdbPracticeB {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\TechUser\\Documents\\Tencent Files\\1750863471\\FileRecv\\yingwen.mdb");
        System.out.println(conn);
        PreparedStatement ps;
//        ps = conn.prepareStatement("select count(1) from 查询");
        ps = conn.prepareStatement("select * from 查询");

        ResultSet resultSet = ps.executeQuery();

//        ArrayList<Long> al = new ArrayList(6586);
//        LinkedList<Long> ll = new LinkedList<>();
        Long l;
        String str;
        while (resultSet.next()) {
//            str = resultSet.getString("LtRecord");
//            System.out.println(str);

            System.out.println("===");
//            System.out.println(resultSet.getLong("Age"));
//            System.out.println(resultSet.getInt("Age"));
            System.out.println(resultSet.getString("Age"));

//            System.out.println(l);
        }
//        Collections.sort(al);

/*
        System.out.println("====");
        for (int i = 6580; i < al.size(); i++) {
            System.out.println(al.get(i));
        }
*/

        conn.close();
    }
}