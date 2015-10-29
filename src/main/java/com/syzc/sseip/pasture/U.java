package com.syzc.sseip.pasture;

import org.jsoup.nodes.Document;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class U {
    public static void main(String[] args) {
        String u = "<div id=\"cmc_info\" class=\"cmc_info\" style=\"font-family: Arial; padding: 5px 0px; margin: 0px; width: 970px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(164, 184, 217); position: relative; z-index: 1000; color: rgb(0, 0, 0); font-size: 12px; line-height: normal; widows: 1; background-color: rgb(243, 246, 253); background-position: initial initial; background-repeat: initial initial;\"><div id=\"cmc_info_box\" style=\"padding: 0px; margin: 0px;\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"white-space: nowrap;\"><tbody><tr><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">客户名称：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\"><span id=\"guest_card_name\">pkd</span>&nbsp;<img src=\"http://www10.53kf.com/img/setting/guest_card.gif\" width=\"19\" height=\"12\" style=\"cursor: pointer;\"></td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">接待工号：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 170px; height: 1em;\">Doctor-She...(1164103928@qq.co...)</td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">IP地址：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 200px; height: 1em;\">印度 (49.15.146.116)</td></tr><tr><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">咨询页面：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\"><a target=\"_blank\" title=\"http://www.skdhospital.com/wapsbe/index.html\" href=\"http://www.skdhospital.com/wapsbe/index.html\" style=\"color: rgb(0, 51, 153);\">http://www.skdhospital.com/wapsb...</a></td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">访问来源：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\"><span title=\" 直接访问\" style=\"width: 220px; overflow: hidden; text-overflow: ellipsis; display: block; height: 1.2em;\">直接访问</span></td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">对话类型：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\"><span id=\"chat_theme_div\"></span>&nbsp;<a href=\"http://www10.53kf.com/setting/chat_msg_content.php?action=content&amp;talkid=69895635710&amp;arg=p10109915_10146619#\" style=\"color: rgb(0, 51, 153);\">[归类]</a></td></tr><tr><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">对话时间：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 180px; height: 1em;\">2015-10-28 10:59:36</td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">结束时间：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 170px; height: 1em;\">2015-10-28 11:05:53</td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">对话时长：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">00:06:17</td></tr><tr><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">开始方式：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">其它</td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">结束方式：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 170px; height: 1em;\">关闭网页</td><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">工号评分：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\"><span id=\"chat_vote_div\">-</span>&nbsp;<a href=\"http://www10.53kf.com/setting/chat_msg_content.php?action=content&amp;talkid=69895635710&amp;arg=p10109915_10146619#\" style=\"color: rgb(0, 51, 153);\">[修改]</a></td></tr><tr><td align=\"right\" style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\">客户轨迹：</td><td style=\"padding-top: 3px; padding-bottom: 3px; width: 60px;\"><a href=\"http://www10.53kf.com/setting/chat_msg_content.php?action=content&amp;talkid=69895635710&amp;arg=p10109915_10146619#\" style=\"color: rgb(0, 51, 153);\">[查看]</a></td></tr></tbody></table></div><div id=\"cmc_info_arrow\" class=\"\" style=\"padding: 0px; margin: 0px 0px 0px -43px; width: 86px; height: 10px; position: absolute; bottom: -10px; left: 485px; overflow: hidden; cursor: pointer; background-image: url(http://www10.53kf.com/style/setting/ver06/img/cmc_info_arrow.png); background-repeat: no-repeat no-repeat;\"></div></div><div id=\"cmc_content_text\" class=\"cmc_content_text\" style=\"font-family: Arial; padding: 0px; margin: 0px; overflow-x: hidden; overflow-y: auto; position: relative; color: rgb(0, 0, 0); font-size: 12px; line-height: normal; widows: 1; height: 357px;\"><div class=\"cmc_content_text_holder\" style=\"padding: 0px; margin: 0px;\"><div class=\"mnkf_dialog_receive\" style=\"padding: 0px; margin: 7px 20px 0px;\"><p class=\"time\" style=\"margin-bottom: 0px; padding: 0px; font-family: Tahoma; line-height: 24px; font-size: 12px;\">[工号] Doctor-Shelly (1164103928@qq.com) 说：(2015-10-28 10:59:36)</p><div class=\"msgbox qimsg2\" style=\"padding: 5px 10px; margin: 0px; display: inline-block; max-width: 218px; word-wrap: break-word; word-break: break-all; line-height: 14px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; position: relative; border: 1px solid rgb(224, 224, 224); background-color: rgb(243, 243, 243); background-position: initial initial; background-repeat: initial initial;\">Since many patients are on line,you can imput your name,gender,disease condition,email address,phone no and your question first.i will reply soon.Whatsapp/viber:008615631169290(Dr.Shelly Huston)Email:kidneyhow@hotmail.com<em class=\"dialog_arrow\" style=\"display: block; width: 7px; height: 11px; position: absolute; bottom: 6px; left: -7px; background: url(http://www10.53kf.com/style/setting/ver06/img/cmc_msg_arrow.png) 0px 0px no-repeat;\"></em></div></div><div class=\"mnkf_dialog_receive\" style=\"padding: 0px; margin: 7px 20px 0px;\"><p class=\"time\" style=\"margin-bottom: 0px; padding: 0px; font-family: Tahoma; line-height: 24px; font-size: 12px;\">[工号] Doctor-Shelly (1164103928@qq.com) 说：(2015-10-28 10:59:42)</p><div class=\"msgbox qimsg2\" style=\"padding: 5px 10px; margin: 0px; display: inline-block; max-width: 218px; word-wrap: break-word; word-break: break-all; line-height: 14px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; position: relative; border: 1px solid rgb(224, 224, 224); background-color: rgb(243, 243, 243); background-position: initial initial; background-repeat: initial initial;\">Hello,this is Dr.Shelly ,i m free this moment,any question about kidney problem,you can talk freely with me.<em class=\"dialog_arrow\" style=\"display: block; width: 7px; height: 11px; position: absolute; bottom: 6px; left: -7px; background: url(http://www10.53kf.com/style/setting/ver06/img/cmc_msg_arrow.png) 0px 0px no-repeat;\"></em></div></div><div class=\"mnkf_dialog_send\" style=\"padding: 0px; margin: 7px 20px 0px; text-align: right;\"><p class=\"time\" style=\"margin-bottom: 0px; padding: 0px; font-family: Tahoma; line-height: 24px; font-size: 12px;\">[客户] pkd 说：(2015-10-28 11:01:50)</p><div class=\"msgbox qimsg2\" style=\"padding: 5px 10px; margin: 0px; display: inline-block; max-width: 218px; word-wrap: break-word; word-break: break-all; text-align: left; line-height: 14px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; position: relative; border: 1px solid rgb(225, 240, 214); background-color: rgb(236, 251, 225); background-position: initial initial; background-repeat: initial initial;\">Akpd 9873669207 in. India<em class=\"dialog_arrow\" style=\"display: block; width: 7px; height: 11px; position: absolute; bottom: 6px; right: -7px; background: url(http://www10.53kf.com/style/setting/ver06/img/cmc_msg_arrow.png) -7px 0px no-repeat;\"></em></div></div><div class=\"mnkf_dialog_send\" style=\"padding: 0px; margin: 7px 20px 0px; text-align: right;\"><p class=\"time\" style=\"margin-bottom: 0px; padding: 0px; font-family: Tahoma; line-height: 24px; font-size: 12px;\">[客户] pkd 说：(2015-10-28 11:02:31)</p><div class=\"msgbox qimsg2\" style=\"padding: 5px 10px; margin: 0px; display: inline-block; max-width: 218px; word-wrap: break-word; word-break: break-all; text-align: left; line-height: 14px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; position: relative; border: 1px solid rgb(225, 240, 214); background-color: rgb(236, 251, 225); background-position: initial initial; background-repeat: initial initial;\">Ackpd<em class=\"dialog_arrow\" style=\"display: block; width: 7px; height: 11px; position: absolute; bottom: 6px; right: -7px; background: url(http://www10.53kf.com/style/setting/ver06/img/cmc_msg_arrow.png) -7px 0px no-repeat;\"></em></div></div><div class=\"mnkf_dialog_receive\" style=\"padding: 0px; margin: 7px 20px 0px;\"><p class=\"time\" style=\"margin-bottom: 0px; padding: 0px; font-family: Tahoma; line-height: 24px; font-size: 12px;\">[工号] Doctor-Shelly (1164103928@qq.com) 说：(2015-10-28 11:02:49)</p></div></div></div>";
        Document d;
        System.out.println(new Date());

        System.out.println(u.length());
        System.out.println(1 << 17);
//        for (int i = 0; i < 1 << 17; i++) {

//        d = Jsoup.parseBodyFragment(u);
//        System.out.println(d);
//        System.out.println(d.text());

//            d.getElementsByTag("a").get(1).attr("href");

//            d.select("a").first().attr("href");
//            System.out.println();

        /*if (i % 1024 == 0) {
                System.out.println(i);
            }*/
//        }

        System.out.println(new Date());

        /*
        for (Element e : d.getElementsByTag("a")) {
            System.out.println(e.attr("href"));
        }
*/
        Pattern p = Pattern.compile("[<]a.*?href.*?=.*?\"(http\\S*?)\"", Pattern.DOTALL);
        Matcher m;
        m = p.matcher(u);
        if (m.find()) {
            System.out.println(m.group(1));
        }

        /*for (int i = 0; i < 1 << 17; i++) {
            d = Jsoup.parseBodyFragment(u);
            m = p.matcher(u);
            if (i % 1024 == 0) {
                System.out.println(i);
            }
            if (m.find()) {
                m.group(1);
//                System.out.println(m.group(1));
            }
        }*/
        System.out.println(new Date());
    }
}