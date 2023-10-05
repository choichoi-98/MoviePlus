package com.hta.movieplus.api.RestApi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hta.movieplus.service.MovieServiceImpl;

@Controller
public class TestMoviePosterApi {
	private static final Logger logger = LoggerFactory.getLogger(TestMoviePosterApi.class);
	
	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@RequestMapping("/testView")
	public String go() {
		return "movie/apiTest";
	}
	
	@ResponseBody
	@RequestMapping("/updatePosters")
	public String updatePosters(
			@RequestParam(value="codeNo",  required=false)String codeNo,
			@RequestParam(value="posterUrl",  required=false)String posterUrl,
			@RequestParam(value="stillUrl", required=false)String stillUrl,
			@RequestParam(value="plotText", required=false)String plotText)
			{
		movieServiceImpl.updatePoster
		(codeNo, posterUrl, stillUrl, plotText.toString());
		
		return "success";
		
		
	}
	
	@ResponseBody
	@RequestMapping("/apitest")
    public String main( ) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?ServiceKey=0Z2PBI9JO3233XM11892&collection=kmdb_new2&detail=y&releaseDts=20230101"); /*URL*/
        urlBuilder.append("&" + URLEncoder.encode("title", "UTF-8") + "=" + URLEncoder.encode("거미집", "UTF-8")); /*상영년도*/
        urlBuilder.append("&" + URLEncoder.encode("director", "UTF-8") + "=" + URLEncoder.encode("김지운", "UTF-8")); /*상영 월*/

        System.out.println(urlBuilder.toString());
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        System.out.println("결과:" + sb.toString());
        
        
        
		return sb.toString();
    }
}
