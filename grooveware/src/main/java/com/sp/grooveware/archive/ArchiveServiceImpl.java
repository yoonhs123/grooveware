package com.sp.grooveware.archive;

import java.util.HashMap;
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
			result = dao.selectOne("archive.dataCountAll", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Archive> listArchive(Map<String, Object> map) {
		List<Archive> list = null;

		try {
			list = dao.selectList("archive.listFileAll", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
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
	



	@Override
	public void deleteFile(List<String> list) throws Exception {
		try {
			dao.deleteData("archive.deleteFiles", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Archive readFile(String file_no) {
		Archive dto = null;
		
		try {
			dto = dao.selectOne("archive.readFile", file_no);
		} catch (Exception e) {
			
		}
		
		return dto;
	}


	/*
	@Override
	public Archive getTopLevelFolders() {
		Archive dto = null;

		try {
			dto = dao.selectOne("archive.getTopLevelFolders");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	*/

	@Override
	public List<Archive> getSubFolders(long folder_no) {
		List<Archive> list = null;

		try {
			list = dao.selectList("archive.getSubFolders", folder_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Archive> getSubFiles(long folder_no) {
		List<Archive> list = null;

		try {
			list = dao.selectList("archive.getSubFiles", folder_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Archive> listFolder() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Archive> getSubFoldersFiles(long folder_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFolder(Archive dto) throws Exception {
		
		try {
	
			dao.insertData("archive.insertFolder", dto);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
	}

	@Override
	public void deleteFolder(List<String> list) throws Exception {
		try {
			dao.deleteData("archive.deleteFolder", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<String> getSubFolderNum(long folder_no){
		List<String> list = null;
		
		try {
			list = dao.selectList("archive.getAllSubfile", folder_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list ;
	}

	@Override
	public List<String> getAllFileName(List<String> file_no) {
		List<String> list = null;
		
		try {
			list = dao.selectList("archive.getAllFileName", file_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list ;
	}

	@Override
	public long getTopLevelFolderNum(long folder_no) {
		long num = 0;
		
		try {
			num = dao.selectOne("archive.getTopLevelFolderNum", folder_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public List<Archive> getPrivateSubFolders(long folder_no, long emp_no) {
		List<Archive> list = null;
		Map<String, Long> params = new HashMap<>();
	    params.put("folder_no", folder_no);
	    params.put("emp_no", emp_no);
		
		try {
			list = dao.selectList("archive.getPrivateSubFolders", params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Archive> getPrivateSubFiles(long folder_no, long emp_no) {
		List<Archive> list = null;
		Map<String, Long> params = new HashMap<>();
	    params.put("folder_no", folder_no);
	    params.put("emp_no", emp_no);
		
		try {
			list = dao.selectList("archive.getPrivateSubFiles", params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
