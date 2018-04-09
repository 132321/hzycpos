package com.hzyc.design.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.design.po.AdminAdd_YP_Po;
import com.hzyc.design.po.AdminSY_Po;
import com.hzyc.design.po.UserZC_Po;
import com.hzyc.design.service.AdminService;
import com.hzyc.design.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/zhuce.do")
	public String ZC(UserZC_Po u,String name,String username,String password,String email,String sex){
		u.setName(name);
		u.setPassword(password);
		u.setUsername(username);
		u.setSex(sex);
		u.setEmail(email);
		
		boolean a=userService.ZC(u);
		if(a){
			return "chenggong.jsp";
		}
		
		return "";
	}
	
	@RequestMapping("/denglu.do")
	public String DL(String username,String password,HttpSession session){
		
		UserZC_Po u = userService.DL(username);
		
		if(u.getPassword().equals(password)){
			session.setAttribute("username", username);
			return "";
		}
		
		
		return "denglu.do";
		
	}
	
	@RequestMapping("/tuichu.do")
	public String tuichu(HttpSession session){
		session.invalidate();
		return "";
	}
	
	@RequestMapping("/userXS.do")
	public ModelAndView xs(){
		HashSet<String> hash = new HashSet<String>();
		List<String> b = new ArrayList<String>();
		String c =null;
		ModelAndView modelAndView = new ModelAndView();
		AdminAdd_YP_Po k = null;
		List<AdminSY_Po> a = adminService.selectshangying();
		
		
		
		for(int i=0;i<a.size();i++){
			String temp = a.get(i).getYpname();
			hash.add(temp);
		}
		Iterator<String> iter = hash.iterator();
		while(iter.hasNext()){
			
			k = userService.XS(iter.next());
			
			b.add(k.getPhoto());
			
		}
		
		modelAndView.addObject("b", b);
		modelAndView.setViewName("userXS.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/userSelect.do")
	public ModelAndView userSelect(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		String photo = request.getParameter("photo");
		AdminAdd_YP_Po a = userService.XSxuanzuo(photo);
		List<AdminSY_Po> b = userService.sFbN(a.getName());
		modelAndView.addObject("AdminAdd_YP_Po",a);
		modelAndView.addObject("b",b);
		modelAndView.setViewName("xsxuanzuo.jsp");
		
		return modelAndView;
	}

}
