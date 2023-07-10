package com.sp.grooveware.research;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("research.ResearchService")
public class ResearchServiceImpl implements ResearchService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertResearchForm(Research dto) throws Exception {
		// 설문 등록
		try {
			dao.insertData("research.researchBox", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void insertResearchQna(Research dto) throws Exception {
		// 설문 질문/문제 등록
		try {
			dao.insertData("research.resQuestion", dto);
		
			for(int i=0; i<dto.getAns_option_contents().size(); i++) {
				
				dto.setAns_option_content(dto.getAns_option_contents().get(i));
				dto.setAns_option_num(dto.getAns_option_nums().get(i));
				dao.insertData("research.resAnsOp", dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateStatusResearch(long research_id) throws Exception {
		// 설문 상태 수정
		try {
			dao.updateData("research.upResearchStatus", research_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void updateResearch(Research dto) throws Exception {
		// 설문 수정

	}

	@Override
	public void deleteResearch(long research_id) throws Exception {
		// 설문 삭제
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public List<Research> listResearch(Map<String, Object> map) {
		// 설문 리스트
		List<Research> list = null;
		try {
			list = dao.selectList("research.listAll",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Research> readResearch(Map<String, Object> map) {
		// 설문 보기 : 응답하는 화면
		List<Research> list = null;
		try {
			list = dao.selectList("research.readResearch", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountResearchList(Map<String, Object> map) {
		// 전체 설문 리스트
		int result = 0;
		
		try {
			result = dao.selectOne("research.dataCountResearchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Research readresearchBox(long research_id) throws Exception {
		// 설문타이틀 보기
		Research dto = null;
		try {
			dto = dao.selectOne("research.readresearchBox",research_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Research readresearchQuset(long research_id) {
		Research dto = null;
		try {
			dto = dao.selectOne("research.readresearchQuset",research_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void responseResearch(Research dto) throws Exception {
		// 설문 응답
		try {
			dao.insertData("research.responseResearch", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Research> researchListStatus(Map<String, Object> map) {
		// 진행중인 설문, 마감된 설문
		List<Research> list = null;
		try {
			list = dao.selectList("research.openListAll", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountOpenList(Map<String, Object> map) {
		// 진행중인 설문, 마감된 설문 개수
		int result = 0;
		
		try {
			result = dao.selectOne("research.dataCountOpenList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
