package com.sp.grooveware.club.board;

public class ClubBoard {
	private long club_id;
	private String club_name;
	private long emp_no;
	private String emp_name;
	
	private long club_board_no;
	private long board_category;
	private String clubboard_title;
	private String clubboard_content;
	private String clubboard_regdate;
	private long clubboard_hitcount;
	
	private int replyCount;
	private int boardLikeCount;
	
	public long getClub_id() {
		return club_id;
	}
	public void setClub_id(long club_id) {
		this.club_id = club_id;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public long getClub_board_no() {
		return club_board_no;
	}
	public void setClub_board_no(long club_board_no) {
		this.club_board_no = club_board_no;
	}
	public long getBoard_category() {
		return board_category;
	}
	public void setBoard_category(long board_category) {
		this.board_category = board_category;
	}
	public String getClubboard_title() {
		return clubboard_title;
	}
	public void setClubboard_title(String clubboard_title) {
		this.clubboard_title = clubboard_title;
	}
	public String getClubboard_content() {
		return clubboard_content;
	}
	public void setClubboard_content(String clubboard_content) {
		this.clubboard_content = clubboard_content;
	}
	public String getClubboard_regdate() {
		return clubboard_regdate;
	}
	public void setClubboard_regdate(String clubboard_regdate) {
		this.clubboard_regdate = clubboard_regdate;
	}
	public long getClubboard_hitcount() {
		return clubboard_hitcount;
	}
	public void setClubboard_hitcount(long clubboard_hitcount) {
		this.clubboard_hitcount = clubboard_hitcount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getBoardLikeCount() {
		return boardLikeCount;
	}
	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}
	
}
