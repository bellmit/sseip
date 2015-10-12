package com.syzc.sseip.pasture;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;

public class A {
    public static void main(String[] args) throws IOException {
        ApplicationContext ac = LocalAcUtil.getAc();
        DefaultKaptcha s = (DefaultKaptcha) ac.getBean("captchaProducer");
        String text = s.createText();

        BufferedImage bufferedImage = s.createImage(text);
        FileOutputStream fos = new FileOutputStream("e:/t.jpg");
        ImageIO.write(bufferedImage, "jpeg", fos);
        fos.close();
        System.out.println(text);
    }
/*
    public static void main(String[] args) throws IOException {
        ApplicationContext ac = LocalAcUtil.getAc();
        ImageCaptchaService s = (ImageCaptchaService) ac.getBean("captchaService");
        BufferedImage bufferedImage = s.getImageChallengeForID("123", Locale.CHINA);
        FileOutputStream fos = new FileOutputStream("e:/t.jpg");
        ImageIO.write(bufferedImage, "jpeg", fos);
        fos.close();
//        System.out.println(s.getChallengeForID("123", Locale.CHINA));

    }
*/
}