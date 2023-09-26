package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {
	
	@GetMapping("/store")
	public String store() {
		return "store/store_cp02";
	}
	
	@GetMapping("/store_cp02")
	public String store2() {
		return "store/store_cp02";
	}
	
	@GetMapping("/store_cp05")
	public String store5() {
		return "store/store_cp05";
	}
	
	@GetMapping("/store_cp09")
	public String store9() {
		return "store/store_cp09";
	}
	
	@GetMapping("/store_cp07")
	public String score7() {
		return "store/store_cp07";
	}
	
	@GetMapping("/store_item")
	public String item() {
		return "store/item_selection";
	}
}
