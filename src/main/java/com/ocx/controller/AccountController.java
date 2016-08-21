package com.ocx.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ocx.common.BackConstants;
import com.ocx.domain.AjaxResult;
import com.ocx.util.VerificationCodeImage;

@Controller
public class AccountController extends BaseController {

	@RequestMapping("/toLogin")
	public String toLogin() {
		
		return "/login";
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public AjaxResult login(String username, String pwd, String codeImg, String activityName, HttpServletRequest request) {
		
		System.out.println(username + " " + pwd + " " + codeImg + " " +  activityName);
		
		Object obj_code = request.getSession().getAttribute(BackConstants.SESSION_CODE_AUTO_IMG);
		if (null == obj_code) {
			return AjaxResult.failed("验证码过期，请刷新");
		}
		if (!obj_code.toString().equalsIgnoreCase(codeImg)) {
			return AjaxResult.failed("验证码不正确");	
		}
		
		Object objCount = request.getSession().getAttribute(BackConstants.SESSION_LOGIN_ERROR_COUNT);
		if (null != objCount && 5 <= Integer.parseInt(objCount.toString())) {
			return AjaxResult.failed("登录频繁，请半小时后登录");
		}
		
		//TODO 校验用户名和密码 for update 防止并发
		boolean right = true;
		if (!right) {
			String count = null == objCount ? "1" : objCount.toString();
			request.getSession().setAttribute(BackConstants.SESSION_LOGIN_ERROR_COUNT, String.valueOf(Integer.parseInt(count)+1));
			return AjaxResult.failed("账号或者密码错误");
		} else {
			request.getSession().removeAttribute(BackConstants.SESSION_LOGIN_ERROR_COUNT);
		}
		
		request.getSession().removeAttribute(BackConstants.SESSION_CODE_AUTO_IMG);
		request.getSession().setAttribute(BackConstants.SESSION_LOGIN_USER_NAME, username);
		
		return AjaxResult.success();
	}
	
	@RequestMapping("/codeImage")
	public void codeImage(HttpServletRequest request, HttpServletResponse response) {
		
		response.setHeader("Pragma","No-cache");     
        response.setHeader("Cache-Control","no-cache");     
        response.setDateHeader("Expires", 0);     
        response.setContentType("image/jpeg");    
		
        HttpSession session = request.getSession(true); 
        
        Map map = VerificationCodeImage.createImage();
        session.setAttribute(BackConstants.SESSION_CODE_AUTO_IMG, map.get("codes"));
        
        try {
			ImageIO.write((BufferedImage)map.get("image"), "JPEG", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
