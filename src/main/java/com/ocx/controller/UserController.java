package com.ocx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ocx.common.BackConstants;
import com.ocx.domain.AjaxResult;

@Controller
@RequestMapping("/userInfo")
public class UserController extends BaseController {
	
	@RequestMapping("/toUser")
	public String toUser(HttpServletRequest request) {
		return "/user";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public AjaxResult save(String realname, String sex, String idcode, String photoData) {
		
		System.out.println(realname);
		System.out.println(sex);
		System.out.println(idcode);
		System.out.println(photoData);
		
		return AjaxResult.success();
	}
	
	@RequestMapping("/toPwd")
	public String toPwd() {
		return "/password";
	}
	
	@RequestMapping("/modifyPwd")
	@ResponseBody
	public AjaxResult modifyPwd(String oldPwd, String newpwd, String reNewPwd, HttpSession session) {
		
		if (!newpwd.equals(reNewPwd)) {
			return AjaxResult.failed("两次密码不一致");
		}
		
		//TODO 验证新密码
		
		//移除登录信息，重新登录
		session.removeAttribute(BackConstants.SESSION_LOGIN_USER_NAME);
		
		return AjaxResult.success();
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null != session) {
			session.invalidate();
		}
		
		return "/login";
	}

}
