package com.sp.grooveware.club;

import java.util.List;
import java.util.Map;

public interface ClubService {
	public void insertClub(Club dto, String pathname) throws Exception;
	public List<Club> listClub(Map<String, Object> map);
	public List<Club> listmyClub(Map<String, Object> map);
	public int dataCountClub(Map<String,Object> map);
	public int dataCountmyClub(Map<String,Object> map);
	public void updateClub(Club dto, String pathname) throws Exception;
	public void deleteClub(Club dto, String pathname, String userId, int member_authority) throws Exception;
	public Club readClub(long club_id);
	
	// 커뮤니티 가입
	public void joinClub(Club dto) throws Exception;
	
}
