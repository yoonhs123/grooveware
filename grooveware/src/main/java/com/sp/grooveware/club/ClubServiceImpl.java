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

	@Override
	public void insertClubNotice(ClubNotice dto, String pathname) throws Exception {
		// 공지사항 글쓰기(운영자일 때만)
		
	}

	@Override
	public List<ClubNotice> listClubNotice(Map<String, Object> map) {
		// 클럽 공지사항 리스트(입장했을 때 첫화면)
		return null;
	}

	@Override
	public void dataCountClubNotice(Map<String, Object> map) {
		// 공지사항 게시글 개수
		
	}

	@Override
	public void updateClubNotice(ClubNotice dto, String pathname) throws Exception {
		// 공지사항 수정
		
	}

	@Override
	public void deleteClubNotice(ClubNotice dto, String pathname, String userId) throws Exception {
		// 공지사항 삭제
		
	}

	@Override
	public Club readClubNotice(long club_noti_no) {
		// 공지사항 게시글 보기
		return null;
	}

}
