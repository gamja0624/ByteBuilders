package himedia.project.bytebuilders.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import himedia.project.bytebuilders.dto.QnA;

public interface QnARepository {
	
    // [문의 전체 목록] 출력
    @Select("SELECT * FROM QnA")
    List<QnA> findQnA();

//    // [특정 문의 검색] 
//    @Select("SELECT * FROM QnA WHERE inquiry_id = #{inquiryId}")
//    QnA findQnAById(int inquiryId);
}
