package himedia.project.bytebuilders.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.project.bytebuilders.dto.Diary;
import himedia.project.bytebuilders.dto.Notice;
import himedia.project.bytebuilders.repository.DiaryRepository;
import himedia.project.bytebuilders.repository.NoticeRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	
	public DiaryRepository diaryReposiotry;
	public NoticeRepository noticeRepository;
	
	@Autowired
	public UserController(DiaryRepository diaryReposiotry, NoticeRepository noticeRepository) {
		this.noticeRepository = noticeRepository;
		this.diaryReposiotry = diaryReposiotry;
	}
	
	// user controller 	임시 작업중
	@GetMapping("/notice")
	public String notice() {
		return "user/notice";
	}
	
	// 다이어리 작성 폼이동
	@RequestMapping("/diaryForm")
	public String diaryForm() {
		return "user/diary/diaryForm";
	}
	
	// 이용자 다이어리 전체 목록 이동
	@GetMapping("/diaryList")
	public String diaryList(Model model) {
		List<Diary> diaryList = diaryReposiotry.findAllDiary();
		model.addAttribute("diary", diaryList);
		return "user/diary/diaryList";
	}
	
	// 다이어리 전체 목록 이동
	@GetMapping("/allDiaries")
	public String diaryAllList(Model model) {
		List<Diary> diaryList = diaryReposiotry.findAllDiary();
		model.addAttribute("diary", diaryList);
		return "user/allDiaries";
	}
	
	// 다이어리 상세 페이지 이동
	// 작성자 : 최은지
	@GetMapping("/diaryDetail/{diary_id}")
	public String diaryDetail(@PathVariable int diary_id, Model model) {
		System.out.println("다이어리 아이디 :" +  diary_id);
		Optional<Diary> diaryDetail = diaryReposiotry.findDiaryDetail(diary_id);
		model.addAttribute("diaryList", diaryDetail.get());
		return "user/diary/diaryDetail";
	}
	
//	// 작성자 : 노태윤 (8/26)
//	// 기능 설명: noticeSearchResults로 이동
//	@PostMapping("/noticeSearchResults")
//	public String noticeSearch(@RequestParam("notice") String notice, Model model) {
//		model.addAttribute("NoticeList", noticeRepository.findbytitle(notice));
//		return "user/search/noticeSearchResults";
//	}
	
	// 작성자 : 노태윤 (8/26)
	// 기능 설명: userNotice로 이동 
	@GetMapping("/userNotice")
	public String userNotice(Model model) {
		List<Notice> noticeList = noticeRepository.findAll();
		model.addAttribute("NoticeList", noticeList);
		return "user/notice/userNotice";
	}
	
	

}
