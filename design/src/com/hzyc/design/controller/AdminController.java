package com.hzyc.design.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.design.po.AdminAdd_FYT_Po;
import com.hzyc.design.po.AdminAdd_YP_Po;
import com.hzyc.design.po.AdminC_Po;
import com.hzyc.design.po.AdminSY_Po;
import com.hzyc.design.po.Page;
import com.hzyc.design.po.UserZC_Po;
import com.hzyc.design.service.AdminService;



@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private Page page;
	
	@RequestMapping("/addFYT.do")
	public String add(String name,String type,String admin,AdminAdd_FYT_Po a){
		try {
			a.setName(name);
			a.setType(type);
			a.setAdmin(admin);
			
			boolean result =adminService.insertUser(a);
			if(result){
				return "select.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	@RequestMapping("/delete.do")
	public String delete(AdminAdd_FYT_Po a){
		try {
			boolean result=adminService.delete(a);
			if(result){
				return "select.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("/updateFYT.do")
	public String updateGoodById(AdminAdd_FYT_Po a){
		try {
			boolean result = adminService.updateFYT(a);
			if(result){
				//返回值String,可以返回jsp页面，也可以返回.do请求
				return "select.do";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	@RequestMapping("/select.do")
	public ModelAndView select(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		boolean result =adminService.select();
		if(result){
			List<AdminAdd_FYT_Po> gList = adminService.queryAll();
			modelAndView.addObject("a",gList);
			if(request.getParameter("XG")!=null){
				modelAndView.addObject("b",request.getParameter("XG"));
			}
			modelAndView.setViewName("selectFYT.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping("/selectUpdate.do")
	public ModelAndView getById(String id){
		ModelAndView modelAndView = new ModelAndView();
		try {
			AdminAdd_FYT_Po a = adminService.selectUpdate(id);
			modelAndView.addObject("AdminAdd_FYT_Po", a);
			modelAndView.setViewName("updateFYT.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return modelAndView;
	}
	
	@RequestMapping("/insertYP.do")
	public String insertYP(AdminAdd_YP_Po a,String photo,String name,String director,String actor,String country,String language,String duration,String content,String rtime,String otime,MultipartFile userFile,HttpServletRequest request){
		try {
			String userPhoto = userFile.getOriginalFilename();
			String z = "images/"+userPhoto;
			a.setPhoto(z);
			String tomcatPath = request.getSession().getServletContext().getRealPath("/images");
			File file = new File(tomcatPath+"/"+userPhoto);
			userFile.transferTo(file);
			a.setName(name);
			a.setDirector(director);
			a.setActor(actor);
			a.setCountry(country);
			a.setLanguage(language);
			a.setDuration(duration);
			a.setDuration(duration);
			a.setContent(content);
			a.setRtime(rtime);
			a.setOtime(otime);
			
			boolean x= adminService.insertYP(a);
			if(x){
				return "selectYP.do";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("/selectYP.do")
	public ModelAndView selectYP(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		
		List<AdminAdd_YP_Po> photo = adminService.selectYP();
		/*for(int i=0;i<photo.size();i++){
			 a =photo.get(i);
		}
		String x = "images/" + a.getPhoto();
		System.out.println(x);*/
		modelAndView.addObject("p", photo);
		modelAndView.setViewName("updateYP.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/select_update_YP.do")
	public ModelAndView select_update_YP(HttpServletRequest request,String id){
		ModelAndView modelAndView = new ModelAndView();
		
		id = request.getParameter("ID");
		AdminAdd_YP_Po a = adminService.selectUpdateYP(id);
		modelAndView.addObject("AdminAdd_YP_Po", a);
		modelAndView.setViewName("select_update_YP.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/updateYP.do")
	public String updateYP(AdminAdd_YP_Po a){
		try {
			boolean result = adminService.updateYP(a);
			if(result){
				//返回值String,可以返回jsp页面，也可以返回.do请求
				return "selectYP.do";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	@RequestMapping("/deleteYP.do")
	public String deleteYP(AdminAdd_YP_Po a){
		try {
			boolean result=adminService.deleteYP(a);
			if(result){
				return "selectYP.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("/shangying.do")
	public ModelAndView shangying(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		List<AdminAdd_YP_Po> jilu = adminService.selectYP();
		List<AdminAdd_FYT_Po> fyt = adminService.queryAll();
		modelAndView.addObject("zhi", fyt);
		modelAndView.addObject("a", jilu);
		modelAndView.setViewName("adminSY.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/dianjiSY.do")
	public String dianjiSY(HttpServletRequest request,AdminSY_Po a){
		String id = request.getParameter("id");
		String fytname = request.getParameter("fyt");
		AdminAdd_YP_Po x = adminService.selectUpdateYP(id);
		String ypname = x.getName();
		String rtime = x.getRtime();
		a.setFytname(fytname);
		a.setRtime(rtime);
		a.setYpname(ypname);
		adminService.shangying(a);
		
		return "chenggong.jsp";
	}
	
	@RequestMapping("/xiajia.do")
	public ModelAndView selectshangying(){
		ModelAndView modelAndView = new ModelAndView();
		List<AdminSY_Po> jilu = adminService.selectshangying();
		modelAndView.addObject("a",jilu);
		modelAndView.setViewName("adminXJ.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/dianjiXJ.do")
	public String dianjiXJ(HttpServletRequest request,AdminSY_Po a){
		
		String id = request.getParameter("id");
		
		adminService.deleteSY(id);
		
		return "chenggong.jsp";
	}
	
	@RequestMapping("/cxmx.do")
	public ModelAndView queryProvince1(){
		ModelAndView modelAndView = new ModelAndView();
		AdminAdd_YP_Po a = null ;
		List<String> b = new ArrayList<String>();
		UserZC_Po c = null ;
		List<String> d = new ArrayList<String>();
		try {
			
			page.calculatePosition();
			List<AdminC_Po> pList = adminService.queryProvince1(page);
			for(int i=0;i<pList.size();i++){
				a=adminService.selectUpdateYP(pList.get(i).getFid());
				b.add(i, a.getName());
				c=adminService.cUser(pList.get(i).getUid());
				d.add(i, c.getUsername());
			}
			
			modelAndView.addObject("Page", page);
			modelAndView.addObject("pList" ,pList);
			modelAndView.addObject("b" ,b);
			modelAndView.addObject("d" ,d);
			modelAndView.setViewName("admin_cxmx.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return modelAndView;
	}
	@RequestMapping("/pageUp.do")
	public String toUp(int nowPage){
		//获取当前页
		/*nowPage = nowPage <= 1 ? 1 : nowPage - 1;
		page.setCurrentPage(nowPage);*/
		page.pageUp(nowPage);
		
		return "cxmx.do";
	}
	
	@RequestMapping("/pageDown.do")
	public String toDown(int nowPage){
		
		/*nowPage = nowPage + 1;
		page.setCurrentPage(nowPage);*/
		page.pageDown(nowPage);
		
		return "cxmx.do";
		
	}
}
