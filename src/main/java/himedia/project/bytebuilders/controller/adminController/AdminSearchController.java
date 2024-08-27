package himedia.project.bytebuilders.controller.adminController;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.bytebuilders.dto.Diary;
import himedia.project.bytebuilders.dto.User;
import himedia.project.bytebuilders.repository.DiaryRepository;
import himedia.project.bytebuilders.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminSearchController {

	// 의존성 주입
	private final UserRepository UserListRepository;
	private final DiaryRepository diaryRepository;

	public AdminSearchController(UserRepository UserRepository, DiaryRepository diaryRepository) {
		this.UserListRepository = UserRepository;
		this.diaryRepository = diaryRepository;
	}

	// 작성자 : 노태윤 8/22일 작성
	// 기능 요약 : index에서 admin/memberList로 페이지 이동
	// 전 : index.jsp 후 : memberList.jsp
	@GetMapping("/memberList")
	public String MemberList(Model model) {
		List<User> user = UserListRepository.findUser();
		model.addAttribute("user", user);
		return "admin/member/memberList";
	}
	
	@GetMapping("/searchBar")
	public String search() {
		return "user/search/searchBar";
	}
	
	// 작성자 : 노태윤 8/23일 작성
	// 기능 요약 : search bar에서 membersearch로 이동할때 검색 기능
	// 전 : search bar 후 : membersearch
	@GetMapping("/memberSearchResults")
	public String MemberSearch(@RequestParam("user") int user, Model model) {
	    model.addAttribute("user", UserListRepository.UserSearch(user));
	    return "admin/member/memberSearchResults";
	}
	
    // 8/25 노태윤작성
    @GetMapping("/memberDiaryDetail")
    public String diaryDetail(@RequestParam(value = "id", required = true) int diary_id, Model model) {
        Diary diary = diaryRepository.findById(diary_id);
        model.addAttribute("diary", diary);
        return "admin/member/memberDiaryDetail";
    }

	
	
	
}
