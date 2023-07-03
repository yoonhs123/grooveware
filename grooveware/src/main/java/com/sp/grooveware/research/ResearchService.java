package com.sp.grooveware.research;

import java.util.List;
import java.util.Map;

public interface ResearchService {
	public void insertResearch(Research dto) throws Exception;
	public void updateResearch(Research dto) throws Exception;
	public void deleteResearch(long research_id) throws Exception;
	
	public List<Research> listResearch(Map<String, Object> map);
	public Research readResearch(long research_id);

}
