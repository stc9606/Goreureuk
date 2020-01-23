package com.ram.goreureuk.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ram.goreureuk.freeboard.BlackList;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sql;
	private static final String namespace = "com.ram.goreureuk.mappers.adminMapper";

	@Override
	public List<BlackList> reportView() throws Exception {
		return sql.selectList(namespace+".reportView");
	}

	@Override
	public void adminReportReuslt(String name) throws Exception {
		sql.update(namespace+".adminReportReuslt",name);
	}
	
}
