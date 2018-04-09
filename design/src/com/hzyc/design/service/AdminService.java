package com.hzyc.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.design.mapper.AdminMapper;
import com.hzyc.design.po.AdminAdd_FYT_Po;
import com.hzyc.design.po.AdminAdd_YP_Po;
import com.hzyc.design.po.AdminC_Po;
import com.hzyc.design.po.AdminSY_Po;
import com.hzyc.design.po.Page;
import com.hzyc.design.po.UserZC_Po;


@Service
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	public boolean insertUser(AdminAdd_FYT_Po a){
		boolean result = false;
		try {
			
			adminMapper.insertUser(a);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public boolean delete(AdminAdd_FYT_Po a){
		boolean result = false;
		try {
			adminMapper.deleteFYT(a);
			result=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public boolean select(){
		boolean result = false;
		try {
			
			adminMapper.queryProvince();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public boolean updateFYT(AdminAdd_FYT_Po a) {
		// TODO Auto-generated method stub
		boolean sign = false;
		try {
			int result = adminMapper.updateFYT(a);
			if(result > 0){
				sign = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}
	
	public List<AdminAdd_FYT_Po> queryAll(){
		return adminMapper.queryProvince();
	}
	
	public AdminAdd_FYT_Po selectUpdate(String id){
		return adminMapper.selectUpdate(id);
	}
	
	public boolean insertYP(AdminAdd_YP_Po a){
		boolean result = false;
		try {
			adminMapper.insertYP(a);
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<AdminAdd_YP_Po> selectYP(){
		return adminMapper.selectYP();
	}
	
	public AdminAdd_YP_Po selectUpdateYP(String id){
		return adminMapper.selectUpdateYP(id);
	}
	
	public boolean updateYP(AdminAdd_YP_Po a) {
		// TODO Auto-generated method stub
		boolean sign = false;
		try {
			int result = adminMapper.updateYP(a);
			if(result > 0){
				sign = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}
	
	public boolean deleteYP(AdminAdd_YP_Po a){
		boolean result = false;
		try {
			adminMapper.deleteYP(a);
			result=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean shangying(AdminSY_Po a){
		boolean result = false;
		
		try {
			System.out.println(a.getRtime());
			System.out.println(a.getYpname());
			System.out.println(a.getFytname());
			adminMapper.shangying(a);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<AdminSY_Po> selectshangying(){
		return adminMapper.selectshangying();
	}
	
	public boolean deleteSY(String id ){
		boolean result = false;
		try {
			adminMapper.deleteSY(id);
			result=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<AdminC_Po> queryProvince1(Page p){
		return adminMapper.queryProvince1(p);
	}
	
	public UserZC_Po cUser(String id){
		return adminMapper.cUser(id);
	}
}
