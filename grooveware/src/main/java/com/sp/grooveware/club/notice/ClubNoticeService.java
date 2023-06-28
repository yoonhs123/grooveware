package com.sp.grooveware.club.notice;

import java.util.List;
import java.util.Map;

public interface ClubNoticeService {
	// 커뮤니티 입장해서 게시글(공지사항) 보기
	public void insertClubNotice(ClubNotice dto, String pathname) throws Exception;
	public List<ClubNotice> listClubNotice(Map<String,Object> map);
	public int dataCountClubNotice(Map<String,Object> map);
	public void updateClubNotice(ClubNotice dto, String pathname) throws Exception;
	public void deleteClubNotice(ClubNotice dto, String pathname, String userId) throws Exception;
	public ClubNotice readClubNotice(long club_noti_no);

	public void updateHitCount(long club_noti_no) throws Exception;
	public ClubNotice preReadBoard(Map<String, Object> map);
	public ClubNotice nextReadBoard(Map<String, Object> map);
}
