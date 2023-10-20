package com.hta.movieplus.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.constant.TheaterLocationEnum;
import com.hta.movieplus.domain.BookingInfoDTO;
import com.hta.movieplus.domain.FavoriteTheater;
import com.hta.movieplus.domain.KakaoPayVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.domain.TimeTableDate;
import com.hta.movieplus.service.KakaopayService;
import com.hta.movieplus.service.SchedulingService;
import com.hta.movieplus.service.SeatService;
import com.hta.movieplus.service.TheaterManagerService;
import com.hta.movieplus.service.TheaterService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	
	SchedulingService schedulingService;
	TheaterService theaterService;
	TheaterManagerService theaterManagerService;
	SeatService seatService;
	KakaopayService kakaopayService;
	
	 private static final Logger logger = LoggerFactory.getLogger(BookingController.class);
	
	
	@Autowired
	public BookingController(SchedulingService schedulingService, TheaterService theaterService, TheaterManagerService theaterManagerService, SeatService seatService, KakaopayService kakaopayService) {
		// TODO Auto-generated constructor stub
		this.schedulingService = schedulingService;
		this.theaterService = theaterService;
		this.theaterManagerService = theaterManagerService;
		this.seatService = seatService;
		this.kakaopayService = kakaopayService;
	}
	
	@GetMapping("")
	public ModelAndView bookingMainView(ModelAndView mv, Principal principal,
										@RequestParam(value="movieCode", required=false, defaultValue="none") String movieCode) {
		List<Theater> theaterList = theaterService.getAllTheaterList();

		if(principal != null) {
			List<FavoriteTheater> favTheaterList = theaterService.getFavoriteTheaterListById(principal.getName());
			int favTheaterCnt = theaterService.getCountFavoriteTheater(principal.getName());
			mv.addObject("favTheaterList", favTheaterList);
			mv.addObject("favTheaterCnt", favTheaterCnt);
		}
		
		List<TimeTableDate> dateList = schedulingService.getDateList();
		
		if(movieCode != null) {
			mv.addObject("fast_movieCode", movieCode);
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
		String seat = seatService.makeSeatStr(room.getTHEATER_ROOM_SEAT(), scheduleId);
		
		mv.addObject("seat", seat);
		mv.addObject("movie", movie);
		mv.addObject("schedule", schedule);
		mv.setViewName("booking/booking_seat");
		
		return mv;
	}
	
	@GetMapping("/cart")
	public ModelAndView bookingCartView(
			int scheduleId, 
			int price, 
			String[] seat,
			ModelAndView mv) {
		
		String seatInfo = String.join(",", seat); // 배열을 쉼표로 구분된 하나의 문자열로 변환
		int seatCnt = seat.length;
		
		TheaterSchedule ts = schedulingService.getSchedule(scheduleId);
		Movie movie = schedulingService.getMovieDetailByCode(ts.getMOVIE_CODE());
		
		mv.setViewName("booking/booking_cart");
		mv.addObject("scheduleId", scheduleId);
		mv.addObject("price", price);
		mv.addObject("seatInfo", seatInfo);
		mv.addObject("seat", seat);
		mv.addObject("seatCnt", seatCnt);
		mv.addObject("movie", movie);
		mv.addObject("ts", ts);
		return mv;
	}
	
	@PostMapping("/kakaopay")
	@ResponseBody
	public String kakaopay(
		@RequestParam("totalAmount") int totalAmount,
		@RequestParam("sid") int sid,
		@AuthenticationPrincipal Member member,
		@RequestParam("seatinfo") String KPAY_OCCUPIED_SEAT,
		@RequestParam("cnt") int seatCnt) throws UnsupportedEncodingException {
		
		String MEMBER_ID = member.getMEMBER_ID();
		
		kakaopayService.payInsert(sid, totalAmount, KPAY_OCCUPIED_SEAT, seatCnt, MEMBER_ID);
		
		TheaterSchedule ts = schedulingService.getSchedule(sid);
		Movie movie = schedulingService.getMovieDetailByCode(ts.getMOVIE_CODE());
		String title = movie.getMovie_Title();
		String titleEnc = URLEncoder.encode(title, "UTF-8");
		
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
	                + "&item_name=" + titleEnc + " x" + seatCnt  
	                + "&quantity=1"
	                + "&total_amount=" + totalAmount
	                + "&vat_amount=0"
	                + "&tax_free_amount=0"
	                + "&approval_url=http://localhost:9000/movieplus/booking/success"
	                + "&fail_url=http://localhost:9000/movieplus/booking/fail"
	                + "&cancel_url=http://localhost:9000/movieplus/booking/";
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
	
	@GetMapping("/success")
	public ModelAndView pay_success(
			@RequestParam(value = "pg_token", required = false, defaultValue = "none") String pg_token,
			ModelAndView mv) {
//		storeService.insertPgToken(PAY_NUM, pg_token);
		if (pg_token.equals("none")) {
		} else {
			kakaopayService.insertPgToken(pg_token);
//			kakaopayService.clearCart();
		}
		
//		List<KakaoPayVO> BookingList = kakaopayService.getAprBooking();
		List<BookingInfoDTO> BookingLists = kakaopayService.getAprBookings();
		
		mv.setViewName("booking/pay_success");
//		mv.addObject("paylist", paylist);
		mv.addObject("BookingList", BookingLists);
		return mv;
	}

}
