package com.hta.movieplus.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.constant.TheaterLocationEnum;
import com.hta.movieplus.domain.FavoriteTheater;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.domain.TimeTableDate;
import com.hta.movieplus.service.KakaopayService;
import com.hta.movieplus.service.SchedulingService;
import com.hta.movieplus.service.SeatService;
import com.hta.movieplus.service.TheaterManagerService;
import com.hta.movieplus.service.TheaterService;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	
	SchedulingService schedulingService;
	TheaterService theaterService;
	TheaterManagerService theaterManagerService;
	SeatService seatService;
	KakaopayService kakaopayService;
	
	
	@Autowired
	public BookingController(SchedulingService schedulingService, TheaterService theaterService, TheaterManagerService theaterManagerService, SeatService seatService, KakaopayService kakaopayService) {
		// TODO Auto-generated constructor stub
		this.schedulingService = schedulingService;
		this.theaterService = theaterService;
		this.theaterManagerService = theaterManagerService;
		this.seatService = seatService;
		this.kakaopayService = kakaopayService;
	}
	
	@GetMapping("/")
	public ModelAndView bookingMainView(ModelAndView mv, Principal principal,
										@RequestParam(value="movieCode", required=false) String movieCode) {
		List<Theater> theaterList = theaterService.getAllTheaterList();
		
		if(principal != null) {
			List<FavoriteTheater> favTheaterList = theaterService.getFavoriteTheaterListById(principal.getName());
			int favTheaterCnt = theaterService.getCountFavoriteTheater(principal.getName());
			mv.addObject("favTheaterList", favTheaterList);
			mv.addObject("favTheaterCnt", favTheaterCnt);
		}
		
		List<TimeTableDate> dateList = schedulingService.getDateList();
		
		if(movieCode != null) {
			mv.addObject("fast-movieCode", movieCode);
		}
		
		mv.addObject("dateList", dateList);
		mv.addObject("theaterList", theaterList);
		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.setViewName("booking/booking_main");
		
		return mv;
	}
	
	@GetMapping("/seat")
	public ModelAndView bookingSeatView(int scheduleId, ModelAndView mv) {
		TheaterSchedule schedule = schedulingService.getSchedule(scheduleId);
		Movie movie = schedulingService.getMovieDetailByCode(schedule.getMOVIE_CODE());
		TheaterRoom room = theaterManagerService.getTheaterRoomById(schedule.getTHEATER_ROOM_ID());
		String seat = seatService.makeSeatStr(room.getTHEATER_ROOM_SEAT());
		
		
		
		mv.addObject("seat", seat);
		mv.addObject("movie", movie);
		mv.addObject("schedule", schedule);
		mv.setViewName("booking/booking_seat");
		
		return mv;
	}
	
	@GetMapping("/cart")
	public ModelAndView bookingCartView(int scheduleId, int price, String[] seat, 
			ModelAndView mv) {
		
		TheaterSchedule ts = schedulingService.getSchedule(scheduleId);
		Movie movie = schedulingService.getMovieDetailByCode(ts.getMOVIE_CODE());
		
		mv.setViewName("booking/booking_cart");
		mv.addObject("price", price);
		mv.addObject("movie", movie);
		mv.addObject("ts", ts);
		return mv;
	}
	
	@PostMapping("/kakaopay")
	@ResponseBody
	public String kakaopay2(int scheduleId, int price, String[] seat,
	    @RequestParam("totalPrice") int totalPrice) {
		
		int seatCnt = seat.length;
	    
		kakaopayService.payInsert(scheduleId, totalPrice, seatCnt);
//	    int PAY_NUM = storeService.getThisPayNum();
	    try {
	        URL payadr = new URL("https://kapi.kakao.com/v1/payment/ready");
	        HttpURLConnection servercon = (HttpURLConnection) payadr.openConnection();
	        servercon.setRequestMethod("POST");
	        servercon.setRequestProperty("Authorization", "KakaoAK 6bdc0e8d249def9b6d219152bd146561");
	        servercon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
	        servercon.setDoOutput(true);
	        String parameters = "cid=TC0ONETIME"
	                + "&partner_order_id=partner_order_id"
	                + "&partner_user_id=partner_user_id"
	                + "&item_name=" + "movie name"
	                + "&quantity=1"
	                + "&total_amount=" + totalPrice
	                + "&vat_amount=0"
	                + "&tax_free_amount=0"
	                + "&approval_url=http://localhost:9000/movieplus/store/success"
	                + "&fail_url=http://localhost:9000/movieplus/store/fail"
	                + "&cancel_url=http://localhost:9000/movieplus/store/cart";
	        OutputStream sender = servercon.getOutputStream();
	        DataOutputStream datatsf = new DataOutputStream(sender);
	        datatsf.writeBytes(parameters);
	        datatsf.close();

	        int result = servercon.getResponseCode();

	        InputStream receiver;
	        if (result == 200) {
	            receiver = servercon.getInputStream();
	        } else {
	            receiver = servercon.getErrorStream();
	        }
	        InputStreamReader reader = new InputStreamReader(receiver);
	        BufferedReader readerchangetype = new BufferedReader(reader);
	        return readerchangetype.readLine();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return "";
	}

}
