package com.sp.grooveware.club.board;

import java.util.List;
import java.util.Map;

import com.sp.grooveware.club.Club;

public interface ClubBoardService {
	public void insertClubBoard(ClubBoard dto) throws Exception;
	public List<ClubBoard> listClubBoard(Map<String,Object> map);
	public int dataCountClubBoard(Map<String,Object> map);
	public ClubBoard readClubBoard(long club_board_no);
	public void updateHitCount(long club_board_no) throws Exception;
	public ClubBoard preReadBoard(Map<String, Object> map);
	public ClubBoard nextReadBoard(Map<String, Object> map);
	public void updateBoard(ClubBoard dto, String pathname) throws Exception;
	public void deleteBoard(long club_board_no, String pathname, String emp_no) throws Exception;

	public Club readClub(long club_id);
	
	public void insertBoardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(long club_board_no);
	public boolean userBoardLiked(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String,Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	public void updateReplyShowHide(Map<String, Object> map) throws Exception;

}
