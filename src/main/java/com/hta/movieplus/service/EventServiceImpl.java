package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Event;
import com.hta.movieplus.domain.EventApply;
import com.hta.movieplus.mybatis.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService{
	
	private EventMapper dao;
	
	@Autowired
	public EventServiceImpl(EventMapper dao) {
		this.dao = dao;
	}

	@Override
	public void insert_event(Event event) {
		dao.insert_event(event);
	}
	
	@Override
	public List<Event> getAllEventList() {
		return dao.getAllEventList();
	}

	@Override
	public int getEventListCount() {
		return dao.getEventListCount();
	}

	@Override
	public List<Event> getEventList(int page, int limit) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page-1) * limit + 1;
		int endrow = startrow+limit-1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getEventList(map);
	}

	@Override
	public Event getDetailEvent(int num) {
		return dao.getDetailEvent(num);
	}

	@Override
	public List<Event> getMovieEventList() {
		return dao.getMovieEventList();
	}

	@Override
	public List<Event> getTheaterEventList() {
		return dao.getTheaterEventList();
	}

	@Override
	public List<Event> getPromotionEventList() {
		return dao.getPromotionEventList();
	}

	@Override
	public List<Event> getCurtaincallEventList() {
		return dao.getCurtaincallEventList();
	}

	@Override
	public int getMovieEventListCount() {
		return dao.getMovieEventListCount();
	}

	@Override
	public int getTheaterEventListCount() {
		return dao.getTheaterEventListCount();
	}

	@Override
	public int getPromotionEventListCount() {
		return dao.getPromotionEventListCount();
	}

	@Override
	public int getCurtaincallEventListCount() {
		return dao.getCurtaincallEventListCount();
	}

	@Override
	public void deleteEvent(int num) {
		dao.deleteEvent(num);
	}

	@Override
	public int updateEvent(Event event) {
		return dao.updateEvent(event);
		 
	}

	@Override
	public void changeStatus(int num, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("EVENT_NUM", num);
		map.put("EVENT_STATUS", status);
		
		dao.changeStatus(map);
	}
	

	@Override
	public Map<String, Object> pagination(int page, String option) {
		int eventlistcount = 0;
		Map<String, Object> pagemap = new HashMap<String,Object>();
		
		int limit = 10;	//한 화면에 출력할 로우 갯수
		
		if(option.equals("admin")) {
			eventlistcount = getEventListCount();	//총 리스트 수	
		}else {
			eventlistcount = getEventListCountEnd();
		}

		
		//총 페이지 수
		int maxpage = (eventlistcount + limit - 1) / limit;
		
		//현재 페이지에 보여줄 시작 페이지 수
		int startpage = ((page - 1)/10) * 10 + 1;
		
		//현재 페이지에 보여줄 마지막 페이지 수
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		pagemap.put("page", page);
		pagemap.put("maxpage",maxpage);
		pagemap.put("startpage",startpage);
		pagemap.put("endpage",endpage);
		pagemap.put("limit",limit);
		
		return pagemap;
	}

	@Override
	public List<Event> getEventListdesc(int page, int limit) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page-1) * limit + 1;
		int endrow = startrow+limit-1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getEventListdesc(map);
	}

	@Override
	public int getEventListCountStatus() {
		return dao.getEventListCountStatus();
	}

	@Override
	public int update_eventResult(Event event) {
		return dao.update_eventResult(event);
	}

	@Override
	public void insertEventApply(EventApply eventapply) {
		 dao.insertEventApply(eventapply);
	}

	@Override
	public int applyCheck(String MEMBER_ID, String EVENT_NUM) {
		EventApply eventapply = dao.applyCheck(MEMBER_ID, EVENT_NUM);
		return (eventapply == null)? -1 : 1; //응모내역이 존재하는 경우 1, 존재하지 않는 경우 -1 출력  
	}

	@Override
	public List<EventApply> getEventWinnerList(int num) {
		return dao.getEventWinnerList(num);
	}

	@Override
	public List<EventApply> getEventApplyList(int num) {
		return dao.getEventApplyList(num);
	}

	@Override
	public void updateEventDraw(String EVENT_DRAW, int EVENT_APPLY_NUM) {
		dao.updateEventDraw(EVENT_DRAW, EVENT_APPLY_NUM);
		
	}

	@Override
	public List<EventApply> getMyEventlist(String MEMBER_ID) {
		return dao.getMyEventlist(MEMBER_ID);
	}

	@Override
	public int getCurtaincallEventListEndCount() {
		return dao.getCurtaincallEventListEndCount();
	}

	@Override
	public int getEventApplyCount(int num) {
		return dao.getEventApplyCount(num);
	}

	public int getEventListCountEnd() { 
		return dao.getEventListCountEnd();
		
	}
	



	


	

}
