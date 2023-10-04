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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "store")
public class StorePayController {
	
	@GetMapping("/kakaopay")
	@ResponseBody
	public String kakaopay() {
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 6bdc0e8d249def9b6d219152bd146561");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달 유무
			String parameter = "cid=TC0ONETIME" // test-code
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=초코파이" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=5000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=http://localhost:9000/pay/success" // 결제 성공 시
					+ "&fail_url=http://localhost:9000/pay/fail" // 결제 실패 시(유효 시간: 15분)
					+ "&cancel_url=http://localhost:9000/movieplus/store/cart"; // 결제 취소 시
			OutputStream send = connection.getOutputStream(); // ready for send
			DataOutputStream dataSend = new DataOutputStream(send); // send
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기(형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫기 (보내고 비우고 닫기)
			
			int result = connection.getResponseCode(); // 전송 유무 번호 부여
			InputStream receive; // 받다
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽기
			// 받는 부분 // 바이트를 읽기 위해 형변환(버퍼리더는 실제로 형변환을 위해 존재하는 클레스는 X)
			BufferedReader change = new BufferedReader(read); 
			return change.readLine(); // 문자열로 자동으로 형변환 해주고 반환.(본인은 비우기)
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}
