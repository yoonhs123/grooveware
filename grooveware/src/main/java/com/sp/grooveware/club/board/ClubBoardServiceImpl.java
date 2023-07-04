package com.sp.grooveware.club.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.club.Club;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("club.board.ClubBoardService")
public class ClubBoardServiceImpl implements ClubBoardService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertClubBoard(ClubBoard dto) throws Exception {
		// 게시판 작성
		try {
			dao.insertData("clubBoard.insertClubBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<ClubBoard> listClubBoard(Map<String, Object> map) {
		// 게시판 리스트 조회
		List<ClubBoard> list = null;
		
		try {
			list = dao.selectList("clubBoard.listClubBoard",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountClubBoard(Map<String, Object> map) {
		// 게시글 개수
		int result = 0;
		try {
			result = dao.selectOne("clubBoard.dataCountClubBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public ClubBoard readClubBoard(long club_board_no) {
		// 게시글 보기
		ClubBoard dto = null;
		try {
			dto = dao.selectOne("clubBoard.readClubBoard", club_board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(long club_board_no) throws Exception {
		// 게시글 조회수 증가
		try {
			dao.updateData("clubBoard.updateHitCount", club_board_no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public ClubBoard preReadBoard(Map<String, Object> map) {
		// 이전글
		ClubBoard dto = null;
		try {
			dto = dao.selectOne("clubBoard.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public ClubBoard nextReadBoard(Map<String, Object> map) {
		// 다음글
		ClubBoard dto = null;
		try {
			dto = dao.selectOne("clubBoard.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateBoard(ClubBoard dto, String pathname) throws Exception {
		// 게시글 수정
		try {
			dao.updateData("clubBoard.updateClubBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBoard(long club_board_no, String pathname, String emp_no) throws Exception {
		// 게시글 삭제
		try {
			dao.deleteData("clubBoard.deleteClubBoard", club_board_no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		// 게시글 좋아요
		try {
			dao.insertData("clubBoard.insertBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("clubBoard.deleteBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int boardLikeCount(long club_board_no) {
		// 게시글 좋아요 개수
		int result = 0;
		
		try {
			result = dao.selectOne("clubBoard.boardLikeCount", club_board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		// 유저가 좋아요 했는지 안했는지?
		return false;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		// 게시글 댓글 작성
		try {
			dao.insertData("clubBoard.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// 댓글 리스트 조회
		List<Reply> list = null;
		try {
			list = dao.selectList("clubBoard.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// 댓글 개수
		int result = 0;
		
		try {
			result = dao.selectOne("clubBoard.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// 댓글 삭제
		try {
			dao.deleteData("clubBoard.deleteReply",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		// 댓글 좋아요
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// 댓글 좋아요 개수
		return null;
	}

	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		// 댓글 숨기기?
		
	}

	@Override
	public Club readClub(long club_id) {
		// 클럽 이름 가져오기
		Club dto = null;

		try {
			dto = dao.selectOne("club.readClub", club_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
