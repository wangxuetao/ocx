package com.ocx.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.WebUtils;

import com.ocx.common.BackConstants;

public abstract class BaseController {

	protected final Logger log = LoggerFactory.getLogger(this.getClass());

	protected String currentUsername(HttpServletRequest request) {
		Object obj = WebUtils.getSessionAttribute(request, BackConstants.SESSION_LOGIN_USER_NAME);
		return null == obj ? "" : obj.toString();
	}
}
