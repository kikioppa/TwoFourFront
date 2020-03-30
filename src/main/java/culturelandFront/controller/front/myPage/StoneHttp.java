package culturelandFront.controller.front.myPage;

import java.io.BufferedReader;

import java.io.InputStreamReader;

import java.net.HttpURLConnection;

import java.net.URL;



public class StoneHttp {

    public static void main(String[] args) {

        HttpURLConnection connection = null;

        try {

             // 요청 URL (예를 들어 제 홈페이지로)

             URL url = new URL("https://ksnet/test/rfb/retail/deposit");

             connection = (HttpURLConnection)url.openConnection();

             // 요청 방식 (GET or POST)

             connection.setRequestMethod("GET");

             // 요청 응답 타임아웃 설정

             connection.setConnectTimeout(3000);

             // 읽기 타임아웃 설정

             connection.setReadTimeout(3000);

             // 컨텐츠의 캐릭터셋이 euc-kr 이라면 (connection.getInputStream(), "euc-kr")

             BufferedReader reader = new BufferedReader(new InputStreamReader(

                  connection.getInputStream())); 

             StringBuffer buffer = new StringBuffer(); 

             int read = 0; 

             char[] cbuff = new char[1024]; 

             while ((read = reader.read(cbuff)) > 0) { 

                   buffer.append(cbuff, 0, read); 

             }

             reader.close();

             System.out.println(buffer.toString()); 

        } catch (Exception e) {

             e.printStackTrace();

        } finally {

             if (connection != null) {

                  connection.disconnect();

             }

        }

   }

} 