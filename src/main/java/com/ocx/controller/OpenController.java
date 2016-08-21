package com.ocx.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ocx.domain.AjaxResult;

@Controller
@RequestMapping("/open")
public class OpenController extends BaseController {

	@RequestMapping("/toOpen")
	public String toOpen(HttpServletRequest request) {
		return "/open";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult save(String photoData,String pwd, String rePwd, String phoneNum) {
		System.out.println(photoData + "======");
		System.out.println(phoneNum);
		System.out.println(pwd);
		System.out.println(rePwd);
		
		return AjaxResult.success();
	}
	
	@RequestMapping("/success")
	public String success() {
		
		return "/success";
	}
	
	@RequestMapping("/book")
	public String book() {
		
		return "/book";
	}
}
