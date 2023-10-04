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

//kmdb 영화상세정보 api
@RestController
public class MoviePosterApi {

	private static final Logger logger = LoggerFactory.getLogger(MoviePosterApi.class);
	
	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@GetMapping("moviePoster")
	public Map<String, Object> updateMoviePoster(
			@RequestParam(value="movieTitle", defaultValue="잠", required=false)String movieTitle,
			@RequestParam(value="movieDirector", defaultValue="유재선", required=false)String movieDirector
			){
		
		Map<String, Object> kmdbData = null;
		Map<String, Object> moviePosterResult = null;

		try {
			RestTemplate restTemplate = new RestTemplate();
			
			HttpHeaders header = new HttpHeaders();
			HttpEntity<?> entity = new HttpEntity<>(header);
			String url = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp";
			
			UriComponents uri = UriComponentsBuilder
					.fromHttpUrl
					(url + "?" + "ServiceKey=0Z2PBI9JO3233XM11892&collection=kmdb_new2&detail=y&releaseDts=20230101"
							+ "&title=" + movieTitle + "&director=" + movieDirector)
					.build();
			
			ResponseEntity<Map> resultMap =
					restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
			
			//Json -> Map
			Map<String, Object> responseBody = resultMap.getBody();
			kmdbData
				= (Map<String, Object>) responseBody.get("Data");
			logger.info(kmdbData.toString());
			
			moviePosterResult
				= (Map<String, Object>) responseBody.get("Result");
			logger.info(moviePosterResult.toString());
			
			//moviePosterResult(rowdata의 Result)에서 필요한 데이터 뽑아내기
			//외부코드
			Map<String,Object> commCodes 
			= (Map<String, Object>)moviePosterResult.get("commCodes");
			logger.info("commCodes=" + commCodes.toString());
			
			Map<String,Object> commCode 
			= (Map<String, Object>)commCodes.get("commCode");
			logger.info("commCode=" + commCode.toString());
			
			String codeNo = (String)commCode.get("codeNo");
			logger.info("codeNo=" + codeNo.toString());
			
			//포스터 url
			String posterUrl = (String) moviePosterResult.get("posters");
			logger.info("posterUrl: " + posterUrl.toString());
			
			//스틸컷 url
			String stillUrl = (String) moviePosterResult.get("stills");
			logger.info("StringUrl: " + stillUrl.toString());
			
			//줄거리 
			List<Map<String, Object>> plots
				= (List<Map<String, Object>>) moviePosterResult.get("plots");
			String plotText = null;
			if(plots != null && !plots.isEmpty()) {
				Map<String, Object> plot = plots.get(0);
				plotText = (String) plot.get("plotText");
				
				logger.info("resultPlot: " + plotText.toString());
			}
			
			movieServiceImpl.updatePoster
				(codeNo, posterUrl, stillUrl, plotText.toString());
			
			
		} catch (HttpClientErrorException | HttpServerErrorException e) {
            // 오류 처리
            e.printStackTrace();
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
        }
		return kmdbData;
	}
	
}
