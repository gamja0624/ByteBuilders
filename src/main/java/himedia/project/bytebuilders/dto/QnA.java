package himedia.project.bytebuilders.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class QnA {
	// QnA필드
	private int inquiry_id;
	private int user_id;
	private String nonmem_email;
	private Date inquiry_date;
	private String inquiry_content;
	
	// 생성자 
	public QnA(int inquiry_id, int user_id, String nonmem_email, Date inquiry_date, String inquiry_content) {
		this.inquiry_id = inquiry_id;
		this.user_id = user_id;
		this.nonmem_email = nonmem_email;
		this.inquiry_date = inquiry_date;
		this.inquiry_content = inquiry_content;
	}
	
	

}
