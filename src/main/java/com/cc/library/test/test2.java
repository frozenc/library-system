package com.cc.library.test;

public class test2 {
    public static void main(String[] args) {
        int n = 65;//100001
        n |= n >>> 1;//100001 | 010000 = 110001
        System.out.println(n);
        n |= n >>> 2;//110001 | 001100 = 111101
        System.out.println(n);
        n |= n >>> 4;//111101 | 000011 = 111111
        System.out.println(n);
        n |= n >>> 8;
        System.out.println(n);
        n |= n >>> 16;
        System.out.println(n);

        //9%4 = 9&3 101&011 = 1
    }
}
