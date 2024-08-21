package himedia.project.bytebuilders.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.bytebuilders.dto.Diary;


public interface DiaryRepository {

	// [ 저장 ] 일기 저장
//	@Insert("INSERT INTO diary(diary_title, diary_content, create_date, diary_date, is_public, attachment_file)"
//			+ "VLAUES(#{diary_title}, #{diary_content}, #{create_date}, #{diary_date}, #{is_public}, #{attachment_file})")
//	void save (Diary dairy);
	
	// [ 조회 ] 일기 상세 페이지 조회 ( 일기 제목, 일기 날짜, 일기 내용, 일기 이미지, 공개 여부, * (+) 주제, 이모지 )
	@Select("SELECT diary_id, diary_title, diary_date, diary_content, attachment_file, is_public FROM diary WHERE diary_id = #{diary_id}")
	Optional<Diary> findDiaryDetail(int diary_id);
	
	// [ 조회 ] 전체 다이어리 리스트 조회 ( 일기 제목, 일기 날짜, 일기 이미지)
	@Select("SELECT diary_id ,diary_title, diary_date, attachment_file FROM diary")
	List<Diary> findAllDiary();
	
	// [ 조회 ] 이용자 다이어리 리스트 조회
//	@Select("SELECT diary_id, user_id, diary_title, diary_date, attachment_file FROM diary WHERE user_id = #{user_id}")
//	Optional<Diary> findDiaryList (int user_id);
	
	// [ 수정 ] 일기 수정
	// @Update ("UPDATE item 
	// SET name = #{updateItem.name}, price = #{updateItem.price}, quantity = #{updateItem.quantity}  
	// WHERE id = #{itemId}")
	@Update("UPDATE diary"
			  +	"SET diary_title = #{updateDiary.diary_title}, diary_content = #{updateDiary.diary_content}, diary_date = #{updateDiary.diary_date},is_public = #{updateDiary.is_public}"  
			  +	"WHERE diary_id=#{diary_id}")
	int update(@Param("diary_id") int diary_id, Diary updateDiary);
	
	// [ 삭제 ] 일기 삭제
	//@Delete
	
}