package com.hta.movieplus.scheduler;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.hta.movieplus.service.SchedulingService;

@Service
@EnableScheduling
@Configuration
public class MainScheduler {
	
	private static final Logger logger = LoggerFactory.getLogger(MainScheduler.class);
	
	SchedulingService schedulingService;
	
	@Autowired
	public MainScheduler(SchedulingService schedulingService) {
		// TODO Auto-generated constructor stub
		this.schedulingService = schedulingService;
	}
	
	// 1분마다		
	@Scheduled(cron = "0 * * * * *")
	public void perMinute(){
		LocalDateTime now = LocalDateTime.now();
		
		int scheduleCnt = schedulingService.changeScheduleStatus(now);
//		logger.info("변경된 스케쥴 수 : " + scheduleCnt);
	}
	
	// 자정
	@Scheduled(cron = "0 0 0 * * *")
	public void perDay(){
		LocalDate now = LocalDate.now();

		//PG_TOKEN NULL이고, 날짜가 전 날인것(결제중일때 초기화안되게)  DELETE
		
		logger.info("자정");
	}
	
	

}