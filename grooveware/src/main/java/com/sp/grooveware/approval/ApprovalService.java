package com.sp.grooveware.approval;

import java.util.List;
import java.util.Map;

public interface ApprovalService {


	public void insertApproval(Approval dto, String pathname) throws Exception;
	public List<Approval> listDoc(Map<String, Object>map);
	public List<Approval> importantList(Map<String, Object>map);
	public List<Approval> deptList(Map<String, Object>map);
	public List<Approval> listApproval(long doc_no);
	public List<Approval> ApprovalStepList(Map<String, Object>map);
	public List<Approval> sendBackList(Map<String, Object>map);
	public List<Approval> completionList(Map<String, Object>map);
	
	public int dataCount(Map<String, Object>map);
	public int deptDataCount(Map<String, Object>map);
	
	public Approval readDoc(long doc_no);
	public List<Approval> readAp(long doc_no);
	public Approval readApproval(Map<String, Object>map);
	
	public void updateDoc(Approval dto, String pathname) throws Exception;
	public void updateApproval(Approval dto, String last) throws Exception;
	public void updateImportant(Approval dto) throws Exception;
	public void deleteApproval(long doc_no, String pathname) throws Exception;
	
	public void insertFile(Approval dto)throws Exception;
	public List<Approval> listFile(long doc_no);
	public Approval readFile(long file_no);
	public void deleteFile(Map<String, Object>map)throws Exception;
	
	public List<Approval> listMember(Map<String, Object>map);
	public void deleteMember(Map<String, Object>map)throws Exception;
}
