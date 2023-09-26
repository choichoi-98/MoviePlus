package com.hta.movieplus.api.RestApi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

//일별 박스오피스
@RestController
public class RestApi {
	

	@GetMapping("movie")
    public List<Map<String, Object>> getAPI(HttpServletRequest request) {
        List<Map<String, Object>> filteredMovieList = new ArrayList<>();

        try {
            RestTemplate restTemplate = new RestTemplate();

            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
            String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";

            UriComponents uri = UriComponentsBuilder
                    .fromHttpUrl(url + "?" + "key=1f350fefe347ef77d02d8539b0583cd6&itemPerPage=100&openStartDt=2023").build();

            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);

            // JSON 데이터를 Map으로 변환
            Map<String, Object> responseBody = resultMap.getBody();

            // "movieListResult" 항목에서 "movieList" 데이터 추출
            Map<String, Object> movieListResult = (Map<String, Object>) responseBody.get("movieListResult");
            List<Map<String, Object>> movieList = (List<Map<String, Object>>) movieListResult.get("movieList");

            // "prdtStatNm"이 "개봉"인 데이터만 선택
            for (Map<String, Object> movie : movieList) {
                String prdtStatNm = (String) movie.get("prdtStatNm");
                String genreAlt = (String) movie.get("genreAlt");
                if(!"성인물(에로)".equals(genreAlt)) {
                	if ("개봉".equals(prdtStatNm) || "개봉예정".equals(prdtStatNm)) {
                		filteredMovieList.add(movie);
                	}
                }
            }

        } catch (HttpClientErrorException | HttpServerErrorException e) {
            // 오류 처리
            e.printStackTrace();
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
        }
        
        return filteredMovieList;
    }
}
