package com.syzc.sseip.pasture;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.safety.Whitelist;

public class J {
    public static void main(String[] args) {
        Document.OutputSettings os = new Document.OutputSettings();
        os.prettyPrint(false);
        String str = Jsoup.clean("<script>1234;</script><div><a onclick=\"\"><img /><span></span></a></div><span>asdf", "", Whitelist.relaxed(), os);
        System.out.println(str);
    }
}