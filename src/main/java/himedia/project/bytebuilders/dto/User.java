package himedia.project.bytebuilders.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter @Setter
@NoArgsConstructor
public class User {
	// User 필드
	private Integer user_id;
	private String email;
	private String phonenumber;
	private String password;
	private Date signup_date;
	private boolean delete_id;
	
	// 생성자
	public User(Integer user_id, String email, String phonenumber, 
		String password, Date signup_date, boolean delete_id) {
		this.user_id = user_id;
		this.email = email;
		this.phonenumber = phonenumber;
		this.password = password;
		this.signup_date = signup_date;
		this.delete_id = delete_id;
	}

}
