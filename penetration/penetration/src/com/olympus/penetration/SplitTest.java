package com.olympus.penetration;

	
//As your problem/requirements are not all that complex a custom method can be utilized that performs over 20 times faster and produces the same results. This is variable based on the data size and number of rows parsed, and for more complicated problems using regular expressions is a must.

import java.util.Arrays;
import java.util.ArrayList;
public class SplitTest {

public static void main(String[] args) {

  
	
	
	//String s = "Sachin,,M,\"Maths,Science,English\",Need to improve in these subjects.";
	
	String s = "09,151P,Surg Endo - Uro/Gyn,\"$498,989.57\",\"$8,946,109.22\",5.58%";

    String[] splitted = null;

 //Measure Regular Expression
    long startTime = System.nanoTime();
    //for(int i=0; i<10; i++)
    //splitted = s.split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
    long endTime =   System.nanoTime();

    //System.out.println("Took: " + (endTime-startTime));
   // System.out.println(Arrays.toString(splitted));
   // System.out.println("");


    ArrayList<String> sw = null;        
 //Measure Custom Method
            startTime = System.nanoTime();
    for(int i=0; i<10; i++)
    	sw = customSplitSpecific(s);
    
    endTime =   System.nanoTime();

   // System.out.println("Took: " + (endTime-startTime));
    //System.out.println(sw);   
    
    
    for (String str : sw) { // iterating ArrayList
		System.out.println("DATA:" + str + "---");
	}
    
}

public static ArrayList<String> customSplitSpecific(String s) {
    ArrayList<String> words = new ArrayList<String>();
    boolean notInsideComma = true;
    int start =0, end=0;
    for(int i=0; i<s.length()-1; i++)
    {
        if(s.charAt(i)==',' && notInsideComma)
        {
            words.add(s.substring(start,i));
            start = i+1;                
        }   
        else if(s.charAt(i)=='"')
        notInsideComma=!notInsideComma;
    }
    words.add(s.substring(start));
    return words;
}  

}
