package com.sp.grooveware.club.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("club.notice.ClubNoticeService")
public class ClubNoticeServiceImpl implements ClubNoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertClubNotice(ClubNotice dto, String pathname) throws Exception {
		// 공지사항 글쓰기(운영자일 때만)
		try {
			dao.insertData("clubNotice.insertClubNotice", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<ClubNotice> listClubNotice(Map<String, Object> map) {
		// 클럽 공지사항 전체리스트(입장했을 때 첫화면)
		List<ClubNotice> list = null;
		try {
			list = dao.selectList("clubNotice.listClubNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountClubNotice(Map<String, Object> map) {
		// 공지사항 게시글 개수
		int result = 0;
		try {
			result = dao.selectOne("clubNotice.dataCountClubList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateClubNotice(ClubNotice dto, String pathname) throws Exception {
		// 공지사항 게시글 수정
		try {
			dao.updateData("clubNotice.updateClubNotice",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteClubNotice(ClubNotice dto, String pathname, String userId) throws Exception {
		// 공지사항 게시글 삭제
		try {
			dao.deleteData("clubNotice.deleteClubNotice", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public ClubNotice readClubNotice(long club_noti_no) {
		// 공지사항 게시글 보기
		ClubNotice dto = null;
		try {
			dto = dao.selectOne("clubNotice.readClubNotice", club_noti_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(long club_noti_no) throws Exception {
		// 조회수 증가
		try {
			dao.updateData("clubNotice.updateHitCount", club_noti_no);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public ClubNotice preReadBoard(Map<String, Object> map) {
		// 이전글
		ClubNotice dto = null;

		try {
			dto = dao.selectOne("clubNotice.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public ClubNotice nextReadBoard(Map<String, Object> map) {
		// 다음글
		ClubNotice dto = null;

		try {
			dto = dao.selectOne("clubNotice.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
