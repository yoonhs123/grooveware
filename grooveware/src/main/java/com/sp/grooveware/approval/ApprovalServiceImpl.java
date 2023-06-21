package com.sp.grooveware.approval;

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
			
			dao.insertData("approval.insertApproval", dto);
			
			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					String originalFilename = mf.getOriginalFilename();

					dto.setOriginal_filename(originalFilename);
					dto.setSave_filename(saveFilename);

					dao.insertData("approval.insertFile", dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}			
		
	}

}
