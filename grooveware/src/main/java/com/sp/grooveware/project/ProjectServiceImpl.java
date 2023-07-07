package com.sp.grooveware.project;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("project.projectService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertProject(Project dto, String pathname) throws Exception {
		try {

			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.insertData("project.insertProject", dto);
		
			// 글쓴사람은 자동적으로 인서트됨
			dao.insertData("project.defaultInsert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
	@Override
	public List<Project> listEmp(Map<String, Object> map) {	// 프로젝트 멤버 추가
		List<Project> list = null;
		
		try {
			list = dao.selectList("project.listEmp",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Project> listProject(Map<String, Object> map) {
		List<Project> list = null;
		
		try {
			list = dao.selectList("project.listProject", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("project.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Project readProject(long pj_no) {	// 프로젝트 가져오기
		Project dto = null;
		
		// 게시물 가져오기
		try {
			dto = dao.selectOne("project.readProject", pj_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public List<Project> readProjectmember(long pj_no) {
		List<Project> list = null;
		
		try {
			list = dao.selectList("project.readProjectmember", pj_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int readPM(Map<String, Object> map) {
		
		int pj_join_type = 0;
		
		try {
			pj_join_type = dao.selectOne("project.readPM", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pj_join_type;
	}


	
	@Override
	public void updateProject(Project dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if (saveFilename != null) {
				if (dto.getSaveFilename() != null && dto.getSaveFilename().length() !=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.updateData("project.updateProject1", dto);
			dao.updateData("project.updateProject2", dto);
			dao.updateData("project.updateProject3", dto);
			
			
			// 멤버 수정이 없을경우. 추가안했을때
			if(dto.getEmps() != null) {
				
				insertPjmember(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	


	@Override
	public void insertPjmember(Project dto) throws Exception {
		try {
			dao.insertData("project.insertPjmember", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}



	
	@Override
	public void deleteProject(long pj_no, String pathname, long emp_no) throws Exception {
		try {
			Project dto = readProject(pj_no);
			if (dto == null || !(dto.getPj_creator() == emp_no)) {
				return;
			}
			
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			dao.deleteData("project.deleteProject2", pj_no);
			dao.deleteData("project.deleteProject3", pj_no);
			dao.deleteData("project.deleteProject4", pj_no);
			dao.deleteData("project.deleteProject1", pj_no);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void deletePjmember(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("project.deletePjmember", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public void endProject(long pj_no) throws Exception {
		try {
			dao.updateData("project.endProject", pj_no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public void changeAccess(Project dto) throws Exception {
		
		try {
			
			for(int i=0 ; i<dto.getEmp_nos().size() ; i++) {
				dto.setEmp_no(dto.getEmp_nos().get(i));
				dto.setPj_join_type(dto.getPj_join_types().get(i));
				dao.updateData("project.changeAccess", dto);
			}
			
			

	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}



	






}
