package com.sp.grooveware.notice;

import java.util.List;
import java.util.Map;


// 그룹웨어

public interface NoticeService {
	  
	// write 용 
	public void insertNotice(Notice dto, String pathname) throws Exception;
	
	// 페이징 처리용
	public int dataCount(Map<String, Object> map);
	
	// 리스트용
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	// 조회수 
	public void updateHitCount(long num) throws Exception;
	
	// article
	public Notice readNotice(long num);
	
	// 이전글, 다음글
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	
	
	public List<Notice> listFile(long num);
	public Notice readFile(long fileNum); 

}
