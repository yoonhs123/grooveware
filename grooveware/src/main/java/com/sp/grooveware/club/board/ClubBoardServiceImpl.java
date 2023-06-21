package com.sp.grooveware.club;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sp.grooveware.common.dao.CommonDAO;

public class ClubBoardServiceImpl implements ClubBoardService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertBoard(ClubBoard dto, String pathname) throws Exception {
		// 게시글 등록
		try {
			dao.insertData("clubboard.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<ClubBoard> listBoard(Map<String, Object> map) {
		// 게시글 리스트
		List<ClubBoard> list = null;
		
		try {
			list = dao.selectList("clubboard.listBoard", map);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("bbs.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public ClubBoard readBoard(long num) {
		ClubBoard dto = null;
		
		// 게시글 가져오기
		try {
			dto = dao.selectOne("bbs.readBoard",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ClubBoard preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClubBoard nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(ClubBoard dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(long num, String pathname, String userId, int member_authority) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int boardLikeCount(long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReplyAnswer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyAnswerCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
