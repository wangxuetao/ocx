package com.ocx.domain;

/**
 * 身份证信息
 *
 * 2016年8月3日
 */
public class IdCardInfo {

	/**
	 * 身份证号
	 */
	private String idCode;
	
	/**
	 * 姓名
	 */
	private String username;
	
	/**
	 * 性别
	 */
	private String sex;
	
	/**
	 * 照片base64字符串
	 */
	private String photoData;

	public String getIdCode() {
		return idCode;
	}

	public void setIdCode(String idCode) {
		this.idCode = idCode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhotoData() {
		return photoData;
	}

	public void setPhotoData(String photoData) {
		this.photoData = photoData;
	}

}
