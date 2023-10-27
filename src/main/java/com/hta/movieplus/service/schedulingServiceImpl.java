package com.hta.movieplus.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieDibsVO;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.domain.TimeTableDate;
import com.hta.movieplus.mybatis.mapper.SchedulingMapper;

@Service
public class schedulingServiceImpl implements SchedulingService {

	SeatService seatService;
	private static final Logger logger = LoggerFactory.getLogger(schedulingServiceImpl.class);
	SchedulingMapper mapper;

	public schedulingServiceImpl(SchedulingMapper mapper, SeatService seatService) {
		// TODO Auto-generated constructor stub
		this.seatService = seatService;
		this.mapper = mapper;
	}

	// 예매 좌석 수정
	@Override
	public List<TheaterSchedule> getScheduleList(int theaterId, String todayDate) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("theaterId", theaterId);
		dataMap.put("todayDate", todayDate);

		List<TheaterSchedule> list = mapper.getScheduleList(dataMap);

		for (TheaterSchedule schedule : list) {
			schedule.setTHEATER_ROOM_SEAT_CNT(seatService.getSeatCount(schedule.getTHEATER_ROOM_SEAT()));
			schedule.setTHEATER_SCHEDULE_BOOKED_CNT(seatService.getBookedSeatCnt(schedule.getTHEATER_SCHEDULE_ID()));
		}
		
		return list;
	}

	@Override
	public String getTodayDate() {
		// TODO Auto-generated method stub
		LocalDate now = LocalDate.now();

		return now.toString();
	}

	@Override
	public List<Movie> getOpenMovieList(String keyword) {
		// TODO Auto-generated method stub
		List<Movie> movieList = mapper.getOpenMovieList();

		return movieList.stream().filter(item -> item.getMovie_Title().contains(keyword)).collect(Collectors.toList());
	}

	@Override
	public int addSchedule(TheaterSchedule schedule) {
		// TODO Auto-generated method stub	
		if(LocalDate.now().equals(LocalDate.parse(schedule.getTHEATER_SCHEDULE_DATE()))){
			if(LocalTime.now().isAfter(LocalTime.parse(schedule.getTHEATER_SCHEDULE_START()))) {
				return -2;
			}
		}	

		
		
		String endTime = calculateEndTime(schedule);
		schedule.setTHEATER_SCHEDULE_END(endTime);

		return checkScheduleOverlap(schedule) ? mapper.addSchedule(schedule) : -1;
	}

	private boolean checkScheduleOverlap(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		List<TheaterSchedule> scheduleList = mapper.getScheduleListByTheaterRoomId(schedule);
		int listSize = scheduleList.size();

		if (listSize == 0) { // 스케줄 없는 경우
			return true;
		}

		LocalTime FirstStartTime = LocalTime.parse(scheduleList.get(0).getTHEATER_SCHEDULE_START());
		LocalTime LastEndTime = LocalTime.parse(scheduleList.get(listSize - 1).getTHEATER_SCHEDULE_END());

		LocalTime compStartTime = LocalTime.parse(schedule.getTHEATER_SCHEDULE_START());
		LocalTime compEndTime = LocalTime.parse(schedule.getTHEATER_SCHEDULE_END());

		if (compStartTime.isAfter(LastEndTime) || compEndTime.isBefore(FirstStartTime)) {
			return true;
		}

		LocalTime temp = LocalTime.parse(scheduleList.get(0).getTHEATER_SCHEDULE_START());
		if (listSize == 1) {
			if (compEndTime.isBefore(temp)) {
				return true;
			}
		}

		for (int i = 0; i < listSize; i++) {
			LocalTime origEndTime = LocalTime.parse(scheduleList.get(i).getTHEATER_SCHEDULE_END());

			if (compStartTime.isAfter(origEndTime)) {
				if (i + 1 == listSize) {
					return true;
				}

				if (compEndTime.isBefore(LocalTime.parse(scheduleList.get(i + 1).getTHEATER_SCHEDULE_START()))) {
					return true;
				}

			}

		}

		return false;
	}

	private String calculateEndTime(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		Movie movie = mapper.getMovieByID(schedule.getMOVIE_CODE());

		LocalTime startTime = LocalTime.parse(schedule.getTHEATER_SCHEDULE_START());

		return startTime.plusMinutes(Integer.parseInt(movie.getMovie_Runtime())).toString();
	}

	@Override
	public int deleteSchedule(int scheduleId) {
		// TODO Auto-generated method stub
		return mapper.deleteScheduleById(scheduleId);
	}

	@Override
	public TheaterSchedule getSchedule(int scheduleId) {
		// TODO Auto-generated method stub
		return mapper.getScheduleById(scheduleId);
	}

	@Override
	public int updateSchedule(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		return mapper.updateSchedule(schedule);
	}

//	예매된 좌석 추가
	@Override
	public List<TheaterSchedule> getMovieScheduleWithMovie(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub

		List<TheaterSchedule> list = mapper.getMovieScheduleWithMovie(dataMap);

		for (TheaterSchedule schedule : list) {
			schedule.setTHEATER_ROOM_SEAT_CNT(seatService.getSeatCount(schedule.getTHEATER_ROOM_SEAT()));
			schedule.setTHEATER_SCHEDULE_BOOKED_CNT(seatService.getBookedSeatCnt(schedule.getTHEATER_SCHEDULE_ID()));
		}

		return list;
	}

	@Override
	public List<TimeTableDate> getDateList() {
		// TODO Auto-generated method stub
		List<TimeTableDate> dateList = new ArrayList<TimeTableDate>();

		// 오늘 날짜 기준으로 14일까지의 값
		LocalDate date = LocalDate.now();
		date = date.minusDays(1);

		for (int i = 0; i <= 14; i++) {
			TimeTableDate temp = new TimeTableDate(date.getYear(), date.getMonthValue(), date.getDayOfMonth(),
					date.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN).toString(), date.toString());
			dateList.add(temp);

			date = date.plusDays(1);

		}
		return dateList;
	}

	@Override
	public List<Theater> getTheaterWithMovie(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return mapper.getTheaterWithMovie(dataMap);
	}

	@Override
	public List<TheaterRoom> getTheaterRoomWithMovie(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		List<TheaterRoom> list = mapper.getTheaterRoomWithMovie(dataMap);

		for (TheaterRoom room : list) {
			room.setTHEATER_ROOM_SEAT_CNT(seatService.getSeatCount(room.getTHEATER_ROOM_SEAT()));
		}

		return list;
	}

	@Override
	public List<Movie> getMovieWithTheater(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return mapper.getMovieWithTheater(dataMap);
	}

	@Override
	public List<TheaterRoom> getTheaterRoomWithTheater(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return mapper.getTheaterRoomWithTheater(dataMap);
	}

	@Override
	public List<TheaterSchedule> getScheduleWithTheater(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		List<TheaterSchedule> list = mapper.getScheduleWithTheater(dataMap);

		for (TheaterSchedule schedule : list) {
			schedule.setTHEATER_ROOM_SEAT_CNT(seatService.getSeatCount(schedule.getTHEATER_ROOM_SEAT()));
			schedule.setTHEATER_SCHEDULE_BOOKED_CNT(seatService.getBookedSeatCnt(schedule.getTHEATER_SCHEDULE_ID()));
		}

		return list;
	}

	@Override
	public List<Movie> getOpenMovieListWithScheduleCnt(String date) {
		// TODO Auto-generated method stub

		List<Movie> movieList = mapper.getOpenMovieListWithScheduleCnt(date);

		for (Movie movie : movieList) {
			movie.setGrade_data(getGradeData(movie.getMovie_Grade()));
		}

		return movieList;

	}

	public String getGradeData(String grade) {
		String result = "all";

		switch (grade) {
		case "전체관람가":
			result = "all";
			break;
		case "12세이상관람가":
			result = "12";
			break;
		case "15세이상관람가":
			result = "15";
			break;
		case "청소년관람불가":
			result = "19";
			break;
		}

		return result;
	}

	@Override
	public List<TheaterSchedule> getTheaterRoomWithScheduleCnt(String movieCode, String date) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("movieCode", movieCode);
		dataMap.put("date", date);

		return mapper.getTheaterRoomWithScheduleCnt(dataMap);
	}

	// 예매된 좌석 추가
	@Override
	public List<TheaterSchedule> getScheduleListByDateAndMovieCodeAndTheaterId(String movieCode, String date,
			String theaterId) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("movieCode", movieCode);
		dataMap.put("date", date);
		dataMap.put("theaterId", theaterId);

		List<TheaterSchedule> list = mapper.getScheduleListByDateAndMovieCodeAndTheaterId(dataMap);

		for (TheaterSchedule schedule : list) {
			schedule.setTHEATER_ROOM_SEAT_CNT(seatService.getSeatCount(schedule.getTHEATER_ROOM_SEAT()));
			schedule.setTHEATER_SCHEDULE_BOOKED_CNT(seatService.getBookedSeatCnt(schedule.getTHEATER_SCHEDULE_ID()));
		}

		return list;
	}

	@Override
	public Movie getMovieDetailByCode(String movieCode) {
		// TODO Auto-generated method stub
		Movie movie = mapper.getMovieDetailByCode(movieCode);
		if (movie.getMovie_Poster().length() >= 60) {
			movie.setMovie_Poster(movie.getMovie_Poster().substring(0, 60));
		}

		movie.setGrade_data(getGradeData(movie.getMovie_Grade()));

		return movie;
	}

	@Override
	public List<MovieDibsVO> getMovieDibsList(String name) {
		// TODO Auto-generated method stub

		return mapper.getMovieDibsList(name);
	}

	@Override
	public int changeScheduleStatus(LocalDateTime now) {
		// TODO Auto-generated method stub
		String date = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String time = now.format(DateTimeFormatter.ofPattern("HH:mm"));


		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("date", date);
		dataMap.put("time", time);
		
		return mapper.changeScheduleStatus(dataMap);
	}

}
