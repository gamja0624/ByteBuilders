package himedia.project.bytebuilders.controller.userController;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import himedia.project.bytebuilders.dto.Notice;
import himedia.project.bytebuilders.dto.QnA;
import himedia.project.bytebuilders.dto.User;
import himedia.project.bytebuilders.repository.NoticeRepository;
import himedia.project.bytebuilders.repository.QnARepository;
import himedia.project.bytebuilders.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserBasicController {
	
    private UserRepository userRepository;
	private QnARepository qnaRepositroy;
	public NoticeRepository noticeRepository;
	
	@Autowired
	public UserBasicController(UserRepository userRepository, QnARepository qnaRepositroy, NoticeRepository noticeRepository) {
		this.userRepository = userRepository;
		this.qnaRepositroy = qnaRepositroy;
		this.noticeRepository = noticeRepository;
	}
 	
	@GetMapping("/notice")
	public String userNotice(Model model) {
		List<Notice> noticeList = noticeRepository.findAll();
		model.addAttribute("NoticeList", noticeList);
		return "user/notice";
	}
	
	@GetMapping ("/about")
	public String about() {
		return "user/about";
	}
	@GetMapping("/policy")
	public String policy() {
		return "user/policy";
	}
	
    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("user", new User());
        log.info("[controller]실행");
        return "user/account/signup";  
    }
    
    @PostMapping("/signup")
    public String registerUser(@ModelAttribute User user) {
        log.info("[controller] registerUser 종료");  
        userRepository.userSave(user);
        return "redirect:/login"; 
    }
    
    @GetMapping("/login")
    public String login() {
    	return "user/account/login";
    }
    
    
    // 임시 컨트롤러 (이용자 목록 조회)
    @GetMapping("/test")
    public String test(Model model) {
    	List<QnA> user = qnaRepositroy.userIdFind();
    	model.addAttribute("QnA", user);
    	return "user/qna/userIdTest";
    }
    
    // 문의 작성    
    @GetMapping("/qnaForm")
    public String qnaForm () {
    	return "user/qna/qnaForm";
    }
    
    // 문의 저장
    @PostMapping("/qnaForm/submit")
    public String qnaSave(@ModelAttribute("QnA") QnA qna) {
    	log.info(" qna 저장 ");
    	qnaRepositroy.qnaSave(qna);
    	log.info("qna 내용 {}",  qna.getInquiry_content());
    	return "redirect:/qnaSubmit";
    }
    
    @GetMapping("/qnaSubmit")
    public String qnaSumbit() {
    	return "user/qna/qnaSubmit";
    }
   
    // 문의 목록 조회
    @GetMapping("/qnaList/{user_id}")
    public String qnaList(@PathVariable int user_id, Model model) {
    	List<QnA> qnaList = qnaRepositroy.qnaList(user_id);
    	model.addAttribute("QnA", qnaList);
    	return "user/qna/qnaList";
    }
    
    // 문의 상세 내용 조회
    @GetMapping("/qnaDeatil/{inquiry_id}")
    public String qnaDetail(@PathVariable int inquiry_id, Model model) {
    	Optional<QnA> qnaDetail = qnaRepositroy.findQnADetail(inquiry_id);
    	model.addAttribute("QnA", qnaDetail.get());
    	return "user/qna/qnaDetail";
    }
	
	
}
