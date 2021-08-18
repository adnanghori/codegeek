package com.codegeek.helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;


public class Helper {

    public static boolean deleteFile(String path) {
        boolean check = false;
        try {

            File file = new File(path);
            check = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;

    }

    public static boolean saveFile(InputStream inputstream, String path) {
        boolean check = false;

        try {
            byte bite [] = new byte[inputstream.available()];

            inputstream.read(bite);

            FileOutputStream fileoutputstream = new FileOutputStream(path);

            fileoutputstream.write(bite);

            fileoutputstream.flush();
            fileoutputstream.close();
            check = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;

    }
}
