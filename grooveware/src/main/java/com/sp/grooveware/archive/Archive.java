package com.sp.grooveware.archive;

import org.springframework.web.multipart.MultipartFile;

public class Archive {
	private long folder_no;
	private String folder_name;
	private int reference_room_id;
	
	private String file_no;
	private String original_filename;
	private String save_filename;
	private MultipartFile selectFile;
	private long file_size;
	
	
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	private long fileSize;
	
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
	public int getReference_room_id() {
		return reference_room_id;
	}
	public void setReference_room_id(int reference_room_id) {
		this.reference_room_id = reference_room_id;
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	
	
}
