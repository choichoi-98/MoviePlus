package com.hta.movieplus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class WebSocketHandler extends TextWebSocketHandler {

	
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	
	
	
}
