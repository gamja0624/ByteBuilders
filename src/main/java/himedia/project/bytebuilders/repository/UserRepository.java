package himedia.project.bytebuilders.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import himedia.project.bytebuilders.dto.User;

public interface UserRepository {

	//회원가입
	@Insert("INSERT INTO user(email, phonenumber, password, signup_date)"
			+ "VALUES(#{email}, #{phonenumber}, #{password}, '2024-08-23')")
	public void userSave(User user);  //void userSave(User user)
	
	// 모든 사용자 조회
    @Select("SELECT * FROM user")
    List<User> findAll();	
	// 작성자 : 노태윤
	// [유저 전체 목록] 출력
	@Select("SELECT user_id,email,phonenumber,signup_date,delete_id "
			+ "FROM user")
	List<User> findUser();

	// [검색] 관리자입장에서 유저 검색
	@Select("SELECT user_id,email,phonenumber,signup_date,delete_id "
			+ "FROM user "
			+ "WHERE user_id LIKE CONCAT('%', #{user_id},'%')")
	List<User> UserSearch(int user_id);

	// 작성자 : 양한재
	// 이메일, pw 검사
	@Select("SELECT *"
			+ " FROM user"
			+ " WHERE email LIKE #{email} AND password LIKE #{password}")
	Optional<User> login(User user);
	
}
