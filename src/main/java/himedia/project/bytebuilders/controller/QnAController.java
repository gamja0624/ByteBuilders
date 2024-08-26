package himedia.project.bytebuilders.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import himedia.project.bytebuilders.dto.QnA;
import himedia.project.bytebuilders.repository.QnARepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnAController {
    
    // 의존성 주입
    private final QnARepository qnaRepository;
    
    public QnAController(QnARepository qnaRepository) {
        this.qnaRepository = qnaRepository;
    }
    
    // 작성자 : 노태윤 8/23일 작성
    // 기능 요약 : index에서 admin/qnaList로 페이지 이동
    // 전 : index.jsp 후 : qnaList.jsp
    @GetMapping("/QnAList")
    public String qnaList(Model model) {
        List<QnA> QnA = qnaRepository.findQnA();
        model.addAttribute("QnA", QnA);
        return "admin/QnA/QnAList";
    }
    
}
