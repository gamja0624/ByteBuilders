package himedia.project.bytebuilders.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.bytebuilders.dto.Notice;

public interface NoticeRepository {
	
	// 작성자 : 양한재
	// 공지사항 목록 출력
	@Select("SELECT notice_id,notice_title,notice_date "
			+ "FROM notice")
	public List<Notice> findAll();
	
	// 작성자 : 양한재
	// 공지사항 id로 공지사항 1개 상세 조회
	@Select("SELECT notice_id, admin_key, notice_title,notice_date, notice_content "
			+ "FROM notice "
			+ "WHERE notice_id = #{notice_id}")
	public Notice findbyId(int notice_id);
	
	// 작성자 : 양한재
	// 공지사항 작성
	@Insert("INSERT INTO notice(admin_key,notice_title,notice_content,notice_date,notice_priority) "
			+ "VALUES (#{admin_key},#{notice_title},#{notice_content},#{date},false)")
	public void save(@Param("admin_key") String admin_key, @Param("notice_title") String notice_title, @Param("notice_content") String notice_content, @Param("date") String date);

	// 작성자 : 양한재
	// 공지사항 수정
	@Update("UPDATE notice "
			+ "SET notice_title= #{notice.notice_title},"
			+ "notice_content= #{notice.notice_content} "
			+ "WHERE notice_id = #{id}")
	public void update(@Param("notice") Notice notice, @Param("id") int id);
	
	// 작성자 : 양한재
	// 공지사항 삭제
	@Delete("DELETE "
			+ "FROM notice "
			+ "WHERE notice_id = #{id} ")
	public void delete(int id);
	
	// 작성자 : 노태윤
	// [검색 ] 공지 title로 검색하기 
	@Select("SELECT * FROM notice "
			+ "WHERE notice_title "
			+ "LIKE CONCAT('%', #{notice_title},'%')") // %는 부분검색도가능하게해줌 와일드카드
	List<Notice> findbytitle(String notice_title);
}
