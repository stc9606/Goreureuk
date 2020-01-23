package com.ram.goreureuk.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ram.goreureuk.freeboard.BlackList;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO ad;

	@Override
	public List<BlackList> reportView() throws Exception {
		return ad.reportView();
	}

	@Override
	public void adminReportReuslt(String name) throws Exception {
		ad.adminReportReuslt(name);
	}

}
