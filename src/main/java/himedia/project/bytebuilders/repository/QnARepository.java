package himedia.project.bytebuilders.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import himedia.project.bytebuilders.dto.QnA;

public interface QnARepository {

	@Insert("INSERT INTO QnA ( nonmem_email, inquiry_date, inquiry_content ) "
			+ "VALUES(#{nonmem_email},'2024-08-23', #{inquiry_content})")
	public void qnaSave(QnA qna);
	
	// 임시 작업 user_id 리스트
	@Select("SELECT user_id, inquiry_id "
			+ "FROM QnA LIMIT 20")
	public List<QnA> userIdFind();
	
	// [이용자] 문의 리스트 문의 제목은?
	@Select("SELECT inquiry_id, user_id, inquiry_date, inquiry_content "
			+ "FROM QnA "
			+ "WHERE user_id = #{user_id}")
	List<QnA> qnaList(int user_id); 
	
	// [이용자] 문의 상세내용
	@Select("SELECT inquiry_id, user_id ,inquiry_date, inquiry_content "
			+ "FROM QnA "
			+ "WHERE inquiry_id = #{inquiry_id}")
	Optional<QnA> findQnADetail(int inquiry_id);
	
	// [관리자 문의 조회] 노태윤
    @Select("SELECT * FROM QnA")
    List<QnA> findQnA();
    
}
