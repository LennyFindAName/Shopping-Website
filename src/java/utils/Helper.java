/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Random;

/**
 *
 * @author DELL
 */
public class Helper {

    //Create OTP code
    public static String genRandSixDigit() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        //convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
    
    public static boolean isValidString(String string) {
        if (string == null || string.isEmpty()) {
            return false; // Password cannot be null or empty
        }

        int length = string.length();
        if (length < 6 || length > 18) {
            return false; // Length must be between 6 and 18 characters
        }

        // Regular expression to check for alphanumeric characters only (no special characters or whitespace)
        String pattern = "^[a-zA-Z0-9]+$";
        return string.matches(pattern);
    }
    public static String tachduoiGmail (String  string){
        //Chuc nang tach 
        String input = string;
        
        
        
        return input;
    }
}
