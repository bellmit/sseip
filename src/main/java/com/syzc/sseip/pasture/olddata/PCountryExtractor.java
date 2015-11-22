package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSON;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.lang.StringUtils;

import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PCountryExtractor {
    static Map<String, Long> cmap = new HashMap<>(), emap = new HashMap<>();
    static List<String> clist = new LinkedList(), elist = new LinkedList();
    private static Map<String, Pattern> cp = new HashMap<>();

    static {
        s();

        clist.addAll(cmap.keySet());
        elist.addAll(emap.keySet());

        Collections.sort(clist, new AnoComp());
        Collections.sort(elist, new AnoComp());

        for (String i : emap.keySet()) {
            cp.put(i, Pattern.compile(String.format("\\b%s\\b", StringUtils.lowerCase(i))));
        }
    }

    private static Long v(String text) {
//    public static Set<Long> v(String text) {
        Set<Long> s = new HashSet<>();
        for (String i : clist) {
            if (text.contains(i)) {
//                s.add(cmap.get(i));
                return cmap.get(i);
            }
        }

        for (String i : elist) {
            if (cp.get(i).matcher(StringUtils.lowerCase(text)).find()) {
//                s.add(emap.get(i));
                return emap.get(i);
            }
        }
        return null;
    }

    private static Pattern pContactCountry = Pattern.compile("IP地址:[&]nbsp;(\\w+)[(]", Pattern.UNICODE_CHARACTER_CLASS);

    public static Long t(CSVRecord c) {
        Matcher am;

        if (v(c.get("Address")) != null) {
            return v(c.get("Address"));
        } else if (v(c.get("kfuseraddr")) != null) {
            return v(c.get("kfuseraddr"));
        } else {
            am = pContactCountry.matcher(c.get("LtRecord"));
            if (am.find()) {
                if (v(am.group(1)) != null) {
                    return v(am.group(1));
                }
            }
        }
        return null;
    }

    public static void main(String[] args) throws IOException {
//        System.out.println(JSON.toJSONString(cmap, true));
//        System.out.println(JSON.toJSONString(emap, true));

        System.out.println(JSON.toJSONString(clist));
        System.out.println(JSON.toJSONString(elist));

        /*for (String s : clist) {
            System.out.println(s);
        }*/

        CSVRecord c;
        Iterator<CSVRecord> ite = Extractor.ext().iterator();
        int cnt = 0;
//        IP地址:&nbsp;印度
//        IP地址:&nbsp;印度(
        Pattern cp = Pattern.compile("IP地址:[&]nbsp;(\\w+)[(]", Pattern.UNICODE_CHARACTER_CLASS);
        Matcher am;
        String cty;
        String cty2;
        for (; ite.hasNext(); ) {
            c = ite.next();

/*
            if (t(c) == null) {
                System.out.println(c.getRecordNumber());
                System.out.println(c.get("Address"));
                System.out.println(c.get("kfuseraddr"));
            }
*/

//            System.out.println(t(c));

            /*if (c.get("Address").length() > 0 && !c.get("Address").equals("无") && v(c.get("Address")) == null) {
                if (c.get("LtRecord").length() > 0) {
                    am = cp.matcher(c.get("LtRecord"));
                    if (!am.find()) {
//                        kfuseraddr
                        if (c.get("kfuseraddr").length() > 0) {
                            if (v(c.get("kfuseraddr")) == null) {
                                System.out.println(c.get("kfuseraddr"));
                                System.out.println(c.getRecordNumber());
                            }
                        }
                    }
                }
            }*/

        }
        System.out.println(cnt);
    }

    private static class AnoComp implements Comparator<String> {
        @Override
        public int compare(String o1, String o2) {
            if (o1.length() > o2.length()) {
                return -1;
            } else if (o1.length() == o2.length()) {
                return 0;
            } else {
                return 1;
            }
        }
    }

    public static void s() {
        cmap.put("安道尔", 1L);
        cmap.put("阿联酋", 2L);
        cmap.put("阿富汗", 3L);
        cmap.put("安提瓜和巴布达", 4L);
        cmap.put("安圭拉", 5L);
        cmap.put("阿尔巴尼亚", 6L);
        cmap.put("亚美尼亚", 7L);
        cmap.put("安哥拉", 8L);
        cmap.put("南极洲", 9L);
        cmap.put("阿根廷", 10L);
        cmap.put("美属萨摩亚", 11L);
        cmap.put("奥地利", 12L);
        cmap.put("澳大利亚", 13L);
        cmap.put("阿鲁巴", 14L);
        cmap.put("奥兰", 15L);
        cmap.put("阿塞拜疆", 16L);
        cmap.put("波斯尼亚和黑塞哥维那", 17L);
        cmap.put("巴巴多斯", 18L);
        cmap.put("孟加拉", 19L);
        cmap.put("比利时", 20L);
        cmap.put("布基纳法索", 21L);
        cmap.put("保加利亚", 22L);
        cmap.put("巴林", 23L);
        cmap.put("布隆迪", 24L);
        cmap.put("贝宁", 25L);
        cmap.put("圣巴泰勒米", 26L);
        cmap.put("百慕大", 27L);
        cmap.put("文莱", 28L);
        cmap.put("玻利维亚", 29L);
        cmap.put("加勒比荷兰", 30L);
        cmap.put("巴西", 31L);
        cmap.put("巴哈马", 32L);
        cmap.put("不丹", 33L);
        cmap.put("布韦岛", 34L);
        cmap.put("博茨瓦纳", 35L);
        cmap.put("白俄罗斯", 36L);
        cmap.put("伯利兹", 37L);
        cmap.put("加拿大", 38L);
        cmap.put("科科斯（基林）群岛", 39L);
        cmap.put("民主刚果", 40L);
        cmap.put("中非共和国", 41L);
        cmap.put("刚果", 42L);
        cmap.put("瑞士", 43L);
        cmap.put("科特迪瓦", 44L);
        cmap.put("库克群岛", 45L);
        cmap.put("智利", 46L);
        cmap.put("喀麦隆", 47L);
        cmap.put("中国", 48L);
        cmap.put("哥伦比亚", 49L);
        cmap.put("哥斯达黎加", 50L);
        cmap.put("古巴", 51L);
        cmap.put("佛得角", 52L);
        cmap.put("库拉索", 53L);
        cmap.put("圣诞岛", 54L);
        cmap.put("塞浦路斯", 55L);
        cmap.put("捷克", 56L);
        cmap.put("德国", 57L);
        cmap.put("吉布提", 58L);
        cmap.put("丹麦", 59L);
        cmap.put("多米尼克", 60L);
        cmap.put("多米尼加", 61L);
        cmap.put("阿尔及利亚", 62L);
        cmap.put("厄瓜多尔", 63L);
        cmap.put("爱沙尼亚", 64L);
        cmap.put("埃及", 65L);
        cmap.put("撒拉威阿拉伯民主共和国", 66L);
        cmap.put("厄立特里亚", 67L);
        cmap.put("西班牙", 68L);
        cmap.put("埃塞俄比亚", 69L);
        cmap.put("芬兰", 70L);
        cmap.put("斐济", 71L);
        cmap.put("福克兰群岛", 72L);
        cmap.put("密克罗尼西亚联邦", 73L);
        cmap.put("法罗群岛", 74L);
        cmap.put("法国", 75L);
        cmap.put("加蓬", 76L);
        cmap.put("英国", 77L);
        cmap.put("格林纳达", 78L);
        cmap.put("格鲁吉亚", 79L);
        cmap.put("法属圭亚那", 80L);
        cmap.put("根西", 81L);
        cmap.put("加纳", 82L);
        cmap.put("直布罗陀", 83L);
        cmap.put("格陵兰", 84L);
        cmap.put("冈比亚", 85L);
        cmap.put("几内亚", 86L);
        cmap.put("瓜德罗普", 87L);
        cmap.put("赤道几内亚", 88L);
        cmap.put("希腊", 89L);
        cmap.put("南乔治亚和南桑威奇群岛", 90L);
        cmap.put("危地马拉", 91L);
        cmap.put("关岛", 92L);
        cmap.put("几内亚比绍", 93L);
        cmap.put("圭亚那", 94L);
        cmap.put("香港", 95L);
        cmap.put("赫德岛和麦克唐纳群岛", 96L);
        cmap.put("洪都拉斯", 97L);
        cmap.put("克罗地亚", 98L);
        cmap.put("海地", 99L);
        cmap.put("匈牙利", 100L);
        cmap.put("印度尼西亚", 101L);
        cmap.put("爱尔兰", 102L);
        cmap.put("以色列", 103L);
        cmap.put("马恩岛", 104L);
        cmap.put("印度", 105L);
//        cmap.put("英属印度洋领地", 106L);
        cmap.put("伊拉克", 107L);
        cmap.put("伊朗", 108L);
        cmap.put("冰岛", 109L);
        cmap.put("意大利", 110L);
        cmap.put("泽西", 111L);
        cmap.put("牙买加", 112L);
        cmap.put("约旦", 113L);
        cmap.put("日本", 114L);
        cmap.put("肯尼亚", 115L);
        cmap.put("吉尔吉斯斯坦", 116L);
        cmap.put("柬埔寨", 117L);
        cmap.put("基里巴斯", 118L);
        cmap.put("科摩罗", 119L);
        cmap.put("圣基茨和尼维斯", 120L);
        cmap.put("朝鲜", 121L);
        cmap.put("韩国", 122L);
        cmap.put("科威特", 123L);
        cmap.put("开曼群岛", 124L);
        cmap.put("哈萨克斯坦", 125L);
        cmap.put("老挝", 126L);
        cmap.put("黎巴嫩", 127L);
        cmap.put("圣卢西亚", 128L);
        cmap.put("列支敦士登", 129L);
        cmap.put("斯里兰卡", 130L);
        cmap.put("利比里亚", 131L);
        cmap.put("莱索托", 132L);
        cmap.put("立陶宛", 133L);
        cmap.put("卢森堡", 134L);
        cmap.put("拉脱维亚", 135L);
        cmap.put("利比亚", 136L);
        cmap.put("摩洛哥", 137L);
        cmap.put("摩纳哥", 138L);
        cmap.put("摩尔多瓦", 139L);
        cmap.put("黑山", 140L);
        cmap.put("圣马丁行政区", 141L);
        cmap.put("马达加斯加", 142L);
        cmap.put("马绍尔群岛", 143L);
        cmap.put("马其顿共和国 马其顿", 144L);
        cmap.put("马里", 145L);
        cmap.put("缅甸", 146L);
        cmap.put("蒙古国", 147L);
        cmap.put("澳门", 148L);
        cmap.put("北马里亚纳群岛", 149L);
        cmap.put("马提尼克", 150L);
        cmap.put("毛里塔尼亚", 151L);
        cmap.put("蒙特塞拉特", 152L);
        cmap.put("马耳他", 153L);
        cmap.put("毛里求斯", 154L);
        cmap.put("马尔代夫", 155L);
        cmap.put("马拉维", 156L);
        cmap.put("墨西哥", 157L);
        cmap.put("马来西亚", 158L);
        cmap.put("莫桑比克", 159L);
        cmap.put("纳米比亚", 160L);
        cmap.put("新喀里多尼亚", 161L);
        cmap.put("尼日尔", 162L);
        cmap.put("诺福克岛", 163L);
        cmap.put("尼日利亚", 164L);
        cmap.put("尼加拉瓜", 165L);
        cmap.put("荷兰", 166L);
        cmap.put("挪威", 167L);
        cmap.put("尼泊尔", 168L);
        cmap.put("瑙鲁", 169L);
        cmap.put("纽埃", 170L);
        cmap.put("新西兰", 171L);
        cmap.put("阿曼", 172L);
        cmap.put("巴拿马", 173L);
        cmap.put("秘鲁", 174L);
        cmap.put("法属波利尼西亚", 175L);
        cmap.put("巴布亚新几内亚", 176L);
        cmap.put("菲律宾", 177L);
        cmap.put("巴基斯坦", 178L);
        cmap.put("波兰", 179L);
        cmap.put("圣皮埃尔和密克隆", 180L);
        cmap.put("皮特凯恩群岛", 181L);
        cmap.put("波多黎各", 182L);
        cmap.put("巴勒斯坦", 183L);
        cmap.put("葡萄牙", 184L);
        cmap.put("帕劳", 185L);
        cmap.put("巴拉圭", 186L);
        cmap.put("卡塔尔", 187L);
        cmap.put("留尼汪", 188L);
        cmap.put("罗马尼亚", 189L);
        cmap.put("塞尔维亚", 190L);
        cmap.put("俄罗斯", 191L);
        cmap.put("卢旺达", 192L);
        cmap.put("沙特阿拉伯", 193L);
        cmap.put("所罗门群岛", 194L);
        cmap.put("塞舌尔", 195L);
        cmap.put("苏丹", 196L);
        cmap.put("瑞典", 197L);
        cmap.put("新加坡", 198L);
        cmap.put("圣赫勒拿", 199L);
        cmap.put("斯洛文尼亚", 200L);
        cmap.put("挪威 斯瓦尔巴群岛和扬马延岛", 201L);
        cmap.put("斯洛伐克", 202L);
        cmap.put("塞拉利昂", 203L);
        cmap.put("圣马力诺", 204L);
        cmap.put("塞内加尔", 205L);
        cmap.put("索马里", 206L);
        cmap.put("苏里南", 207L);
        cmap.put("南苏丹", 208L);
        cmap.put("圣多美和普林西比", 209L);
        cmap.put("萨尔瓦多", 210L);
        cmap.put("荷属圣马丁", 211L);
        cmap.put("叙利亚", 212L);
        cmap.put("斯威士兰", 213L);
        cmap.put("特克斯和凯科斯群岛", 214L);
        cmap.put("乍得", 215L);
        cmap.put("法属南部领地", 216L);
        cmap.put("多哥", 217L);
        cmap.put("泰国", 218L);
        cmap.put("塔吉克斯坦", 219L);
        cmap.put("托克劳", 220L);
        cmap.put("东帝汶", 221L);
        cmap.put("土库曼斯坦", 222L);
        cmap.put("突尼斯", 223L);
        cmap.put("汤加", 224L);
        cmap.put("土耳其", 225L);
        cmap.put("特立尼达", 226L);
        cmap.put("图瓦卢", 227L);
        cmap.put("台湾", 228L);
        cmap.put("坦桑尼亚", 229L);
        cmap.put("乌克兰", 230L);
        cmap.put("乌干达", 231L);
        cmap.put("美国本土外小岛屿", 232L);
        cmap.put("美国", 233L);
        cmap.put("乌拉圭", 234L);
        cmap.put("乌兹别克斯坦", 235L);
        cmap.put("梵蒂冈", 236L);
        cmap.put("圣文森特和格林纳丁斯", 237L);
        cmap.put("委内瑞拉", 238L);
        cmap.put("英属维尔京群岛", 239L);
        cmap.put("美属维京群岛", 240L);
        cmap.put("越南", 241L);
        cmap.put("瓦努阿图", 242L);
        cmap.put("瓦利斯和富图纳", 243L);
        cmap.put("萨摩亚", 244L);
        cmap.put("也门", 245L);
        cmap.put("马约特", 246L);
        cmap.put("南非", 247L);
        cmap.put("赞比亚", 248L);
        cmap.put("津巴布韦", 249L);

        emap.put("Andorra", 1L);
        emap.put("United Arab Emirates", 2L);
        emap.put("Afghanistan", 3L);
        emap.put("Antigua and Barbuda", 4L);
        emap.put("Anguilla", 5L);
        emap.put("Albania", 6L);
        emap.put("Armenia", 7L);
        emap.put("Angola", 8L);
        emap.put("Antarctica", 9L);
        emap.put("Argentina", 10L);
        emap.put("American Samoa", 11L);
        emap.put("Austria", 12L);
        emap.put("Australia", 13L);
        emap.put("Aruba", 14L);
        emap.put("Åland Islands", 15L);
        emap.put("Azerbaijan", 16L);
        emap.put("Bosnia and Herzegovina", 17L);
        emap.put("Barbados", 18L);
        emap.put("Bangladesh", 19L);
        emap.put("Belgium", 20L);
        emap.put("Burkina Faso", 21L);
        emap.put("Bulgaria", 22L);
        emap.put("Bahrain", 23L);
        emap.put("Burundi", 24L);
        emap.put("Benin", 25L);
        emap.put("Saint Barthélemy", 26L);
        emap.put("Bermuda", 27L);
        emap.put("Brunei Darussalam", 28L);
        emap.put("Bolivia, Plurinational State of", 29L);
        emap.put("Bonaire, Sint Eustatius and Saba", 30L);
        emap.put("Brazil", 31L);
        emap.put("Bahamas", 32L);
        emap.put("Bhutan", 33L);
        emap.put("Bouvet Island", 34L);
        emap.put("Botswana", 35L);
        emap.put("Belarus", 36L);
        emap.put("Belize", 37L);
        emap.put("Canada", 38L);
        emap.put("Cocos (Keeling) Islands", 39L);
        emap.put("Congo, the Democratic Republic of the", 40L);
        emap.put("Central African Republic", 41L);
        emap.put("Congo", 42L);
        emap.put("Switzerland", 43L);
        emap.put("Côte d'Ivoire", 44L);
        emap.put("Cook Islands", 45L);
        emap.put("Chile", 46L);
        emap.put("Cameroon", 47L);
        emap.put("China", 48L);
        emap.put("Colombia", 49L);
        emap.put("Costa Rica", 50L);
        emap.put("Cuba", 51L);
        emap.put("Cabo Verde", 52L);
        emap.put("Curaçao", 53L);
        emap.put("Christmas Island", 54L);
        emap.put("Cyprus", 55L);
        emap.put("Czech Republic", 56L);
        emap.put("Germany", 57L);
        emap.put("Djibouti", 58L);
        emap.put("Denmark", 59L);
        emap.put("Dominica", 60L);
        emap.put("Dominican Republic", 61L);
        emap.put("Algeria", 62L);
        emap.put("Ecuador", 63L);
        emap.put("Estonia", 64L);
        emap.put("Egypt", 65L);
        emap.put("Western Sahara", 66L);
        emap.put("Eritrea", 67L);
        emap.put("Spain", 68L);
        emap.put("Ethiopia", 69L);
        emap.put("Finland", 70L);
        emap.put("Fiji", 71L);
        emap.put("Falkland Islands (Malvinas)", 72L);
        emap.put("Micronesia, Federated States of", 73L);
        emap.put("Faroe Islands", 74L);
        emap.put("France", 75L);
        emap.put("Gabon", 76L);
        emap.put("United Kingdom of Great Britain and Northern Ireland", 77L);
        emap.put("Grenada", 78L);
        emap.put("Georgia", 79L);
        emap.put("French Guiana", 80L);
        emap.put("Guernsey", 81L);
        emap.put("Ghana", 82L);
        emap.put("Gibraltar", 83L);
        emap.put("Greenland", 84L);
        emap.put("Gambia", 85L);
        emap.put("Guinea", 86L);
        emap.put("Guadeloupe", 87L);
        emap.put("Equatorial Guinea", 88L);
        emap.put("Greece", 89L);
        emap.put("South Georgia and the South Sandwich Islands", 90L);
        emap.put("Guatemala", 91L);
        emap.put("Guam", 92L);
        emap.put("Guinea-Bissau", 93L);
        emap.put("Guyana", 94L);
        emap.put("Hong Kong", 95L);
        emap.put("Heard Island and McDonald Islands", 96L);
        emap.put("Honduras", 97L);
        emap.put("Croatia", 98L);
        emap.put("Haiti", 99L);
        emap.put("Hungary", 100L);
        emap.put("Indonesia", 101L);
        emap.put("Ireland", 102L);
        emap.put("Israel", 103L);
        emap.put("Isle of Man", 104L);
        emap.put("India", 105L);
//        emap.put("British Indian Ocean Territory", 106L);
        emap.put("Iraq", 107L);
        emap.put("Iran, Islamic Republic of", 108L);
        emap.put("Iceland", 109L);
        emap.put("Italy", 110L);
        emap.put("Jersey", 111L);
        emap.put("Jamaica", 112L);
        emap.put("Jordan", 113L);
        emap.put("Japan", 114L);
        emap.put("Kenya", 115L);
        emap.put("Kyrgyzstan", 116L);
        emap.put("Cambodia", 117L);
        emap.put("Kiribati", 118L);
        emap.put("Comoros", 119L);
        emap.put("Saint Kitts and Nevis", 120L);
        emap.put("Korea, Democratic People's Republic of", 121L);
        emap.put("Korea, Republic of", 122L);
        emap.put("Kuwait", 123L);
        emap.put("Cayman Islands", 124L);
        emap.put("Kazakhstan", 125L);
        emap.put("Lao People's Democratic Republic", 126L);
        emap.put("Lebanon", 127L);
        emap.put("Saint Lucia", 128L);
        emap.put("Liechtenstein", 129L);
        emap.put("Sri Lanka", 130L);
        emap.put("Liberia", 131L);
        emap.put("Lesotho", 132L);
        emap.put("Lithuania", 133L);
        emap.put("Luxembourg", 134L);
        emap.put("Latvia", 135L);
        emap.put("Libya", 136L);
        emap.put("Morocco", 137L);
        emap.put("Monaco", 138L);
        emap.put("Moldova, Republic of", 139L);
        emap.put("Montenegro", 140L);
        emap.put("Saint Martin (French part)", 141L);
        emap.put("Madagascar", 142L);
        emap.put("Marshall Islands", 143L);
        emap.put("Macedonia, the former Yugoslav Republic of", 144L);
        emap.put("Mali", 145L);
        emap.put("Myanmar", 146L);
        emap.put("Mongolia", 147L);
        emap.put("Macao", 148L);
        emap.put("Northern Mariana Islands", 149L);
        emap.put("Martinique", 150L);
        emap.put("Mauritania", 151L);
        emap.put("Montserrat", 152L);
        emap.put("Malta", 153L);
        emap.put("Mauritius", 154L);
        emap.put("Maldives", 155L);
        emap.put("Malawi", 156L);
        emap.put("Mexico", 157L);
        emap.put("Malaysia", 158L);
        emap.put("Mozambique", 159L);
        emap.put("Namibia", 160L);
        emap.put("New Caledonia", 161L);
        emap.put("Niger", 162L);
        emap.put("Norfolk Island", 163L);
        emap.put("Nigeria", 164L);
        emap.put("Nicaragua", 165L);
        emap.put("Netherlands", 166L);
        emap.put("Norway", 167L);
        emap.put("Nepal", 168L);
        emap.put("Nauru", 169L);
        emap.put("Niue", 170L);
        emap.put("New Zealand", 171L);
        emap.put("Oman", 172L);
        emap.put("Panama", 173L);
        emap.put("Peru", 174L);
        emap.put("French Polynesia", 175L);
        emap.put("Papua New Guinea", 176L);
        emap.put("Philippines", 177L);
        emap.put("Pakistan", 178L);
        emap.put("Poland", 179L);
        emap.put("Saint Pierre and Miquelon", 180L);
        emap.put("Pitcairn", 181L);
        emap.put("Puerto Rico", 182L);
        emap.put("Palestine, State of", 183L);
        emap.put("Portugal", 184L);
        emap.put("Palau", 185L);
        emap.put("Paraguay", 186L);
        emap.put("Qatar", 187L);
        emap.put("Réunion", 188L);
        emap.put("Romania", 189L);
        emap.put("Serbia", 190L);
        emap.put("Russian Federation", 191L);
        emap.put("Rwanda", 192L);
        emap.put("Saudi Arabia", 193L);
        emap.put("Solomon Islands", 194L);
        emap.put("Seychelles", 195L);
        emap.put("Sudan", 196L);
        emap.put("Sweden", 197L);
        emap.put("Singapore", 198L);
        emap.put("Saint Helena, Ascension and Tristan da Cunha", 199L);
        emap.put("Slovenia", 200L);
        emap.put("Svalbard and Jan Mayen", 201L);
        emap.put("Slovakia", 202L);
        emap.put("Sierra Leone", 203L);
        emap.put("San Marino", 204L);
        emap.put("Senegal", 205L);
        emap.put("Somalia", 206L);
        emap.put("Suriname", 207L);
        emap.put("South Sudan", 208L);
        emap.put("Sao Tome and Principe", 209L);
        emap.put("El Salvador", 210L);
        emap.put("Sint Maarten (Dutch part)", 211L);
        emap.put("Syrian Arab Republic", 212L);
        emap.put("Swaziland", 213L);
        emap.put("Turks and Caicos Islands", 214L);
        emap.put("Chad", 215L);
        emap.put("French Southern Territories", 216L);
        emap.put("Togo", 217L);
        emap.put("Thailand", 218L);
        emap.put("Tajikistan", 219L);
        emap.put("Tokelau", 220L);
        emap.put("Timor-Leste", 221L);
        emap.put("Turkmenistan", 222L);
        emap.put("Tunisia", 223L);
        emap.put("Tonga", 224L);
        emap.put("Turkey", 225L);
        emap.put("Trinidad and Tobago", 226L);
        emap.put("Tuvalu", 227L);
        emap.put("Taiwan, Province of China", 228L);
        emap.put("Tanzania, United Republic of", 229L);
        emap.put("Ukraine", 230L);
        emap.put("Uganda", 231L);
        emap.put("United States Minor Outlying Islands", 232L);
        emap.put("United States of America", 233L);
        emap.put("Uruguay", 234L);
        emap.put("Uzbekistan", 235L);
        emap.put("Holy See", 236L);
        emap.put("Saint Vincent and the Grenadines", 237L);
        emap.put("Venezuela, Bolivarian Republic of", 238L);
        emap.put("Virgin Islands, British", 239L);
        emap.put("Virgin Islands, U.S.", 240L);
        emap.put("Viet Nam", 241L);
        emap.put("Vanuatu", 242L);
        emap.put("Wallis and Futuna", 243L);
        emap.put("Samoa", 244L);
        emap.put("Yemen", 245L);
        emap.put("Mayotte", 246L);
        emap.put("South Africa", 247L);
        emap.put("Zambia", 248L);
        emap.put("Zimbabwe", 249L);

        emap.put("indu", 105L);
        emap.put("yindu", 105L);
        cmap.put("斯里拉卡", 130L);
        cmap.put("塞拉利", 203L);
        cmap.put("沙特啊拉伯", 193L);
        cmap.put("印尼", 101L);
        emap.put("Tanzania", 229L);
        cmap.put("马来", 158L);
        emap.put("Banglore", 105L);

    }
}