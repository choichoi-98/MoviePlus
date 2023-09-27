package com.hta.movieplus.api.RestApi;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void updateMovieActors(@RequestParam("movie_cd") String movieCd) {
		
		try {
			RestTemplate restTemplate = new RestTemplate();
			
			HttpHeaders header = new HttpHeaders();
			HttpEntity<?> entity = new HttpEntity<>(header);
			String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
			
			UriComponents uri = UriComponentsBuilder
					.fromHttpUrl
					(url + "?" + "key=1f350fefe347ef77d02d8539b0583cd6&&movieCd=" + movieCd)
					.build();
			
			ResponseEntity<Map> resultMap =
					restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
			
			//Json -> Map
			Map<String, Object> responseBody = resultMap.getBody();
			Map<String, Object> movieDetailResult 
				= (Map<String, Object>) responseBody.get("movieDetailResult");
			
			//출연배우 정보를 가져와서 MovieServiceImpl를 사용하여 업데이트
			List<Map<String,Object>> actorsList 
				= (List<Map<String, Object>>)movieDetailResult.get("actors");
			if(actorsList != null && !actorsList.isEmpty()) {
				StringBuilder actors = new StringBuilder();
				for(Map<String, Object> actorData : actorsList) {
					String actorName = (String) actorData.get("peopleNm");
					actors.append(actorName).append(", ");
				}
				//마지막 쉽표와 공백 제거
				if(actors.length()>2) {
					actors.delete(actors.length()-2, actors.length());
				}
				
				//MovieServiceImpl를 사용하셔 해당 영화의 출연배우 정보 업데이트
				movieServiceImpl.updateMovieActors(movieCd, actors.toString());
			}
		}catch (HttpClientErrorException | HttpServerErrorException e) {
            // 오류 처리
            e.printStackTrace();
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
        }
		
	}
	
}
