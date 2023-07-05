package com.sp.grooveware.research;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("research.ResearchService")
public class ResearchServiceImpl implements ResearchService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertResearch(Research dto) throws Exception {
		// 설문 등록
		try {
			dao.insertData("research.researchBox", dto);
			dao.insertData("research.resQuestion", dto);
			dao.insertData("research.resAnsOp", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateResearch(Research dto) throws Exception {
		// 설문 수정
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
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
	public Research readResearch(long research_id) {
		// 설문 보기 : 응답하는 화면
		Research dto = null;
		try {
			dto = dao.selectOne("research.readResearch",research_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	
	}

}
