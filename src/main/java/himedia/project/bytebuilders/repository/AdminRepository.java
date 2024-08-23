package himedia.project.bytebuilders.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Select;

import himedia.project.bytebuilders.dto.Admin;

public interface AdminRepository {
	
	// 작성자 : 양한재
	// id , pw 검사
	@Select("SELECT * FROM admin WHERE admin_key LIKE #{admin_key} AND admin_password LIKE #{admin_password}")
	public Optional<Admin> login(Admin admin);
}
