package com.syzc.sseip.pasture.olddata;

import java.io.IOException;

public class FakeCommand {
    public static void main(String[] args) {
        try {
            RjsonB.main(null);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}