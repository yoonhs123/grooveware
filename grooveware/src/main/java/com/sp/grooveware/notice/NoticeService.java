package com.sp.grooveware.notice;

import java.util.List;
import java.util.Map;


// 그룹웨어

public interface NoticeService {
	
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	public void updateHitCount(long num) throws Exception;
	public Notice readNotice(long num);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	public List<Notice> listFile(long num);
	public Notice readFile(long fileNum); 

}
