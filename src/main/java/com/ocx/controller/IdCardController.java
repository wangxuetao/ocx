package com.ocx.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ocx.domain.AjaxResult;
import com.ocx.domain.IdCardInfo;

@Controller
public class IdCardController extends BaseController {

	@RequestMapping("/index")
	public String index() {

		return "/index";
	}
	
	@RequestMapping("/saveIdCardInfo")
	public String saveIdCardInfo(IdCardInfo idCardInfo) {
		
		log.info(idCardInfo.getIdCode());
		log.info(idCardInfo.getSex());
		log.info(idCardInfo.getUsername());
		log.info(idCardInfo.getPhotoData());
		
		return "redirect:/index.html";
	}
	
	@RequestMapping("/savePhoto")
	public AjaxResult savePhoto(HttpServletRequest request) throws Exception {
		System.out.println("---begin---");
		
		String avatar = request.getParameter("avatar");
		
//        BufferedInputStream bis = new BufferedInputStream(new ByteArrayInputStream(Base64.decodeBase64(avatar)));
//        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File("d:\\poto.jpg")));
//        byte size[] = new byte[1024];
//        int length = 0;
//        while (-1 != (length = bis.read(size))) {
//        	System.out.println(length);
//        	bos.write(size, 0, length);
//        	bos.flush();
//        }
//        
//		bos.close();
//		bis.close();
		System.out.println("---over----");
		return AjaxResult.success("good");
	}
	
	
	
}
