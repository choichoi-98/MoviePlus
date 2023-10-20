package com.hta.movieplus.config;

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

	@Autowired
	SocketHandler socketHandler;
	
	@Override // WebSocket 핸들러 등록하는 registerWebSocketHandlers 메서드
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(socketHandler, "/chating");
		//chat/chating 경로에 WebSocket 핸들러를 등록, WebSocket 연결 처리 (엔드포인트)
	}

}
