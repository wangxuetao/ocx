package com.ocx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
