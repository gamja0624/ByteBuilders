package himedia.project.bytebuilders.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class Topics {
	private int topic_id;
	private String content;
	
	public Topics(int topic_id, String content) {
		super();
		this.topic_id = topic_id;
		this.content = content;
	}
	
	
	
}
