package com.sp.grooveware.archive;

import java.util.List; 
import java.util.Map;


public interface ArchiveService {
	public int dataCount(Map<String, Object> map);
	public List<Archive> listArchive(Map<String, Object> map);
	
	public void insertFile(Archive dto, String pathname) throws Exception;
	public void insertFolder(Archive dto) throws Exception;
	
	public Archive readFile(String file_no);
	
	public long getTopLevelFolderNum(long folder_no);
	
	public List<Archive> getSubFolders(long folder_no);
	
	public List<Archive> getPrivateSubFolders(long folder_no, long emp_no);
	public List<Archive> getPrivateSubFiles(long folder_no, long emp_no);

	public List<Archive> getSubFiles(long folder_no);
	public List<String> getSubFolderNum(long folder_no);
	public List<String> getAllFileName(List<String> file_no);
	
	
	public void deleteFile(List<String> file_no) throws Exception;
	public void deleteFolder(List<String> folder_no) throws Exception; 
	
	
}
