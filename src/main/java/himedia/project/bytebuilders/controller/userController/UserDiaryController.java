package himedia.project.bytebuilders.controller.userController;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import himedia.project.bytebuilders.dto.Diary;
import himedia.project.bytebuilders.dto.Topics;
import himedia.project.bytebuilders.repository.DiaryRepository;
import himedia.project.bytebuilders.repository.TopicsRepository;
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
    
	// 이용자 다이어리 전체 목록 이동
	@GetMapping("/diaryList")
	public String diaryList(Model model, @SessionAttribute(name = "user_id", required = false) Integer user_id) {
		
		if(user_id == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "login");
			return "alert";
		}
		
		log.info(user_id.toString());
		
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
	public String diaryForm(Model model, @SessionAttribute(name = "user_id", required = false) Integer user_id) {
		
		if(user_id == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "login");
			return "alert";
		}
		
		List<Topics> topics = topicRepository.findTopics();
		model.addAttribute("topics",topics);
		return "user/diary/diaryForm";
	}
	
	// [저장] 다이어리 작성 폼 저장
	@PostMapping("/diaryForm/save")
	public String diarySave(@RequestParam("formFile") MultipartFile file, @ModelAttribute("diary") Diary diary ,  Topics topics,
			@SessionAttribute(name = "user_id", required = false) Integer user_id, Model model) throws IOException {
		
		if(user_id == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "login");
			return "alert";
		}
		
		diary.setUser_id(user_id); 
		diary.setTopic_id(topics.getTopic_id());                // topics 테이블의 id를 다이어리 테이블로 저장
				
		String filePath = uploadImage(file);  // 파일을 서버에 저장
		diary.setAttachment_file(filePath);                     // 파일 경로를 일기 객체에 저장 
		
		diaryReposiotry.save(diary);
		log.info("첨부파일: {}", diary.getAttachment_file());
		return "redirect:/diaryList";
	}
	// ==============================================================================
	
	// ==============================================================================
	// 다이어리 수정 폼 이동
	@GetMapping("/diaryList/{diary_id}/diaryEditForm")
	public String diaryEditForm(@PathVariable int diary_id, Model model
			, @SessionAttribute(name = "user_id", required = false) Integer user_id) {
		
		if(user_id == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "login");
			return "alert";
		}
		
		model.addAttribute("diary", diaryReposiotry.findDiaryDetail(diary_id).get());
		log.info("[수정] diary id {} ", diary_id);
		return "user/diary/diaryEditForm";
	}
	
	// [수정] 다이어리 수정 완료후 상세페이지로 이동
	@PostMapping("/diaryList/{diary_id}/diaryEditForm")
	public String diaryEdit(@PathVariable int diary_id, 
							@ModelAttribute("diary") Diary diary) {
		diaryReposiotry.update(diary_id, diary);
		
		return "redirect:/diaryList";
	}
	// ==============================================================================
	
	// 다이어리 삭제 완료 후 리스트 페이지로
	@GetMapping("/diaryDeleteCheck/{diary_id}")
	public String diaryDelete(@PathVariable int diary_id, @SessionAttribute(name = "user_id", required = false) Integer user_id,
			Model model) {
		
		if(user_id == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "login");
			return "alert";
		}
		
	    log.info("[삭제] diary_id {}", diary_id);
	    diaryReposiotry.delete(diary_id);
	    return "user/diary/diaryDeleteCheck"; 
	}
	
	// 파일 업로드 메서드
	
	public String uploadImage(MultipartFile file) throws IOException {
		String bucketName = "bytebuilders_img_storage";
		String fileName = UUID.randomUUID().toString()+".png"; //랜덤 이름 부여
		
		InputStream jsonKeyStream = new ClassPathResource("bytebuilders-433006-4e6cda48a989.json").getInputStream();
		
		Storage storage = StorageOptions.newBuilder()
				.setCredentials(ServiceAccountCredentials.fromStream(jsonKeyStream))
				.build()
				.getService();
		
		BlobInfo blobInfo = BlobInfo.newBuilder(BlobId.of(bucketName, fileName)).build();
		
		storage.create(blobInfo, file.getBytes());
		return "https://storage.googleapis.com/"+bucketName+"/"+fileName;
		
	}
}
