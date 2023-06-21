package com.sp.grooveware.archive;

import java.util.List; 
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("arch.archiveService")
public class ArchiveServiceImpl implements ArchiveService {
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		
		int result = 0;
		
		try {
			//result = dao.selectOne("")
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public List<Archive> listArchive(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFile(Archive dto, String pathname) throws Exception {
		try {
			String save_filename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if (save_filename != null) {
				dto.setSave_filename(save_filename);
				dto.setOriginal_filename(dto.getSelectFile().getOriginalFilename());
				dto.setFile_size(fileManager.getFilesize(pathname));
			}
	
			dao.insertData("archive.insertFile", dto);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
	}

}
