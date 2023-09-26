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

import com.hta.movieplus.service.MovieServiceImpl;

//영진위 영화 상세정보 api
@RestController
public class MovieDetailApi {

	private static final Logger logger = LoggerFactory.getLogger(MovieDetailApi.class);

	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@GetMapping("movieDetail")
	public List<Map<String, Object>> getDetailAPI(HttpServletRequest request){
		List<Map<String, Object>> movieDetailList = new ArrayList<>();
		
		logger.info("getDetailAPI");
		
		try {
			RestTemplate restTemplate = new RestTemplate();
			
			HttpHeaders header = new HttpHeaders();
			HttpEntity<?> entity = new HttpEntity<>(header);
			String url = " http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml";
			
			UriComponents uri = UriComponentsBuilder
					.fromHttpUrl(url + "?" + "key=1f350fefe347ef77d02d8539b0583cd6&movieCd=").build();
			
			ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
			
			// JSON 데이터를 Map으로 변환
            Map<String, Object> responseBody = resultMap.getBody();
            
            Map<String, Object> movieDetailResult = (Map<String, Object>) responseBody.get("movieDetailResult");
            List<Map<String, Object>> movieDetail = (List<Map<String, Object>>) movieDetailResult.get("movieDetail");
			
            for(Map<String, Object> detailData: movieDetail) {
            	
            }
			
		} catch (HttpClientErrorException | HttpServerErrorException e) {
            // 오류 처리
            e.printStackTrace();
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
        }
		
		return null;
	}
	
}
