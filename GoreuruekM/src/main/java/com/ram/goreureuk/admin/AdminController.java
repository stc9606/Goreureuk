package com.ram.goreureuk.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ram.goreureuk.freeboard.BlackList;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService as;
	
	//관리자 페이지 첫화면
	@RequestMapping("adminView")
	public String adminView(Model model) throws Exception{
		List<BlackList> bl = as.reportView();		
		model.addAttribute("report",bl);		
		return ("admin/admin");
	}
	
	//관리자 페이지 첫화면
	@RequestMapping("adminReportReuslt")
	public String adminReportReuslt(@RequestParam String MM_ID) throws Exception{		
		as.adminReportReuslt(MM_ID);						
		return ("admin/admin");
	}
	
}
