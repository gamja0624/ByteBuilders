package himedia.project.bytebuilders.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bytebuilders.repository.DiaryRepository;
import himedia.project.bytebuilders.repository.NoticeRepository;

//UserSearchController
@Controller
public class UserSearchController {

	// 의존성 주입
	private final NoticeRepository searchRepository;
	private final DiaryRepository diaryRepository;

	public UserSearchController(NoticeRepository searchRepository, DiaryRepository diaryRepository ) {
		this.searchRepository = searchRepository;
		this.diaryRepository = diaryRepository;
	}

	@GetMapping("/searchBar")
	public String search() {
		return "user/search/searchBar";
	}

	@PostMapping("/noticeSearchResults")
	public String noticeSearch(@RequestParam("notice") String notice, Model model) {
		model.addAttribute("NoticeList", searchRepository.findbytitle(notice));
		return "user/search/noticeSearchResults";
	}
	
	@PostMapping("/diarySearchResults")
	public String diarySearch(@RequestParam("diary") String diaryTitle, Model model) {
		model.addAttribute("DiaryList", diaryRepository.findbytitlediary(diaryTitle));
		return "user/search/diarySearchResults";
	}

}
