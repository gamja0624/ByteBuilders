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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import himedia.project.bytebuilders.dto.Diary;
import himedia.project.bytebuilders.dto.QnA;
import himedia.project.bytebuilders.dto.Topics;
import himedia.project.bytebuilders.repository.DiaryRepository;
import himedia.project.bytebuilders.repository.TopicsRepository;
import himedia.project.bytebuilders.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserDiaryController {
	
	public DiaryRepository diaryReposiotry;
	public TopicsRepository topicRepository;
    
	@Autowired
	public UserDiaryController(DiaryRepository diaryReposiotry, TopicsRepository topicRepository) {
		this.diaryReposiotry = diaryReposiotry;
		this.topicRepository = topicRepository;
	}
	
    
    // 임시 컨트롤러 (이용자 목록 조회)
    @GetMapping("/test02")
    public String test(Model model) {
    	List<Diary> user = diaryReposiotry.userIdFindD();
    	model.addAttribute("diary", user);
    	return "user/diary/userIdTest02";
    }
    
	
	// 이용자 다이어리 전체 목록 이동 ( 수정 예정 -> 이용자 아이디 필요)
	@GetMapping("/diaryList")
	public String diaryList(@PathVariable int user_id, Model model) {
		List<Diary> diaryList = diaryReposiotry.findDiary(user_id);
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
	@GetMapping("/diaryDetail/{diary_id}")
	public String diaryDetail(@PathVariable int diary_id, Model model) {
		log.info("다이어리 아이디:" , diary_id);
		Optional<Diary> diaryDetail = diaryReposiotry.findDiaryDetail(diary_id);
		model.addAttribute("diary", diaryDetail.get());
		return "user/diary/diaryDetail";
	}
	
	// ### Error updating database. ================================================= 
	// Cause: java.sql.SQLSyntaxErrorException: 
	// You have an error in your SQL syntax; 
	// check the manual that corresponds to
	// your MySQL server version for the right syntax to use near 
	// 'VLAUES(null, null, null, null, 0, null)' at line 1
	// ==============================================================================
	
	// ==============================================================================
	// 다이어리 작성 폼 이동
	@GetMapping("/diaryForm")
	public String diaryForm(Model model) {
		List<Topics> topics = topicRepository.findTopics();
		model.addAttribute("topics",topics);
		return "user/diary/diaryForm";
	}
	
	// [저장] 다이어리 작성 폼 저장
	@PostMapping("/diaryForm/save")
	public String diarySave(@ModelAttribute("diary") Diary diary, Topics topics,  @RequestParam("formFile") MultipartFile file) {
		
		diary.setTopic_id(topics.getTopic_id());                // topics 테이블의 id를 다이어리 테이블로 저장
		
		String filePath = "경로" + file.getOriginalFilename();  // 파일을 서버에 저장
		diary.setAttachment_file(filePath);                     // 파일 경로를 일기 객체에 저장 
		
		diaryReposiotry.save(diary);
		log.info("첨부파일: {}", diary.getAttachment_file());
		return "redirect:/diaryList";
	}
	// ==============================================================================
	
	
	// ==============================================================================
	// 다이어리 수정 폼 이동
	@GetMapping("/diaryList/{diary_id}/diaryEditForm")
	public String diaryEditForm(@PathVariable int diary_id, Model model) {
		model.addAttribute("diary", diaryReposiotry.findDiaryDetail(diary_id).get());
		log.info("[수정] diary id {} ", diary_id);
		return "user/diary/diaryEditForm";
	}
	
	// [수정] 다이어리 수정 완료후 상세페이지로 이동
	@PostMapping("/diaryList/{diary_id}/diaryEditForm")
	public String diaryEdit(@PathVariable int diary_id, 
							@ModelAttribute("diary") Diary diary) {
		diaryReposiotry.update(diary_id, diary);
		log.info("공개 여부 처리 {} ", diary.getIs_public());
		return "redirect:/diaryList";
	}
	// ==============================================================================
	
	// 다이어리 삭제 완료 후 리스트 페이지로
	@GetMapping("/diaryDeleteCheck/{diary_id}")
	public String diaryDelete(@PathVariable int diary_id) {
	    log.info("[삭제] diary_id {}", diary_id);
	    diaryReposiotry.delete(diary_id);
	    return "user/diary/diaryDeleteCheck"; 
	}
}
