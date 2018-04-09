package com.hzyc.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.design.mapper.UserMapper;
import com.hzyc.design.po.AdminAdd_YP_Po;
import com.hzyc.design.po.AdminSY_Po;
import com.hzyc.design.po.UserZC_Po;


@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public boolean ZC(UserZC_Po u){
		boolean result = false;
		userMapper.ZC(u);
		result=true;
		return result;
	}
	
	public UserZC_Po DL(String username){
		return userMapper.DL(username);
	}
	
	public AdminAdd_YP_Po XS(String name){
		return userMapper.XS(name);
	}
	
	
	public AdminAdd_YP_Po XSxuanzuo(String photo){
		return userMapper.XSxuanzuo(photo);
	}
	
	public List<AdminSY_Po> sFbN(String ypname){
		return userMapper.sFbN(ypname);
	}
	

}
