package com.sp.grooveware.archive;

import java.util.List;
import java.util.Map;

public interface ArchiveService {
	public int dataCount(Map<String, Object> map);
	public List<Archive> listArchive(Map<String, Object> map);
	
	public void insertFile(Archive dto, String pathname) throws Exception;
}