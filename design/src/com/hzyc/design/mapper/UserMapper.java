package com.hzyc.design.mapper;

import java.util.List;

import com.hzyc.design.po.AdminAdd_YP_Po;
import com.hzyc.design.po.AdminSY_Po;
import com.hzyc.design.po.UserZC_Po;

public interface UserMapper {
	
	void ZC(UserZC_Po u);
	
	UserZC_Po DL(String username);
	
	AdminAdd_YP_Po XS(String name);
	
	AdminAdd_YP_Po XSxuanzuo(String photo);
	
	List<AdminSY_Po> sFbN(String ypname);

}
