package com.hta.movieplus.handler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



@Component  //SocketHandler 빈 등록
public class SocketHandler extends TextWebSocketHandler{

	private static final Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	
	
	//HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	List<HashMap<String, Object>> rls = new ArrayList<>(); //웹소켓 세션을 담아둘 리스트 --roomListSessions
	private static final String FILE_UPLOAD_PATH = "C:/test/websocket/";//파일 저장 경로
	static int fileUploadIdx = 0;
	static String fileUploadSession = "";
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws org.json.simple.parser.ParseException, ParseException {
		//메시지 발송 - 메시지 수신 시 실행
		
		String msg = message.getPayload();	//JSON 형태의 String 메시지 받음
		JSONObject obj = jsonToObjectParser(msg); //JSON -> JSONObject 파싱
		logger.info("메시지 발송 - obj = " + obj);
		//파일 전송 경우
		//{"msg":"","file":{},"roomNumber":"3","sessionId":"01e7cf31-4631-34a6-1b55-57d8658845fc","type":"fileUpload","userName":"초이"}
			
		String rN = (String) obj.get("roomNumber"); // chat.jsp의 send() 메서드에서 보냄, 방 번호
		logger.info("메시지 발송 - rN = "+rN);
		String msgType = (String) obj.get("type");	//메시지 타입 확인
		
		
		
		
		HashMap<String, Object> temp = new HashMap<String, Object>();
		logger.info("메시지 발송 - 방 사이즈 :" + rls.size());
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String roomNumber = (String) rls.get(i).get("roomNumber"); //세션리스트의 저장된 방번호를 가져와서
				logger.info("메시지 발송 - if 문 roomNumber = " + roomNumber);
				logger.info("메시지 발송 - if 문 rN = " + rN);
				if(roomNumber.equals(rN)) { //같은값의 방이 존재한다면
					temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
		
					break;
				}
			}
			
			if(!msgType.equals("fileUploads")) {
				//해당 방의 세션들만 찾아서 메시지를 발송해준다.
				for(String k : temp.keySet()) { 
					if(k.equals("roomNumber")) { //다만 방번호일 경우에는 건너뛴다.
						continue;
					}
					WebSocketSession wss = (WebSocketSession) temp.get(k);
					if(wss != null) {
						try {
							logger.info("메시지 발송 : " + obj.toString());
							wss.sendMessage(new TextMessage(obj.toJSONString()));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}//if(!msgType.equals("fileUpload")) {
			
		}//if(rls.size() > 0) {
	}//handleTextMessage
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결 - 웹소켓 연결 시 동작
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		System.out.println(url);
		String roomNumber = url.split("/chating/")[1];
		int idx = rls.size(); //방의 사이즈를 조사한다.
		logger.info("웹소켓 연길 시 동작-roomsize : " +idx);
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String rN = (String) rls.get(i).get("roomNumber");
				logger.info("웹소켓 연결 시 동작 - rN : " + rN);
				if(rN.equals(roomNumber)) {
					flag = true;
					idx = i;
					logger.info("웹소켓 연길 시 동작-roomNumber : " +idx);
					break;
				}
			}
		}
		
		if(flag) { //존재하는 방이라면 세션만 추가한다.
			HashMap<String, Object> map = rls.get(idx);
			map.put(session.getId(), session);
		}else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
			logger.info("최초 생성하는 방");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNumber", roomNumber);
			map.put(session.getId(), session);
			rls.add(map);
			logger.info("방 번호: "+roomNumber + "");
			logger.info("방 사이즈: "+rls.size() + "");
		}
		
		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		logger.info("웹소켓연결시동작:"+obj.toString());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료 - 웹소켓 종료 시 동작
		if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			for(int i=0; i<rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}
	
	//JSON파일이 들어오면 파싱처리(json -> JSONObject)
	private static JSONObject jsonToObjectParser(String jsonStr) throws org.json.simple.parser.ParseException, ParseException {
		logger.info("파싱 메서드");
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		obj = (JSONObject) parser.parse(jsonStr);
		logger.info("파싱 obj = " + obj); //
		return obj;
	}
	
	

}
