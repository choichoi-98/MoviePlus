package com.hta.movieplus.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.StoreVO;
import com.hta.movieplus.service.CartService;
import com.hta.movieplus.service.StoreService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "store")
public class StoreController {
	
	private StoreService storeService;
	private CartService cartService;
	
	@Autowired
	public StoreController(StoreService storeService, CartService cartService) {
		this.storeService = storeService;
		this.cartService = cartService;
	}
	
	@RequestMapping("/admin/additem")
	public String additem(StoreVO storeVO) {
		return "store/additem";
	}
	
//	@RequestMapping("/admin/additem")
//	public ModelAndView additem(StoreVO storeVO, ModelAndView mv) {
//		mv.setViewName("store/additem");
//		mv.addObject("StoreVO", storeVO);
//		return mv;
//	}
	
	@RequestMapping("/admin/additempro")
	public String additempro(StoreVO storeVO) {
		storeService.insertItem(storeVO);
		return "store/additem";
	}
	
	@GetMapping("/admin/itemlist")
	public ModelAndView itemlist(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		int limit = 10;
		int itemlistcount = storeService.getItemListCount();
		int maxpage = (itemlistcount + limit - 1)/limit;
		int startpage = ((page - 1)/10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<StoreVO> itemlist = storeService.getItemList(page, limit);
		
		mv.setViewName("store/catalog");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("itemlistcount", itemlistcount);
		mv.addObject("itemlist", itemlist);
		mv.addObject("limit", limit);
		return mv;
	}
	
	@RequestMapping("/admin/modifyitem")
	public ModelAndView itemdetail(
			@RequestParam("ITEM_CODE") int ITEM_CODE,
			ModelAndView mv) {
		StoreVO get1item = storeService.get1item(ITEM_CODE);
		mv.setViewName("store/modifyitem");
		mv.addObject("get1item", get1item);
		return mv;
	}
	
	@RequestMapping("/admin/modifyitempro")
	public String modifyitempro(StoreVO storeVO) {
		storeService.updateItem(storeVO);
		return "store/modifyitem";
	}
	
	@PostMapping("/admin/delitem")
	@ResponseBody
	public void delitem(
		@RequestParam("ITEM_CODE") int ITEM_CODE) {
		storeService.deleteItem(ITEM_CODE);
	}
	
	@GetMapping("")
	public ModelAndView store(ModelAndView mv) {
		List<StoreVO> ticketlist = storeService.getItemListByKind("ticket");
		
		mv.setViewName("store/store_cp02");
		mv.addObject("ticketlist", ticketlist);
		return mv;
	}
	
	@GetMapping("/cp02")
	public ModelAndView store2(ModelAndView mv) {
		List<StoreVO> ticketlist = storeService.getItemListByKind("ticket");
		
		mv.setViewName("store/store_cp02");
		mv.addObject("ticketlist", ticketlist);
		return mv;
	}
	
	@GetMapping("/cp05")
	public ModelAndView store5(ModelAndView mv) {
		List<StoreVO> snacklist = storeService.getItemListByKind("snack");
		
		mv.setViewName("store/store_cp05");
		mv.addObject("snacklist", snacklist);
		return mv;
	}
	
	@GetMapping("/cp09")
	public ModelAndView store9(ModelAndView mv, HttpServletRequest request) {
		List<StoreVO> voucherlist = storeService.getItemListByKind("voucher");
		
//		HttpSession session = request.getSession();
//		session.setAttribute("voucherlist", voucherlist);
		
		mv.setViewName("store/store_cp09");
		mv.addObject("voucherlist", voucherlist);
		return mv;
	}
	
//	@RequestMapping("/cp9cart")
//	public ModelAndView cp9cart(
//			@RequestParam("ITEM_CODE") int ITEM_CODE, 
//			ModelAndView mv) {
//		
//		CartVO itemincart = cartService.addItemToCart(ITEM_CODE);
//		mv.setViewName("store/store_cp09");
//		mv.addObject("itemincart", itemincart);
//		return mv;
//	}
	
	@GetMapping("/cp07")
	public ModelAndView score7(ModelAndView mv) {
		List<StoreVO> pointlist = storeService.getItemListByKind("point");
		
		mv.setViewName("store/store_cp07");
		mv.addObject("pointlist", pointlist);
		return mv;
	}
	
	@GetMapping("/item")
	public ModelAndView item( 
		@RequestParam("ITEM_CODE") int ITEM_CODE,
		CartVO cartVO,
		ModelAndView mv) {
		StoreVO selecteditem = storeService.get1item(ITEM_CODE);
		
		mv.setViewName("store/item_select");
		mv.addObject("selecteditem", selecteditem);
		return mv;
	}
	
	@PostMapping("/item")
	public ModelAndView item2( 
		@RequestParam("itemCode") int ITEM_CODE,
		CartVO cartVO,
		ModelAndView mv) {
		storeService.cartInsert(ITEM_CODE);
		
		mv.setViewName("store/item_select");
		return mv;
	}
	
	@RequestMapping("/cart_prev")
	public ModelAndView cart(
		CartVO cartVO,
		ModelAndView mv) {
		mv.setViewName("store/store_cart");
		return mv;
	}
	
	@RequestMapping("/cart")
	public ModelAndView cartpro(
		CartVO cartVO,
		ModelAndView mv) {
		
		mv.setViewName("store/store_cart");
		return mv;
	}
	
	@RequestMapping("kakaopay")
	@ResponseBody
	public String kakaopay2() {
		try {
			URL payadr = new URL("https://kapi.kakao.com/v1/payment/ready");
			// 전봇대 1: 내 서버 / 전봇대 2: 카카오페이 서버
			HttpURLConnection servercon = (HttpURLConnection) payadr.openConnection(); // 전봇대 사이에 전기줄 설치
			servercon.setRequestMethod("POST");
			servercon.setRequestProperty("Authorization", "KakaoAK 6bdc0e8d249def9b6d219152bd146561");
			servercon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			// 총 2개의 input과 output 존재 
			servercon.setDoOutput(true); // output: 연결을 통해 server로 전달: true
			// HttpURLConnection은 생성시 input의 경우 default로 true로 설정
			String parameters = "cid=TC0ONETIME" // test-code
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=popcorn" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=10000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=http://localhost:9000/movieplus/store/success" // 결제 성공 시
					+ "&fail_url=http://localhost:9000/movieplus/store/fail" // 결제 실패 시(유효 시간: 15분)
					+ "&cancel_url=http://localhost:9000/movieplus/store/cart"; // 결제 취소 시
			OutputStream sender = servercon.getOutputStream(); // 전봇대 전기줄 사이로 값 전달 준비(주는애)
			DataOutputStream datatsf = new DataOutputStream(sender); // data를 전기줄 사이로 주겠다 선언
			datatsf.writeBytes(parameters); // outputstream은 byte 형식 보내야하기 때문에 byte형변환 메소드 사용
			datatsf.close(); // flush(): 모든 데이터 전기줄에 통해 전달하고 비우기 포함
			
			int result = servercon.getResponseCode(); // 연결 유무를 int형식으로 전달 받음
			
			InputStream receiver; // 받는애 
			if(result == 200) { // http에서 정상적인 통신 성공 코드: only 200
				 receiver = servercon.getInputStream(); // 받기 성공
			} else {
				receiver = servercon.getErrorStream(); // 받기 실패 
			}
			InputStreamReader reader = new InputStreamReader(receiver); // 받은것(by inputstream)을 읽는애
			BufferedReader readerchangetype = new BufferedReader(reader); // 형변환을 위해 사용
			return readerchangetype.readLine(); // finally, 내가 최종 결과물 받기(readLine(): 문자열로 형변환 후 찍어낸다)
 		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@GetMapping("/success")
	public String pay_success() {
		return "store/pay_success";
	}

}
