package com.ocx.domain;

public class AjaxResult {

	private final static int SUCCESS_CODE = 1000;
	private final static int ERROR_CODE = 9999;
	private int code;
	private Object data;
	private String message;

	public boolean getSuccess() {
		return this.code == SUCCESS_CODE;
	}

	public Object getData() {
		return data;
	}

	public String getMessage() {
		return message;
	}

	private AjaxResult(int code, String message, Object obj) {
		this.code = code;
		this.data = obj;
		this.message = message;
	}

	public static AjaxResult success() {

		return new AjaxResult(SUCCESS_CODE, "", "");
	}

	public static AjaxResult success(Object obj) {

		return new AjaxResult(SUCCESS_CODE, "", obj);
	}

	public static AjaxResult success(String msg) {

		return new AjaxResult(SUCCESS_CODE, msg, "");
	}
	
	public static AjaxResult failed(String msg) {

		return new AjaxResult(ERROR_CODE, msg, "");
	}

}
