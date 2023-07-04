package com.sp.grooveware.club;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("club.ClubService")
public class ClubServiceImpl implements ClubService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertClub(Club dto, String pathname) throws Exception {
		// 클럽 만들기
		try {
			dao.insertData("club.insertClub", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Club> listClub(Map<String, Object> map) {
		// 전체 클럽 리스트
		List<Club> list = null;
		try {
			list = dao.selectList("club.listClub", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Club> listmyClub(Map<String, Object> map) {
		// 내가 가입한 클럽 리스트
		List<Club> mylist = null;
		try {
			mylist = dao.selectList("club.listmyClub", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mylist;
	}

	@Override
	public int dataCountClub(Map<String, Object> map) {
		// 전체 클럽 개수
		int result = 0;
		
		try {
			result = dao.selectOne("club.dataCountClub", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int dataCountmyClub(Map<String, Object> map) {
		// 내가 가입한 클럽 개수
		int result = 0;
		
		try {
			result = dao.selectOne("club.dataCountmyClub", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateClub(Club dto, String pathname) throws Exception {
		// 클럽 정보 수정
		try {
			dao.updateData("club.updateClub", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteClub(Club dto, String pathname, String userId, int member_authority) throws Exception {
		// 클럽 정보 삭제(
		try {
			dao.deleteData("club.deleteClub", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Club readClub(long club_id) {
		// 클럽 정보 가져오기
		Club dto = null;
		try {
			dto = dao.selectOne("club.readClub", club_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void joinClub(Club dto) throws Exception {
		// 클럽 맴버 가입하기
		try {
			dao.insertData("club.joinClub", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}



}
