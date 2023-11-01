package com.hta.movieplus.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.CouponVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.PayCouponDTO;
import com.hta.movieplus.domain.StoreCartDTO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.StoreVO;
import com.hta.movieplus.service.CartService;
import com.hta.movieplus.service.StoreService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "store")
public class StoreController {
	
	private StoreService storeService;
	private CartService cartService;
	
	@Value("${my.savefolder}")
	private String folder;
	
	@Value("${my.savepath}")
	private String filePath;
	
	@Autowired
	public StoreController(StoreService storeService, CartService cartService) {
		this.storeService = storeService;
		this.cartService = cartService;
	}
	
	@GetMapping("/admin/additem")
	public ModelAndView additem(ModelAndView mv) {
		mv.setViewName("store/additem");
		return mv;
	}
	
	@PostMapping("/admin/additem")
	public ModelAndView additempro(
			StoreVO storeVO,
			MultipartFile pic,
			ModelAndView mv) throws Exception {
		
		UUID uuid = UUID.randomUUID();
		
		String fileName = uuid + "_" + pic.getOriginalFilename();
		
		File savePic = new File(folder, fileName);
		
		pic.transferTo(savePic);
		
		storeVO.setITEM_FILE(fileName);
		storeVO.setITEM_PATH(filePath + fileName);
		
		storeService.insertItem(storeVO);
		mv.setViewName("store/additem");
		return mv;
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
	
	@PostMapping("/admin/itemlist")
	@ResponseBody
	public void delitem(
		@RequestParam("itemCode") int ITEM_CODE) {
		storeService.deleteItem(ITEM_CODE);
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
	public String modifyitempro(
			StoreVO storeVO,
			MultipartFile pic) throws Exception {
		String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\image\\store";
		
		UUID uuid = UUID.randomUUID();
		
		String fileName = uuid + "_" + pic.getOriginalFilename();
		
		File savePic = new File(projectPath, fileName);
		
		pic.transferTo(savePic);
		
		storeVO.setITEM_FILE(fileName);
		storeVO.setITEM_PATH("/image/store/" + fileName);
		
		storeService.updateItem(storeVO);
		return "store/modifyitem";
	}
	
	@GetMapping("")
	public ModelAndView store(ModelAndView mv) {
		List<StoreVO> ticketlist = storeService.getItemListByKind("ticket");
		
		mv.setViewName("store/store_cp02");
		mv.addObject("ticketlist", ticketlist);
		return mv;
	}
	
//	@GetMapping("/cp02")
//	public ModelAndView store2(ModelAndView mv) {
//		List<StoreVO> ticketlist = storeService.getItemListByKind("ticket");
//		
//		mv.setViewName("store/store_cp02");
//		mv.addObject("ticketlist", ticketlist);
//		return mv;
//	}
	
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
		
		mv.setViewName("store/store_cp09");
		mv.addObject("voucherlist", voucherlist);
		return mv;
	}
	
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
		@RequestParam("itemCnt") int ITEM_CNT,
		@AuthenticationPrincipal Member member,
		CartVO cartVO,
		ModelAndView mv) {
		cartVO.setITEM_CODE(ITEM_CODE);
		cartVO.setITEM_CNT(ITEM_CNT);
		String MEMBER_ID = member.getMEMBER_ID();
		cartVO.setMEMBER_ID(MEMBER_ID);
		storeService.cartInsert(cartVO);
		
		mv.setViewName("store/item_select");
		return mv;
	}
	
	@GetMapping("/cart")
	public ModelAndView cart(
		CartVO cartVO,
		CouponVO couponVO,
		ModelAndView mv) {
		      
//		List<StoreVO> cartlist = storeService.getCartList();
//		List<CartVO> cartlist2 = storeService.getCartList2();
		List<StoreCartDTO> cartlist = storeService.getCartLists();
		
		mv.setViewName("store/store_cart");
		mv.addObject("cartlist", cartlist);
		return mv;
	}
	
	@PostMapping("/cart")
	@ResponseBody
	public void cart2(
		@RequestParam("itemCode") int ITEM_CODE,
		@AuthenticationPrincipal Member currentUser,
		CartVO cartVO,
		ModelAndView mv) {
		cartVO.setITEM_CODE(ITEM_CODE);
		String MEMBER_ID = currentUser.getMEMBER_ID();
		cartVO.setMEMBER_ID(MEMBER_ID);
		storeService.delCartItem(cartVO);
		
//		mv.setViewName("store/store_cart");
//		return mv;
	}
	
	@PostMapping("/kakaopay")
	@ResponseBody
	public String kakaopay2(
	    @RequestParam("totalPrice") int totalPrice,
	    @AuthenticationPrincipal Member member,
	    @RequestParam("cartItemMenus") String cartItemMenus,
	    @RequestParam("cartItemNames") String cartItemNames) throws UnsupportedEncodingException {
		
//		String[] CartItemMenu = cartItemMenus.split(",");
		
	    String[] CartItemList = cartItemNames.split(",");
	    int Count = CartItemList.length - 1;
	    String itemDisplay;
	    if (Count == 0) {
	    	itemDisplay = CartItemList[0];
	    } else {
	    	itemDisplay = CartItemList[0] + " 외 " + Count + "개";
	    }
	    String itemDisplayEnc = URLEncoder.encode(itemDisplay, "UTF-8");
	    String MEMBER_ID = member.getMEMBER_ID();
	    
	    storeService.payInsert(itemDisplay, totalPrice, MEMBER_ID, cartItemMenus);
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
	                + "&item_name=" + itemDisplayEnc
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
	
	@GetMapping("/success")
	public ModelAndView pay_success(
			@RequestParam(value = "pg_token", required = false, defaultValue = "none") String pg_token,
//			@RequestParam("PAY_NUM") int PAY_NUM,
			ModelAndView mv) {
		
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = dateFormat.format(currentDate);

//		storeService.insertPgToken(PAY_NUM, pg_token);
		if (pg_token.equals("none")) {
		} else {
			storeService.insertPgToken(pg_token, today);
//			storeService.insertCompDate(today);
			storeService.clearCart();
		}
		
		List<StorePayVO> AprPayList = storeService.selectApproved();
//		List<StorePayVO> paylist = storeService.getPayList();
//		List<StoreCartPayDTO> AprPayList = storeService.selectApproveds();
		
//		mv.setViewName("store/pay_success");
		mv.setViewName("store/storepay_success");
//		mv.addObject("paylist", paylist);
		mv.addObject("AprPayList", AprPayList);
		return mv;
	}
	
	@PostMapping("/success")
	@ResponseBody
	public void pay_success2(
			@RequestParam("payNum") int PAY_NUM) {
		storeService.deletePaidItem(PAY_NUM);
	}
	
	@GetMapping("/coupon")
	public ModelAndView coupon_ex(ModelAndView mv) {
//		List<StorePayVO> AprPayList = storeService.selectApproved();
		List<PayCouponDTO> couponList = storeService.getStoreCouponList();
		
		mv.setViewName("store/store_pay_coupon");
//		mv.addObject("AprPayList", AprPayList);
		mv.addObject("couponList", couponList);
		return mv;
	}
	
	@PostMapping("/coupon")
	public void coupon(
			@RequestParam("payNum") int PAY_NUM,
			StorePayVO storepayVO) {
		UUID uuid = UUID.randomUUID();
		String Code = "store" + uuid;
		
		String Menu = storeService.getPayMenuByNum(PAY_NUM);
		
		String[] Menus = Menu.split(",");
		
		String COUPON_TYPE;
		int COUPON_VALUE;
		
		for (int i = 0; i < Menus.length; i++) {
			String eachMenu = Menus[i];
			
			if(eachMenu.equals("ticket")) {
				COUPON_TYPE = "스토어 티켓";
				COUPON_VALUE = 12000;
				storeService.createCoupon(PAY_NUM, Code, COUPON_TYPE, COUPON_VALUE);
			} else if(eachMenu.equals("voucher")) {
				COUPON_TYPE = "스토어 금액권";
				COUPON_VALUE = 10000;
				storeService.createCoupon(PAY_NUM, Code, COUPON_TYPE, COUPON_VALUE);
			} 
		}
	}
}
