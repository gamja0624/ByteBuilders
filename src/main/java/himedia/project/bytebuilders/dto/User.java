package himedia.project.bytebuilders.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter

public class User {

	private int userId;
	private String email;
	private String phonenumber;
	private String password;
	private Date signupDate;
	private boolean deleteId;

	public User(int userId, String email, String phonenumber, String password, Date signupDate, boolean deleteId) {
		this.userId = userId;
		this.email = email;
		this.phonenumber = phonenumber;
		this.password = password;
		this.signupDate = signupDate;
		this.deleteId = deleteId;
	}
	
}