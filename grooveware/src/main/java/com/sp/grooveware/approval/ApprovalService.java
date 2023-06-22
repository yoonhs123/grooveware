package com.sp.grooveware.approval;

import java.util.List;
import java.util.Map;

public interface ApprovalService {
	
	public List<Approval> listMember(Map<String, Object>map);
	
	public void insertApproval(Approval dto, String pathname) throws Exception;
	public List<Approval> listApproval(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	
	public Approval readApproval(long doc_no);
	public List<Approval> listFile(long doc_no);
	
	public void updateApproval(Approval dto, String pathname) throws Exception;
	
}
