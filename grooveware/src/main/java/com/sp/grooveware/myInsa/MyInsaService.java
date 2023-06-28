package com.sp.grooveware.myInsa;

public interface MyInsaService {
	// insaCard
	public int getAnnualLeave(long emp_no);
	public MyInsa readInsaCard(long emp_no);
	
	// profile
	public MyInsa readProfile(long emp_no);
}
