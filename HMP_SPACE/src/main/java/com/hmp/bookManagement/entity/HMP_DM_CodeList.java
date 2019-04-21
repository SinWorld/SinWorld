package com.hmp.bookManagement.entity;

/**
 * 字典表
 * 
 * @author NingCG
 *
 */
public class HMP_DM_CodeList {
	private Integer codelist_id;// 主键
	private Integer codelist_code;// 状态值
	private String codelist_mean;// 状态值含义
	private String codelist_type;// 标志位

	public Integer getCodelist_id() {
		return codelist_id;
	}

	public void setCodelist_id(Integer codelist_id) {
		this.codelist_id = codelist_id;
	}

	public Integer getCodelist_code() {
		return codelist_code;
	}

	public void setCodelist_code(Integer codelist_code) {
		this.codelist_code = codelist_code;
	}

	public String getCodelist_mean() {
		return codelist_mean;
	}

	public void setCodelist_mean(String codelist_mean) {
		this.codelist_mean = codelist_mean;
	}

	public String getCodelist_type() {
		return codelist_type;
	}

	public void setCodelist_type(String codelist_type) {
		this.codelist_type = codelist_type;
	}

	@Override
	public String toString() {
		return "HMP_DM_CodeList [codelist_id=" + codelist_id + ", codelist_code=" + codelist_code + ", codelist_mean="
				+ codelist_mean + ", codelist_type=" + codelist_type + "]";
	}
}
