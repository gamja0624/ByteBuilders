package himedia.project.bytebuilders.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Notice {
	
	private int notice_id;
	private String admin_key;
	private String 	notice_title;
	private String notice_content;
	private String notice_date;
	private boolean notice_priority;
	
	public Notice(String admin_key, String notice_title, String notice_content, String notice_date,
			boolean notice_priority) {
		this.admin_key = admin_key;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_priority = notice_priority;
	}
	
}
