package com.syzc.sseip.pasture;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

public class Fb {
    public static void main(String[] args) throws IOException, TemplateException {
        Configuration c = new Configuration(Configuration.getVersion());
        Template t = new Template("a", "${v?html}", c);
        Map<String, String> m = new HashMap<>();
        String v = "${(['a'].seq_contains(v))?then('Y','N')}";
        m.put("v", null);
        StringWriter w = new StringWriter();
        t.process(m, w);
        System.out.println(w.toString());
    }
}