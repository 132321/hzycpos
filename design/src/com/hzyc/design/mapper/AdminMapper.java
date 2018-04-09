package com.hzyc.design.mapper;

import java.util.List;

import com.hzyc.design.po.AdminAdd_FYT_Po;
import com.hzyc.design.po.AdminAdd_YP_Po;
import com.hzyc.design.po.AdminC_Po;
import com.hzyc.design.po.AdminSY_Po;
import com.hzyc.design.po.Page;
import com.hzyc.design.po.UserZC_Po;


public interface AdminMapper {
	
	void insertUser(AdminAdd_FYT_Po a);
	
	List<AdminAdd_FYT_Po> queryProvince();
	
	AdminAdd_FYT_Po selectUpdate(String id);
	
	int updateFYT(AdminAdd_FYT_Po a);
	
	int deleteFYT(AdminAdd_FYT_Po a);
	
	void insertYP(AdminAdd_YP_Po a);
	
	List<AdminAdd_YP_Po> selectYP();
	
	AdminAdd_YP_Po selectUpdateYP(String id);
	
	int updateYP(AdminAdd_YP_Po a);
	
	int deleteYP(AdminAdd_YP_Po a);
	
	void shangying(AdminSY_Po a);
	
	List<AdminSY_Po> selectshangying();
	
	int deleteSY(String id);
	
	List<AdminC_Po> queryProvince1(Page p);
	
	UserZC_Po cUser(String id);
	
}
