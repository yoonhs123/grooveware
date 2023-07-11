package com.sp.grooveware.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("approval.approvalService")
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	

	@Override
	public void insertApproval(Approval dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("approval.seq");
			dto.setDoc_no(seq);
			dto.setApproval_step(dto.getEmp_nos().size()); // 결재를 해야할 최종 단계가 몇단계인지 나타냄
			
			dao.insertData("approval.insertDoc", dto);
			dao.insertData("approval.insertDraft", dto);
			

			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					String originalFilename = mf.getOriginalFilename();
 
					dto.setOriginal_filename(originalFilename);
					dto.setSave_filename(saveFilename);
					
					
					dao.insertData("approval.insertDraftFile", dto);
				}
			}

			if (dto.getDoc_status() == 0 ) { // 임시 저장일 경우
			    int n = 0;
			    for (long emp_no : dto.getEmp_nos()) {
			        dto.setEmp_no(emp_no);
			        dto.setApproval_status_id(n++);

			        dto.setApproval_status(0); // 임시 상태

			        dao.insertData("approval.insertApproval", dto);
			    }
			} else { // 발송 완료일 경우 
			    int n = 0;
			    for (long emp_no : dto.getEmp_nos()) {
			        dto.setEmp_no(emp_no);
			        dto.setApproval_status_id(n++);

			        dto.setApproval_status(1); // 대기 상태

			        dao.insertData("approval.insertApproval", dto);
			    }
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}			
		
	}


	@Override
	public List<Approval> listMember(Map<String, Object> map) {
		List<Approval> list = null;
		
		try {
			list = dao.selectList("approval.listMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Approval> listDoc(Map<String, Object> map) {
		List<Approval> list = null;
		
		try {
			list = dao.selectList("approval.listDoc", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Approval> importantList(Map<String, Object> map) {
		List<Approval> importantList = null;
		
		try {
			importantList = dao.selectList("approval.importantList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return importantList;
	}
	
	@Override
	public List<Approval> deptList(Map<String, Object> map) {
		List<Approval> deptList = null;
		
		try {
			deptList = dao.selectList("approval.deptList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deptList;
	}
	
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("approval.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int deptDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("approval.deptDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Approval readDoc(long doc_no) {
		Approval dto = null;
		
		try {
			dto = dao.selectOne("approval.readDoc", doc_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return dto;
	}
	
	 

	@Override
	public void updateDoc(Approval dto, String pathname) throws Exception {
		try {
			System.out.println("--------------"+dto.getHistory_emp_nos());

			dao.updateData("approval.updateDoc", dto);
			dao.updateData("approval.updateDraft", dto);
			
			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					String originalFilename = mf.getOriginalFilename();

					dto.setOriginal_filename(originalFilename);
					dto.setSave_filename(saveFilename);

					// insertFile(dto);
					dao.insertData("approval.insertDraftFile", dto);
				}
			}
			
			// 임시저장일 경우 결재자 라인 수정
			int size = 0;
			if(dto.getHistory_emp_nos() != null) { // 이전 결재자가 존재할 경우
				size = dto.getHistory_emp_nos().size(); // size == 기존 결재자의 개수 
				System.out.println("------size-------:"+size);
				System.out.println("---getHistory_emp_nos-----------"+dto.getHistory_emp_nos());
				System.out.println("---getEmp_nos-----------"+dto.getEmp_nos());
			}
			
			int n;
			for(int i= size; i < dto.getEmp_nos().size(); i++) {  //  기존 결재자의 수(2) < 최종 등록된 결재자 수(3)
				// 결재라인 추가
				
				// 임시저장일 경우
				if (dto.getDoc_status() == 0 ) {
					dto.setApproval_status(0);
				} else if(dto.getDoc_status() == 1){ // 제출할 경우
					 dto.setApproval_status(1);
				}
				
				n = i;
				 dto.setEmp_no(dto.getEmp_nos().get(i)); // 
			     dto.setApproval_status_id(n);
			     dao.insertData("approval.insertApproval", dto); // 새로운 결재자의 approval 생성
			     
			     
			     // 기존 결재자의 approval_status 변경
			     for (long emp_no : dto.getHistory_emp_nos()) {
			    	 dto.setEmp_no(emp_no);
			    	 dto.setApproval_status(1); // 기존 결재자의 approval_status를 1로 변경
			         dao.updateData("approval.updateApproval", dto); // 기존 결재자의 approval_status 업데이트
			     }			     
			     
			     
			     System.out.println("이름:"+ dto.getEmp_name() );
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
    @Override
    public void updateImportant(Approval dto) throws Exception {
        try {
        	dao.updateData("approval.updateImportant", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
    }	
	
    // 결재 상태에 따른 approval 수정
	@Override
	public void updateApproval(Approval dto, String last) throws Exception {
		try {
			dao.updateData("approval.updateApproval", dto);
			
			if(dto.getApproval_status()==2 && last.equals("true")) { // 승인, 마지막 결재자일 경우
				// 최종 결재
				dao.updateData("approval.updateDocFinaldate", dto.getDoc_no());
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("doc_no", dto.getDoc_no());
				if(dto.getApproval_status() == 3) { // 결재 상세 단계가 반려일 경우
					map.put("doc_status", 4); // 문서 상태 반려
				} else {
					map.put("doc_status", 2); // 문서 상태 진행중
				}
				
				dao.updateData("approval.updateDocStatus", map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public void deleteApproval(long doc_no, String pathname) throws Exception {
		try {
			
			// 파일 지우기
			List<Approval>listFile = listFile(doc_no);
			if (listFile != null) {
				for (Approval dto : listFile) {
					fileManager.doFileDelete(dto.getSave_filename(), pathname);
				}
			}

			//  파일 테이블 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "doc_no");
			map.put("doc_no", doc_no);
			deleteFile(map);

			dao.deleteData("approval.deleteDraft", doc_no);
			dao.deleteData("approval.deleteApproval", doc_no);
			dao.deleteData("approval.deleteDoc", doc_no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Approval> listFile(long doc_no) {
		List<Approval> listFile = null;
		
		try {
			listFile = dao.selectList("approval.listFile", doc_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}



	@Override
	public void insertFile(Approval dto) throws Exception {
		try {
			dao.insertData("approval.insertDraftFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public Approval readFile(long file_no) {
		Approval dto = null;
		
		try {
			dto = dao.selectOne("approval.readFile", file_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("approval.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public List<Approval> listApproval(long doc_no) {
		List<Approval> listApproval = null;
		try {
			listApproval = dao.selectList("approval.listApproval", doc_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listApproval;
	}


	@Override
	public List<Approval> ApprovalStepList(Map<String, Object> map) {
		List<Approval> ApprovalStepList = null;

		try {
			// 대기문서
			ApprovalStepList = dao.selectList("approval.ApprovalStepList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ApprovalStepList;
	}
	
	@Override
	public List<Approval> sendBackList(Map<String, Object> map) {
		List<Approval> sendBackList = null;

		try {
			// 대기문서
			sendBackList = dao.selectList("approval.sendBackList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sendBackList;
	}	
	@Override
	public List<Approval> completionList(Map<String, Object> map) {
		List<Approval> completionList = null;
		
		try {
			// 대기문서
			completionList = dao.selectList("approval.completionList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return completionList;
	}	

/*
	@Override
	public List<Approval> progressList(Map<String, Object> map) {
		List<Approval> progressList = null;

		try {
			progressList = dao.selectList("approval.standByList", map);
	*/		
			/*
			int size = progressList.size();
			
			for(int i = 0; i<size; i++) {
				Approval dto = progressList.get(i);
				
				map.put("doc_no", dto.getDoc_no());
				map.put("approval_status_id", dto.getApproval_status_id());
				map.put("approval_status", dto.getApproval_status());
				
				Approval vo = dao.selectOne("approval.readNotPreApproval", map);
				if(vo != null) {
					progressList.remove(dto);
					size--;
					i--;
				}
			}
			*/
	/*		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return progressList;
	}
*/

	@Override
	public Approval readApproval(Map<String, Object> map) {
		Approval dto = null;
		
		try {
			dto = dao.selectOne("approval.readApproval", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return dto;
	}


	@Override
	public List<Approval> readAp(long doc_no) {
		List<Approval> rejectList = null;

		try {
			rejectList = dao.selectList("approval.readAp", doc_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rejectList;
	}


	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("approval.deleteMember", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
