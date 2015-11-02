package com.syzc.sseip.pasture;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class U2 {
    //    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!www10.53kf.com)(\\S*?)/|\"", Pattern.DOTALL);
//    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!www10.53kf.com)(.*?)(/|\")", Pattern.DOTALL);
    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!www10.53kf.com)(\\S*?)[?#;/\"]", Pattern.DOTALL);

    public static void main(String[] args) {
//        Matcher m = achorHrefPattern.matcher("<a href=\"http://ri.search.yahoo.com/_ylt=AwrBT4Aa1DFWTrIA556l87UF;_ylu=X3oDMTByMjB0aG5zBGNvbG8DYmYxBHBvcwMxBHZ0aWQDBHNlYwNzYw--/RV=2/RE=1446134938/RO=10/RU=http%3a%2f%2fwww.yahoo.com%2fpolitics%2fcruz-and-rubio-score-points-by-bashing-media-032804180.html/RK=0/RS=DF7Sx_gEL4ynRdHnrRF5GMWC2xg-\">asdfa</a>");
//        Matcher m = achorHrefPattern.matcher("<a href=\"http://ri.search.yahoo.com/\"/_ylt=AwrBT4Aa1DFWTrIA556l87UF;_ylu=X3oDMTByMjB0aG5zBGNvbG8DYmYxBHBvcwMxBHZ0aWQDBHNlYwNzYw--/RV=2/RE=1446134938/RO=10/RU=http%3a%2f%2fwww.yahoo.com%2fpolitics%2fcruz-and-rubio-score-points-by-bashing-media-032804180.html/RK=0/RS=DF7Sx_gEL4ynRdHnrRF5GMWC2xg-\">asdfa</a>");
        Matcher m = achorHrefPattern.matcher("<div id=\"cappsarea123\" class=\"icon on-apps-icon\">                  <div class=\"wrap clearfix\">                    <div class=\"curr-icon-wrap\">                                          </div>                  <div class=\"detail\">                    <dl><dt>                        <h5>社区</h5>                      </dt><dd> <a href=\"http://blog.csdn.net?ref=toolbar\" target=\"_blank\">博客</a></dd><dd> <a href=\"http://bbs.csdn.net?ref=toolbar\" target=\"_blank\">论坛</a></dd><dd> <a href=\"http://download.csdn.net?ref=toolbar\" target=\"_blank\">下载</a></dd><dd><a href=\"http://ask.csdn.net?ref=toolbar\" target=\"_blank\">技术问答</a></dd><dd><a href=\"http://geek.csdn.net?ref=toolbar\" target=\"_blank\">极客头条</a></dd></dl>                  </div>                  <div class=\"detail\">                    <dl><dt>                        <h5>服务</h5>                      </dt><dd> <a href=\"http://edu.csdn.net?ref=toolbar\" target=\"_blank\">学院</a></dd><dd> <a href=\"https://code.csdn.net?ref=toolbar\" target=\"_blank\">CODE</a></dd><dd> <a href=\"http://huiyi.csdn.net/?ref=toolbar\" target=\"_blank\">活动</a></dd><dd> <a href=\"http://www.csto.com?ref=toolbar\" target=\"_blank\">CSTO</a></dd><dd> <a href=\"http://mall.csdn.net?ref=toolbar\" target=\"_blank\">C币兑换</a></dd></dl>                  </div>                  <div class=\"detail last\">                    <dl><dt>                        <h5>俱乐部</h5>                      </dt><dd> <a href=\"http://cto.csdn.net?ref=toolbar\" target=\"_blank\">CTO俱乐部</a></dd><dd> <a href=\"http://student.csdn.net?ref=toolbar\" target=\"_blank\">高校俱乐部</a></dd></dl>                  </div>                </div>              </div>                              ");
/*
        Matcher m = achorHrefPattern.matcher("<div><table class=\"fw\"><tbody><tr><td class=\"vt\">        \n" +
                "    </td>\n" +
                "    <td class=\"post-signature owner\">\n" +
                "        <div class=\"user-info \">\n" +
                "    <div class=\"user-action-time\">\n" +
                "        asked <span title=\"2014-02-28 08:57:39Z\" class=\"relativetime\">Feb 28 '14 at 8:57</span>\n" +
                "    </div>\n" +
                "    <div class=\"user-gravatar32\">\n" +
                "        <a href=\"http://stackoverflow.com/users/2634436/martyn\"><div class=\"gravatar-wrapper-32\"><img src=\"https://www.gravatar.com/avatar/18b419170d717b5cf3a88e57e2230d6d?s=32&amp;d=identicon&amp;r=PG\" alt=\"\" height=\"32\" width=\"32\"></div></a>\n" +
                "    </div>\n" +
                "    <div class=\"user-details\">\n" +
                "        <a href=\"http://stackoverflow.com/users/2634436/martyn\">Martyn</a><br>\n" +
                "        <span class=\"reputation-score\" title=\"reputation score \" dir=\"ltr\">471</span><span title=\"3 silver badges\"><span class=\"badge2\"></span><span class=\"badgecount\">3</span></span><span title=\"18 bronze badges\"><span class=\"badge3\"></span><span class=\"badgecount\">18</span></span>\n" +
                "    </div>\n" +
                "</div>\n" +
                "    </td>\n" +
                "    </tr>\n" +
                "    </tbody></table>\n" +
                "</div>\n" +
                "\n" +
                "        \n" +
                "                \n" +
                "\n" +
                "    \n" +
                "    \n" +
                "\t    <div id=\"comments-22090426\" class=\"comments \">\n" +
                "\t\t    <table>\n" +
                "                <tbody data-remaining-comments-count=\"0\" data-canpost=\"false\" data-cansee=\"true\" data-comments-unavailable=\"false\" data-addlink-disabled=\"true\">\n" +
                "\n" +
                "\n" +
                "\n" +
                "    <tr id=\"comment-33505244\" class=\"comment \">\n" +
                "        <td>\n" +
                "            <table>\n" +
                "                <tbody>\n" +
                "                    <tr>\n" +
                "                        <td class=\" comment-score\">\n" +
                "                                &nbsp;&nbsp;\n" +
                "                        </td>\n" +
                "                        <td>\n" +
                "                                &nbsp;\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                </tbody>\n" +
                "            </table>\n" +
                "        </td>\n" +
                "        <td class=\"comment-text\">\n" +
                "            <div style=\"display: block;\" class=\"comment-body\">\n" +
                "                <span class=\"comment-copy\">can you provide a fiddle.</span>\n" +
                "                    –&nbsp;<a href=\"http://stackoverflow.com/users/2248054/http\" title=\"632 reputation\" class=\"comment-user\">HTTP</a>\n" +
                "                <span class=\"comment-date\" dir=\"ltr\"><span title=\"2014-02-28 09:11:58Z\" class=\"relativetime-clean\">Feb 28 '14 at 9:11</span></span>\n" +
                "                                                                            </div>\n" +
                "                    </td>\n" +
                "    </tr>\n" +
                "                </tbody>\n" +
                "\t\t    </table>\n" +
                "\t    </div>\n" +
                "\n" +
                "        <div id=\"comments-link-22090426\" data-rep=\"50\" data-anon=\"true\">\n" +
                "\n" +
                "                <a class=\"js-add-link comments-link disabled-link \" title=\"Use comments to ask for more information or suggest improvements. Avoid answering questions in comments.\">add a comment</a>\n" +
                "            \n" +
                "        </div>         \n" +
                "    \n" +
                "        \n" +
                "\n" +
                "\n" +
                "\t\t\t<div id=\"answers\">\n" +
                "\n" +
                "\t\t\t\t<a name=\"tab-top\"></a>\n" +
                "\t\t\t\t<div id=\"answers-header\">\n" +
                "\t\t\t\t\t<div class=\"subheader answers-subheader\">\n" +
                "\t\t\t\t\t\t<h2>\n" +
                "\t\t\t\t\t\t\t\t3 Answers\n" +
                "                                \n" +
                "\t\t\t\t\t\t</h2>\n" +
                "\t\t\t\t\t\t<div>\n" +
                "\t\t\t\t\t\t\t<div id=\"tabs\">\n" +
                "        <a href=\"http://stackoverflow.com/questions/22090426/bootstrap-collapse-change-button-to-read-less-on-click?answertab=active#tab-top\" data-nav-xhref=\"\" title=\"Answers with the latest activity first\" data-value=\"active\">active</a>\n" +
                "        <a href=\"http://stackoverflow.com/questions/22090426/bootstrap-collapse-change-button-to-read-less-on-click?answertab=oldest#tab-top\" data-nav-xhref=\"\" title=\"Answers in the order they were provided\" data-value=\"oldest\">oldest</a>\n" +
                "        <a class=\"youarehere\" href=\"http://stackoverflow.com/questions/22090426/bootstrap-collapse-change-button-to-read-less-on-click?answertab=votes#tab-top\" data-nav-xhref=\"\" title=\"Answers with the highest score first\" data-value=\"votes\">votes</a>\n" +
                "</div>\n" +
                "\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t</div>    \n" +
                "\t\t\t\t</div>    \n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "  \n" +
                "<a name=\"22090804\"></a>\n" +
                "<div id=\"answer-22090804\" class=\"answer\" data-answerid=\"22090804\" itemscope=\"\" itemtype=\"http://schema.org/Answer\">\n" +
                "    <table>\n" +
                "        <tbody><tr>\n" +
                "            <td class=\"votecell\">\n" +
                "                \n" +
                "\n" +
                "<div class=\"vote\">\n" +
                "        \n" +
                "        <a class=\"vote-up-off\" title=\"This answer is useful\">up vote</a>\n" +
                "        <span itemprop=\"upvoteCount\" class=\"vote-count-post \">0</span>\n" +
                "        <a class=\"vote-down-off\" title=\"This answer is not useful\">down vote</a>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "</div>\n" +
                "\n" +
                "            </td>\n" +
                "            \n" +
                "\n" +
                "\n" +
                "<td class=\"answercell\">\n" +
                "    <div class=\"post-text\" itemprop=\"text\">\n" +
                "<p>Why not just create your own jquery listener for this like</p>\n" +
                "\n" +
                "<pre><code>&lt;a class=\"btn btn-default\" class = \"readbtn\" data-toggle=\"collapse\" data-parent=\"#threeW\" href=\"#what\" role=\"button\"&gt;Read More &amp;raquo;&lt;/a&gt;\n" +
                "\n" +
                "$('.readbtn').on('click', function() { \n" +
                "  $(this).html('Read less);\n" +
                "});\n" +
                "</code></pre></div></td></tr></tbody></table></div></div>");
*/
        if (m.find()) {
            System.out.println(m.groupCount());
            System.out.println(m.group(0));
            System.out.println(m.group(1));
        } else {
            System.out.println("not found.");
        }

    }
}