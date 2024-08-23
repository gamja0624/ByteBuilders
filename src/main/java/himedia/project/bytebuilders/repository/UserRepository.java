package himedia.project.bytebuilders.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import himedia.project.bytebuilders.dto.User;

public interface UserRepository {
	
	// [유저 전체 목록] 출력
	@Select("SELECT user_id,email,phonenumber,signup_date,delete_id FROM user")
	List<User> findUser();

	// [검색] 관리자입장에서 유저 검색
	@Select("SELECT user_id,email,phonenumber,signup_date,delete_id "
			+ "FROM user "
			+ "WHERE user_id LIKE CONCAT('%', #{user_id},'%')")
	List<User> UserSearch(int user_id);

}
