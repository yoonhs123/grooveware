package com.sp.grooveware.archive;

import org.springframework.web.multipart.MultipartFile;

public class Archive {
	private long folder_no;
	private String folder_name;
	private String root_folder;
	
	private long emp_no;
	private String file_name;
	private String file_no;
	private String original_filename;
	private String save_filename;
	private MultipartFile selectFile;
	private long file_size;
	private String reg_date;
	
	

	public long getEmp_no() {
		return emp_no;
	}




	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}




	@Override
	public String toString() {
		return "Archive [folder_no=" + folder_no + ", folder_name=" + folder_name + ", root_folder=" + root_folder
				+ ", file_name=" + file_name + ", file_no=" + file_no + ", original_filename=" + original_filename
				+ ", save_filename=" + save_filename + ", selectFile=" + selectFile + ", file_size=" + file_size
				+ ", reg_date=" + reg_date + "]";
	}




	public long getFolder_no() {
		return folder_no;
	}




	public void setFolder_no(long folder_no) {
		this.folder_no = folder_no;
	}




	public String getFolder_name() {
		return folder_name;
	}




	public void setFolder_name(String folder_name) {
		this.folder_name = folder_name;
	}




	public String getRoot_folder() {
		return root_folder;
	}




	public void setRoot_folder(String root_folder) {
		this.root_folder = root_folder;
	}




	public String getFile_name() {
		return file_name;
	}




	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}




	public String getFile_no() {
		return file_no;
	}




	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}




	public String getOriginal_filename() {
		return original_filename;
	}




	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}




	public String getSave_filename() {
		return save_filename;
	}




	public void setSave_filename(String save_filename) {
		this.save_filename = save_filename;
	}




	public MultipartFile getSelectFile() {
		return selectFile;
	}




	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}




	public long getFile_size() {
		return file_size;
	}




	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}




	public String getReg_date() {
		return reg_date;
	}




	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
}
