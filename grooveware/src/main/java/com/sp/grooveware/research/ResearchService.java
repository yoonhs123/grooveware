package com.sp.grooveware.research;

import java.util.List;
import java.util.Map;

public interface ResearchService {
	public void insertResearchForm(Research dto) throws Exception;
	public Research readresearchBox(long research_id) throws Exception;
	public void insertResearchQna(Research dto) throws Exception;
	public void updateStatusResearch(long research_id) throws Exception;
	public void updateResearch(Research dto) throws Exception;
	public void deleteResearch(long research_id) throws Exception;
	
	public List<Research> listResearch(Map<String, Object> map);
	public int dataCountResearchList(Map<String,Object> map);
	public List<Research> readResearch(Map<String,Object> map);
	public Research readresearchQuset(long research_id);

	public void responseResearch(Research dto) throws Exception;
	
	public List<Research> researchListStatus(Map<String, Object> map);
	public int dataCountOpenList(Map<String,Object> map);
}
