package com.sp.grooveware.club;

import java.util.List;
import java.util.Map;

public interface ClubService {
	public void insertClub(Club dto, String pathname) throws Exception;
	public List<Club> listClub(Map<String, Object> map);
	public int dataCountClub(Map<String,Object> map);
	public void updateClub(Club dto, String pathname) throws Exception;
	public void deleteClub(Club dto, String pathname, String userId, int member_authority) throws Exception;
	public Club readClub(long club_id);
	
	// 커뮤니티 가입
	public void joinClub(Club dto) throws Exception;
	
	// 커뮤니티 입장해서 게시글(공지사항) 보기
	public void insertClubNotice(ClubNotice dto, String pathname) throws Exception;
	public List<ClubNotice> listClubNotice(Map<String,Object> map);
	public void dataCountClubNotice(Map<String,Object> map);
	public void updateClubNotice(ClubNotice dto, String pathname) throws Exception;
	public void deleteClubNotice(ClubNotice dto, String pathname, String userId) throws Exception;
	public Club readClubNotice(long club_noti_no);

}
