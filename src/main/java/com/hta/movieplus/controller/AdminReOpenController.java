package com.hta.movieplus.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;
import com.hta.movieplus.service.ReOpenService;

@Controller
public class AdminReOpenController {

	ReOpenService reopenservice;

	@Autowired
	public AdminReOpenController(ReOpenService reopenservice) {
		this.reopenservice = reopenservice;
	}

	/* 상영종료된 영화의 리스트를 가져오면서 작성 페이지로 이동 */
	@GetMapping("/admin/goreopenwrite")
	public String getEndedMoive(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			Model model) {
		Map<String, Object> paginationDataMap = reopenservice.pagination(page, "상영종료");
		List<Movie> list = reopenservice.getEndMovieListPagination(page, (int) paginationDataMap.get("limit"));
		int reopencount = reopenservice.getCountByEndMovieList();
		
		model.addAllAttributes(paginationDataMap);
		
		model.addAttribute("EndMovieCount", reopencount);
		model.addAttribute("EndMovieList", list);
		return "/admin/reOpenWrite";
	}

	/* 버튼 클릭 시 선택한 영화를 재개봉 예정 영화로 등록 sys.end day추가 / 영화코드추가 */
	@GetMapping("/admin/reopenexpect")
	public String goreopenwrite(String movieCode) {
		reopenservice.insertReOpenExpectMovieImformation(movieCode);
		return "redirect:/admin/reopenexpectlist";
	}

	@GetMapping("/admin/reopenexpectlist")
	public String reopenExpectlist(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			Model model) {
		Map<String, Object> paginationDataMap = reopenservice.pagination(page, "재개봉");
		List<ReOpenVO> list = reopenservice.getReopenlistPagination(page, (int) paginationDataMap.get("limit"));
		int reopencount = reopenservice.getCountByReopen();
		
		model.addAllAttributes(paginationDataMap);
		
		model.addAttribute("reopenCount", reopencount);
		model.addAttribute("expectMovieList", list);
		return "/admin/reOpenList";
	}
	
	@GetMapping("/admin/cancelreopen")
	public String cancelReOpen(String cancelcode) {
		reopenservice.cancelReOpen(cancelcode);
		return "redirect:/admin/reopenexpectlist";
	}
	
	
}
