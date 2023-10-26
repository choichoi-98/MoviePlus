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
					//비실시간 채팅 구현
					//조건: 1:1채팅 방의 인원이 2보다 작을 경우
					//db: message테이블에 저장
					//-> 이때 여기서 세션리즈트에 존재하는 모든 Object 값을 세서 인원 수 구할 수 있을 듯. 
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
	
	
	// 파일 전송
	@Override 
	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		//session.getId();
		logger.info("바이너리 세션 확인 : " + session.getId());
		
		//바이너리 메시지 발송
		logger.info("handleBinaryMessage");
				ByteBuffer byteBuffer = message.getPayload();
				String fileName = "temp.jpg";
				File dir = new File(FILE_UPLOAD_PATH);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				File file = new File(FILE_UPLOAD_PATH, fileName);//파일 생성
				FileOutputStream out = null;
				FileChannel outChannel = null;
				try {
					byteBuffer.flip(); //byteBuffer를 읽기 위해 세팅
					out = new FileOutputStream(file, true); //생성을 위해 OutputStream을 연다.
					outChannel = out.getChannel(); //채널을 열고
					byteBuffer.compact(); //파일을 복사한다.
					outChannel.write(byteBuffer); //파일을 쓴다.
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(out != null) {
							out.close();
						}
						if(outChannel != null) {
							outChannel.close();
						}
					}catch (IOException e) {
						e.printStackTrace();
					}
				}
				//파일의 url을 구하는 방법에 대한 공부가 필요함. 
				String imageurl = "";
				
				byteBuffer.position(0); //파일을 저장하면서 position값이 변경되었으므로 0으로 초기화한다.
				//파일쓰기가 끝나면 이미지를 발송한다.
				HashMap<String, Object> temp = rls.get(fileUploadIdx);
				for(String k : temp.keySet()) {
					if(k.equals("roomNumber")) {
						continue;
					}
					WebSocketSession wss = (WebSocketSession) temp.get(k);
					try {
						logger.info("여기는 바이너리 메시지의 버퍼 발송 전");
						
//						String sessionId = session.getId();
//						JSONObject sessionIdMessage = new JSONObject();
//						sessionIdMessage.put("type", "bSession");
//						sessionIdMessage.put("sessionId", sessionId);
//						wss.sendMessage(new TextMessage(sessionIdMessage.toJSONString()));
						
						JSONObject obj = new JSONObject();
						obj.put("type", "imgurl");
						obj.put("sessionId", session.getId());
						obj.put("imageurl", imageurl);
						
						session.sendMessage(new TextMessage(obj.toJSONString()));
						
						//초기화된 버퍼 저장
						BinaryMessage tryBinary = new BinaryMessage(byteBuffer);
						//var tryUrl = URL.createObjectURL(new Blob(tryBinary));
						//tryBinary를 url로 변환하는 부분이 필요함...
						wss.sendMessage(new BinaryMessage(byteBuffer)); //초기화된 버퍼를 발송한다.
						logger.info(byteBuffer + " ");
						//지금 문제: 이미지도 message 처럼 보낸 사람에 따라 좌,우로 나누기
						//버퍼를 발송할 때 sessionId 값도 같이 보내면 이미지도 좌, 우 구분 가능할 것 같음
						//초기화된 버퍼를,,, 어케 JSONObject로 보내는 방법이 없을까?
						
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
	
	}//handleBinaryMessage
	
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
