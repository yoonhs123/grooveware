package com.sp.grooveware.project;

import java.util.List;
import java.util.Map;

public interface ProjectService {
	public void insertProject(Project dto, String pathname) throws Exception;
	public List<Project> listProject(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Project readProject(long pj_no);
	public void updateProject(Project dto, String pathname) throws Exception;
	public void deleteProject(long pj_no, String pathname, long pj_creator) throws Exception;
	
	public List<Project> listEmp(Map<String, Object> map);
	
	public List<Project> readProjectmember(long pj_no);
	
	public void insertPjmember(Project dto) throws Exception;
	
	public void deletePjmember(Map<String, Object> map) throws Exception;
}
