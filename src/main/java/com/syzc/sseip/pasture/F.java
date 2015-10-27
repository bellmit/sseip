package com.syzc.sseip.pasture;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

public class F {
    public static void main(String[] args) throws IOException, TemplateException {
        Configuration c = new Configuration(Configuration.getVersion());
        Template t = new Template("a", "${v?html}", c);
        Map<String, String> m = new HashMap<>();
        String v = "<a href=\"#\" class=\"tooltip-show\" data-toggle=\"tooltip\" data-placement=\"bottom\" data-html=\"true\" data-trigger=\"click\" data-container=\"body\" data-content=\"阿伯次的额佛歌\" title=\"<a href=&quot;http://www.baidu.com&quot;>baidu</a>show\">Tooltip 方法 show</a>";
        m.put("v", v);
        StringWriter w = new StringWriter();
        t.process(m, w);
        System.out.println(w.toString());
    }
}