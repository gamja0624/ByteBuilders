package himedia.project.bytebuilders.dto;


import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class Diary {
	
	// 필드
	int diary_id;
	int user_id;
	String diary_title;
	String diary_content;
	Date create_date;
	Date diary_date;
	boolean is_public;
	String attachment_file;
	
	// 생성자
	public Diary(int diary_id, int user_id,String diary_title, String diary_content, Date create_date, Date diary_date,
			boolean is_public, String attachment_file) {
		this.diary_id = diary_id;
		this.user_id = user_id;
		this.diary_title = diary_title;
		this.diary_content = diary_content;
		this.create_date = create_date;
		this.diary_date = diary_date;
		this.is_public = is_public;
		this.attachment_file = attachment_file;
	}
}
