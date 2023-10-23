package com.hta.movieplus.controller;

import java.util.List;

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
	public String getEndedMoive(Model model) {
		List<Movie> endedMoiveList = reopenservice.getEndedMovieList();
		model.addAttribute("endedMovieList", endedMoiveList);
		return "/admin/reOpenWrite";
	}

	/* 버튼 클릭 시 선택한 영화를 재개봉 예정 영화로 등록 sys.end day추가 / 영화코드추가 */
	@GetMapping("/admin/reopenexpect")
	public String goreopenwrite(String movieCode) {
		reopenservice.insertReOpenExpectMovieImformation(movieCode);
		return "redirect:/admin/reopenexpectlist";
	}

	@GetMapping("/admin/reopenexpectlist")
	public String reopenExpectlist(Model model) {
		List<ReOpenVO> expectmovielist= reopenservice.getExpectMovieList();
		model.addAttribute("expectMovieList", expectmovielist);
		return "/admin/reOpenList";
	}
	
	@GetMapping("/admin/cancelreopen")
	public String cancelReOpen(String cancelcode) {
		reopenservice.cancelreopen(cancelcode);
		return null;
	}
}
