package com.hta.movieplus.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hta.movieplus.domain.Event;
import com.hta.movieplus.service.EventService;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Value("${my.savefolder}")
	private String saveFolder;
	private EventService eventservice;
	
	@Autowired
	public EventController(EventService eventservice) {
		this.eventservice = eventservice;
	}
	
	
	@GetMapping("/event")
	public String eventmain() {
		return "event/event_main";
	}
	
	@GetMapping("/event/curtaincall")
	public String curtaincall() {
		return "event/event_curtaincall";
	}
	
	@GetMapping("/event/eventview")
	public String eventview() {
		return "event/event_viewform";
	}
	
	@GetMapping("/event/manageEvent")
	public String eventwrite() {
		return "admin/manageEvent";
	}
	
	@GetMapping("/event/addEvent")
	public String eventwrite2() {
		return "admin/addEvent";
	}
	
	@PostMapping("/event/insert")
	public String insertevent (Event event, HttpServletRequest request) throws Exception {
		
		MultipartFile uploadevent = event.getUploadevent();
		
		if(!uploadevent.isEmpty()) {
			String fileName = uploadevent.getOriginalFilename();	//원래 파일명
			event.setEVENTFILE_ORIGINAL(fileName);	//원래 파일명 저장
			
			String fileDBName = fileDBname(fileName, saveFolder);
			logger.info("fileDBName = " + fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadevent.transferTo(new File(saveFolder + fileDBName));
			logger.info("transferTo path = " + saveFolder +  fileDBName);
			event.setEVENT_FILE(fileDBName);
		}
		
		eventservice.insert_event(event);
		logger.info(eventmain().toString());
		
		return "admin/manageEvent";
	}
	
	private String fileDBname(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);	
		int month = c.get(Calendar.MONTH) + 1;	
		int date = c.get(Calendar.DATE);
		
		String homedir = saveFolder + "/event/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if(!(path1.exists())) {
			path1.mkdir();	//새로운 폴더 생성
		}
		
		//난수 구하기
		Random r = new Random();
		int random = r.nextInt(1000000000);
				
		/*** 확장자 구하기 시작 ***/
		int index = fileName.lastIndexOf(".");
		//문자열에서 특정 문자열의 위치 값(index)을 반환합니다.
		logger.info("index = " + index);
				
		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		/*** 확장자 구하기 끝 ***/
				
		//새로운 파일명
		String refileName = "event" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
				
		//오라클 디비에 저장될 파일명
		String fileDBName = File.separator + "event" + File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	


}
