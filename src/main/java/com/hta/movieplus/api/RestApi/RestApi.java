package com.hta.movieplus.api.RestApi;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.hta.movieplus.controller.MemberController;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.service.MovieServiceImpl;

//일별 박스오피스
@RestController
public class RestApi {
	
	private static final Logger logger = LoggerFactory.getLogger(RestApi.class);


	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@GetMapping("movie")
    public List<Map<String, Object>> getAPI(HttpServletRequest request) {
        List<Map<String, Object>> filteredMovieList = new ArrayList<>();
       
        logger.info("getAPI");
        
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

            // "prdtStatNm"이 "개봉", "개봉 예정"인 데이터만 선택 후 filteredMovieList에 저장
            for (Map<String, Object> movieData : movieList) {
                String prdtStatNm = (String) movieData.get("prdtStatNm");
                String genreAlt = (String) movieData.get("genreAlt");
                if(!"성인물(에로)".equals(genreAlt)) {
                	if ("개봉".equals(prdtStatNm) || "개봉 예정".equals(prdtStatNm)) {
                		Movie movie = new Movie();
                		movie.setMovie_Code((String) movieData.get("movieCd")); 		//영화번호(코드)
                		movie.setMovie_Title((String) movieData.get("movieNm"));		//영화제목
                		movie.setMovie_Director((String) movieData.get("peopleNm"));	//영화감독
                		movie.setMovie_Genre((String) movieData.get("repGenreNm"));	//대표장르
                		movie.setMovie_OpenDate((String) movieData.get("openDt"));	//개봉일
                		movie.setMovie_Release((String) movieData.get("prdtStatNm"));//개봉상태(개봉, 개봉예정)
                		filteredMovieList.add(movieData);
                		
                		logger.info("for문");
                		Movie returnmovie = movieServiceImpl.select((String) movieData.get("movieCd"));
                		if(returnmovie == null) {
                			movieServiceImpl.insert(movie);
                		}
                		
                	}
                }
            }
            
            
            //filteredMovieList를 Movie 엔티티로 변환하고 저장
            

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
