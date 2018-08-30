package com.lecheng.test;

public class Test2 {
    public static void main(String[] arg) {
        new Thread(() -> {
            System.out.println("Hello Lambda !");
        }).start();
        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("hello2");
            }
        }).start();
    }
}
