package com.ram.goreureuk.admin;

import java.util.List;

import com.ram.goreureuk.freeboard.BlackList;

public interface AdminService {
	public List<BlackList> reportView() throws Exception;
	
	public void adminReportReuslt(String name) throws Exception; 
}
