package com.cc.library.test;

public class DeadLockDemo {
    public static void main(String[] args) {
        String s1 = "11111";
        String s2 = "22222";
        Thread t1 = new Thread(new Demo(s1, s2));
        Thread t2 = new Thread(new Demo(s2, s1));
        t1.start();
        t2.start();
    }
}

class Demo implements Runnable {
    String resource1;
    String resource2;

    public Demo(String resource1, String resource2) {
        this.resource1 = resource1;
        this.resource2 = resource2;
    }

    @Override
    public void run() {
        synchronized (resource1) {
            System.out.println(Thread.currentThread() + resource1);
            try {
                Thread.sleep(1000);

            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(Thread.currentThread() + resource2);
            synchronized (resource2) {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}