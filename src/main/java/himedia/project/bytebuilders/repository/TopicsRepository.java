package himedia.project.bytebuilders.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import himedia.project.bytebuilders.dto.Topics;

public interface TopicsRepository {

	@Select("SELECT * "
			+ "FROM topics ")
	List<Topics> findTopics();
	// 옵셔널에서 List 로 수정
}
