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

import himedia.project.bytebuilders.dto.Admin;
import himedia.project.bytebuilders.dto.Notice;
import himedia.project.bytebuilders.repository.AdminRepository;
import himedia.project.bytebuilders.repository.NoticeRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final NoticeRepository noticeRepository;
	private final AdminRepository adminRepository;
	
	//의존성 주입
	public AdminController(NoticeRepository noticeRepository, AdminRepository adminRepository) {
		this.noticeRepository = noticeRepository;
		this.adminRepository = adminRepository;
	}

	//로그인 관련
	//작성자 : 양한재
	@GetMapping("/login")
	public String adminLogin() {
		return "admin/login";
	}
	
	@PostMapping("/login")
	public String adminLoginCheck(@ModelAttribute("admin") Admin admin,
			HttpServletRequest request) {
		
		if(adminRepository.login(admin).isPresent()) {
			HttpSession session = request.getSession();
			session.setAttribute("admin_key", admin.getAdmin_key());
			return "redirect:/admin/notice";
		}
		
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
	public String noticeList(Model model, @SessionAttribute("admin_key") String admin_key) {
		
		model.addAttribute("notices", noticeRepository.findAll());
		return "admin/notice/noticeList";
	}
	
	@GetMapping("/notice/{noticeId}")
	public String noticeDetail(@PathVariable("noticeId") int noticeId, Model model,
			@SessionAttribute("admin_key") String admin_key) {
		
		model.addAttribute("notice", noticeRepository.findbyId(noticeId));
		return "admin/notice/noticeDetail";
	}
	
	@GetMapping("/noticePost")
	public String noticeForm(@SessionAttribute("admin_key") String admin_key) {
		
		return "admin/notice/noticeForm";
	}
	
	@PostMapping("/noticePost")
	public String noticePost(@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content,
			@SessionAttribute("admin_key") String admin_key) {
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());   // 공지사항 작성일 입력
		
		log.info(notice_content);
		notice_content = notice_content.replace("\r\n", "<br>");
		
		noticeRepository.save(admin_key, notice_title,notice_content, date);
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/noticeEdit/{noticeId}")
	public String noticeEditForm(@PathVariable("noticeId") int noticeId, Model model,
			@SessionAttribute("admin_key") String admin_key) {
		
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
			@SessionAttribute("admin_key") String admin_key) {
		
		noticeRepository.delete(noticeId);
		return "redirect:/admin/notice";
	};
	
}
