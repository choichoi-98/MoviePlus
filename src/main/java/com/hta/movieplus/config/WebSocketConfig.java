package com.hta.movieplus.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.hta.movieplus.handler.SocketHandler;
/*
 * WebSocketConfig 클래스
   -WebSocketConfigurer 구현체
   
 */
@Configuration 
@EnableWebSocket //WebSocket 활성화
public class WebSocketConfig implements WebSocketConfigurer{

	private static final Logger logger = LoggerFactory.getLogger(WebSocketConfig.class);

	@Autowired
	SocketHandler socketHandler;
	
	@Override // WebSocket 핸들러 등록하는 registerWebSocketHandlers 메서드
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		logger.info("registry 메서드");
		registry.addHandler(socketHandler, "/chating").setAllowedOrigins("*");
		//setAllowedOrigins("*") - 모든 ip에서 접속가능
		//엔드포인트 /chating
		// -> ws://localhost:9000/chating 으로 요청 들어오면 통신 진행
	}

}
