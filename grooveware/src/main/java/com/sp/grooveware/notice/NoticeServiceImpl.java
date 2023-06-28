package com.sp.grooveware.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("Notice.NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public void insertNotice(Notice dto, String pathname) throws Exception {
		
		  try {
			  
		         String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
		         if(saveFilename != null) {
		            dto.setSave_filename(saveFilename);
		            dto.setOriginal_filename(saveFilename);
		         }

		         dao.insertData("notice.insertNotice", dto);  // .앞에는 맵퍼의 namespace, .뒤에는 id
		      } catch (Exception e) {
		         e.printStackTrace();
		         throw e;
		      }
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;

		try {
			list = dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;

		try {
			list = dao.selectList("notice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Notice readNotice(long noti_id) {
		Notice dto = null;

		try {
			dto = dao.selectOne("notice.readNotice", noti_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateHitCount(long noti_id) throws Exception {
		try {
			dao.updateData("notice.updateHitCount", noti_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;

		try {
			dto = dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;

		try {
			dto = dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	
	
	@Override
	public void updateNotice(Notice dto, String pathname) throws Exception {
		
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				if (dto.getSave_filename() != null && dto.getSave_filename().length() != 0) {
					fileManager.doFileDelete(dto.getSave_filename(), pathname);
				}

				dto.setSave_filename(saveFilename);
				dto.setOriginal_filename(dto.getSelectFile().getOriginalFilename());
			}

			dao.updateData("notice.updateNotice", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	@Override
	public void deleteNotice(long noti_id, String pathname, long emp_no) throws Exception {
	    try {
	        Notice dto = readNotice(noti_id);
	        if (dto == null ) {
	            return;
	        }

	        if(dto.getSave_filename() != null) {
	        	fileManager.doFileDelete(dto.getSave_filename(), pathname);
	        }

	        dao.deleteData("notice.deleteNotice", noti_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

}
