package himedia.project.bytebuilders.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import himedia.project.bytebuilders.dto.Admin;
import himedia.project.bytebuilders.dto.Notice;
import himedia.project.bytebuilders.repository.AdminRepository;
import himedia.project.bytebuilders.repository.DiaryRepository;
import himedia.project.bytebuilders.repository.NoticeRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final NoticeRepository noticeRepository;
	private final AdminRepository adminRepository;
	private final DiaryRepository diaryRepository;  // 일기 리포지토리 추가

	public AdminController(NoticeRepository noticeRepository, AdminRepository adminRepository, DiaryRepository diaryRepository) {
		this.noticeRepository = noticeRepository;
		this.adminRepository = adminRepository;
		this.diaryRepository = diaryRepository;  // 생성자에 추가
	}

	//로그인 관련
	//작성자 : 양한재
	@GetMapping("/login")
	public String adminLogin() {
		return "admin/login";
	}
	
	@PostMapping("/login")
	public String adminLoginCheck(@ModelAttribute("admin") Admin admin,
			HttpServletRequest request, Model model,
			RedirectAttributes ra) {
		
		if(adminRepository.login(admin).isPresent()) {
			HttpSession session = request.getSession();
			session.setAttribute("admin_key", admin.getAdmin_key());
			return "redirect:/admin/notice";
		} 
		
//		model.addAttribute("loginFailure", true );
		//ra.addAttribute("message", "아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.") ;
		ra.addFlashAttribute("loginFailure", true);
		
		return "redirect:/admin/login";
	}
	
	@GetMapping("/logout")
	public String adminLogout(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		if(session != null){
			session.invalidate();
		}
		return "redirect:/admin/login";
	}

	// 공지사항 관련
	// 작성자 : 양한재
	@GetMapping("/notice")
	public String noticeList(@SessionAttribute(name = "admin_key", required = false) String admin_key, Model model) {
	
		if(admin_key == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "admin/login");
			return "alert";
		}
		
		model.addAttribute("notices", noticeRepository.findAll());
		return "admin/notice/noticeList";
	}
	
	@GetMapping("/notice/{noticeId}")
	public String noticeDetail(@PathVariable("noticeId") int noticeId, Model model,
			@SessionAttribute(name = "admin_key", required = false) String admin_key) {
		
		if(admin_key == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "admin/login");
			return "alert";
		}
		
		Notice notice = noticeRepository.findbyId(noticeId);
		notice.setNotice_content(notice.getNotice_content().replace("<br>", "\r\n"));
		
		model.addAttribute("notice", notice);
		return "admin/notice/noticeDetail";
	}
	
	@GetMapping("/noticePost")
	public String noticeForm(@SessionAttribute(name = "admin_key", required = false) String admin_key,
			Model model) {
		
		if(admin_key == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "admin/login");
			return "alert";
		}
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());   // 공지사항 작성일 입력
		
		model.addAttribute("admin_key", admin_key);
		model.addAttribute("date", date);
		
		return "admin/notice/noticeForm";
	}
	
	@PostMapping("/noticePost")
	public String noticePost(@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content,
			@SessionAttribute("admin_key") String admin_key) {
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());   // 공지사항 작성일 입력
		
		notice_content = notice_content.replace("\r\n", "<br>");
		
		noticeRepository.save(admin_key, notice_title,notice_content, date);
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/noticeEdit/{noticeId}")
	public String noticeEditForm(@PathVariable("noticeId") int noticeId, Model model,
			@SessionAttribute(name = "admin_key", required = false) String admin_key) {
		
		if(admin_key == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "admin/login");
			return "alert";
		}
		
		Notice notice = noticeRepository.findbyId(noticeId);
		notice.setNotice_content(notice.getNotice_content().replace("<br>", "\r\n"));
		
		model.addAttribute("notice", notice);
		return "admin/notice/noticeEditForm";
	}
	
	@PostMapping("/noticeEdit/{noticeId}")
	public String noticeEdit(@PathVariable("noticeId") int noticeId, @ModelAttribute("notice") Notice notice,
			@SessionAttribute("admin_key") String admin_key) {
		
		notice.setNotice_content(notice.getNotice_content().replace("\r\n", "<br>"));
		
		noticeRepository.update(notice, noticeId);
		return "redirect:/admin/notice/"+noticeId;
	}
	
	@GetMapping("/noticeDelete/{noticeId}")
	public String noticeDelete(@PathVariable("noticeId") int noticeId,
			@SessionAttribute(name = "admin_key", required = false) String admin_key, Model model) {
		
		if(admin_key == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "admin/login");
			return "alert";
		}
		
		noticeRepository.delete(noticeId);
		return "redirect:/admin/notice";
	};
	
	// 노태윤 
    // 멤버 일기 목록으로 이동
    @GetMapping("/memberDiaryList")
    public String diaryList(Model model) {
        model.addAttribute("DiaryList", diaryRepository.findAll());
        return "admin/member/memberDiaryList";
    }
    
    // 노태윤
    // 관리자입장에서 유저 검색 
	@PostMapping("/diarySearchResults")
	public String diarySearch(@RequestParam("diary") String diaryTitle, Model model) {
		model.addAttribute("DiaryList", diaryRepository.findByTitleDiary(diaryTitle));
		return "user/search/diarySearchResults";
	}
    
    // 노태윤
    // 일기 삭제 기능 추가
    @PostMapping("/diaryDelete/{diaryId}")
    public String deleteDiary(@PathVariable("diaryId") int diaryId, @SessionAttribute("admin_key") String admin_key) {
        diaryRepository.delete(diaryId);
        return "redirect:/admin/memberDiaryList";
    }

	
	
	
	
}
