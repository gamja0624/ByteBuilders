package himedia.project.bytebuilders.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Admin {
	
	private String admin_key;
	private String admin_password;
	
	public Admin(String admin_key, String admin_password) {
		this.admin_key = admin_key;
		this.admin_password = admin_password;
	}
	
}
