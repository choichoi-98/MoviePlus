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

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.StoreVO;
import com.hta.movieplus.service.CartService;
import com.hta.movieplus.service.StoreService;




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
	public String additem() {
		return "store/additem.jsp";
	}
	
	@GetMapping("")
	public String store() {
		return "store/store_cp02";
	}
	
	@GetMapping("/cp02")
	public String store2() {
		return "store/store_cp02";
	}
	
	@GetMapping("/cp05")
	public String store5() {
		return "store/store_cp05";
	}
	
	@GetMapping("/cp09")
	public String store9() {
		return "store/store_cp09";
	}
	
	@GetMapping("/cp07")
	public String score7() {
		return "store/store_cp07";
	}
	
	@GetMapping("/item")
	public String item() {
		return "store/item_select";
	}
	
	@GetMapping("/cart")
	public String addcart(StoreVO storeitem, Model model, HttpServletRequest request) {
		
		int result = cartService.additem(storeitem);
		
		if(result == 1) { // additem
			
		} else { // fail to additem
			
		}
		
		return "store/store_cart";
	}
	
	@GetMapping("/cart_prev")
	public ModelAndView cart(ModelAndView mv) {
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
