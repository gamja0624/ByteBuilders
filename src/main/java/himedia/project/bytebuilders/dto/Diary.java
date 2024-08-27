package himedia.project.bytebuilders.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class Diary {
	
	// 필드
	private int diary_id;
	private int user_id;
	private int topic_id;
	private String diary_title;
	private String diary_content;
	private Date diary_date;
	private Date create_date;
	private boolean is_public;
	private String attachment_file;
	private Integer emoji_id;
	
	// 생성자
	public Diary(int user_id, int topic_id, 
			String diary_title, String diary_content,  
			Date diary_date, Date create_date,
			boolean is_public, String attachment_file, Integer emoji_id) {
		this.user_id = user_id;
		this.topic_id = topic_id;
		this.diary_title = diary_title;
		this.diary_content = diary_content;
		this.diary_date = diary_date;
		this.create_date =create_date;
		this.is_public = is_public;
		this.attachment_file = attachment_file;
		this.emoji_id = emoji_id;
	}

}
